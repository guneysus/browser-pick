using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;

using YamlDotNet.Serialization;
using System.Runtime.InteropServices;

namespace BrowserPick
{
    internal static class Program
    {
        [DllImport("kernel32.dll")] static extern IntPtr GetConsoleWindow();

        [DllImport("user32.dll")] static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

        const int SW_HIDE = 0;
        const int SW_SHOW = 5;

        static void Main(string[] args)
        {
            _ = ShowWindow(GetConsoleWindow(), SW_HIDE);
            RuleEngine.New(Config.Factory())(new Uri(args[0])).Run(args[0]);
        }

        public static class RuleEngine
        {
            public static Func<Uri, BrowserInfo> New(Config config)
            {
                return uri =>
                {
                    var otherwise = config.Rules.Where(x => !string.IsNullOrEmpty(x.Otherwise)).Single().Otherwise;

                    foreach (var rule in config.Rules)
                    {
                        switch (rule.When)
                        {
                            case Prop.Host:
                                {
                                    if (!string.IsNullOrEmpty(rule.Contains) && !string.IsNullOrEmpty(rule.Then) && uri.Host.Contains(rule.Contains))
                                        return config.Browsers[rule.Then];
                                    break;
                                }
                        }
                    }

                    return config.Browsers[otherwise];
                };
            }


        }

        public class Config
        {
            public Dictionary<string, BrowserInfo> Browsers { get; set; }
            public List<RuleInfo> Rules { get; set; }

            public static Config Factory()
            {
                return new DeserializerBuilder()
                    .WithNamingConvention(YamlDotNet.Serialization.NamingConventions.CamelCaseNamingConvention.Instance)
                    .Build().Deserialize<Config>(File.ReadAllText(Path.Join(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".browserpick.yml")));
            }
        }

        public class Project
        {
            public string Pwd { get; set; }
            public string Cmd { get; set; }
        }
    }

    public class RuleInfo
    {
        public Prop When { get; set; }
        public string Contains { get; set; }
        public string Otherwise { get; set; }
        public string Then { get; set; }
    }

    public enum Prop
    {
        Host
    }

    public class BrowserInfo
    {
        public string Path { get; set; }
        public void Run(string uriString) => _ = Process.Start(new ProcessStartInfo()
        {
            FileName = Path,
            Arguments = uriString,
        });
    }
}
