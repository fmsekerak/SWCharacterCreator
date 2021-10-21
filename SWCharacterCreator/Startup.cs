using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SWCharacterCreator.Startup))]
namespace SWCharacterCreator
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
