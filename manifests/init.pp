# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include datadog_agent_win
class datadog_agent_win (
  String $api_key,
  Enum['datadoghq.com', 'datadoghq.eu'] $site         = 'datadoghq.com',
  String                                $version      = '6.12.2',
  String                                $archive_name = "ddagent-cli-${version}.msi",
  String                                $download_url = "https://s3.amazonaws.com/ddagent-windows-stable/${archive_name}",
  String                                $tmp_dir      = 'C:\WINDOWS\TEMP',
) {
  contain datadog_agent_win::install
  contain datadog_agent_win::config
  contain datadog_agent_win::service

  Class[datadog_agent_win::install] -> Class[datadog_agent_win::config] ~> Class[datadog_agent_win::service]
}
