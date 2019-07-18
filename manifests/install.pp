# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include datadog_agent_win::install
class datadog_agent_win::install {
  $api_key         = $::datadog_agent_win::api_key
  $archive_name    = $::datadog_agent_win::archive_name
  $download_url    = $::datadog_agent_win::download_url
  $hostname        = $::datadog_agent_win::hostname
  $real_version    = $::datadog_agent_win::real_version
  $site            = $::datadog_agent_win::site
  $tags            = $::datadog_agent_win::tags
  $tmp_dir         = $::datadog_agent_win::tmp_dir
  $version         = $::datadog_agent_win::version

  # lint:ignore:quoted_booleans
  $logs_enable    = $::datadog_agent_win::logs_enable ? {
    true    => 'true',
    default => 'false',
  }

  $process_enable = $::datadog_agent_win::process_enable ? {
    true    => 'true',
    default => 'false',
  }
  # lint:endignore

  archive { $archive_name:
    path    => "${tmp_dir}/${archive_name}",
    source  => $download_url,
    extract => false,
  }

  package { 'Datadog Agent':
    ensure          => $real_version,
    source          => "${tmp_dir}/${archive_name}",
    install_options => [
      { 'APIKEY'          => $api_key, },
      { 'HOSTNAME'        => $hostname, },
      { 'LOGS_ENABLED'    => $logs_enable, },
      { 'PROCESS_ENABLED' => $process_enable, },
      { 'SITE'            => $site, },
      { 'TAGS'            => $tags.join(','), },
    ],
  }
}
