local _binaryUrl =  "https://github.com/coinlqx/lqx/releases/download/0.16.0.5/lqx-0.16.0.5-static.tar.gz"

am.app.set_model({DAEMON_URL = _binaryUrl, DAEMON_ARCHIVE_KIND="tar.gz"}, {merge = true, overwrite = true})

am.app.set_model(
    {
        DAEMON_CONFIGURATION = {
            server = (type(am.app.get_configuration("NODE_PRIVKEY") == "string") or am.app.get_configuration("SERVER")) and 1 or nil,
            listen = (type(am.app.get_configuration("NODE_PRIVKEY") == "string") or am.app.get_configuration("SERVER")) and 1 or nil,
            masternodeprivkey = am.app.get_configuration("NODE_PRIVKEY"),
            masternode = am.app.get_configuration("NODE_PRIVKEY") and 1 or nil
        },
        DAEMON_NAME = "lqxd",
        CLI_NAME = "lqx-cli",
        CONF_NAME = "lqx.conf",
        CONF_SOURCE = "__btc/assets/daemon.conf",
        SERVICE_NAME = "lqxd",
        ABOUT_SOURCE = "__lqx/about.hjson"
    },
    { merge = true, overwrite = true }
)