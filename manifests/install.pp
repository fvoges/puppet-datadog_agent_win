# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include datadog_agent_win::install
class datadog_agent_win::install {
  $archive_name = $::datadog_agent_win::archive_name
  $download_url = $::datadog_agent_win::download_url
  $version      = $::datadog_agent_win::version
  $tmp_dir      = $::datadog_agent_win::tmp_dir
  $api_key      = $::datadog_agent_win::api_key
  $site         = $::datadog_agent_win::site

  archive { $archive_name:
    path    => "${tmp_dir}/${archive_name}",
    source  => $download_url,
    extract => false,
  }

  package { 'datadog_agent':
    ensure          => 'present',
    source          => "${tmp_dir}/${archive_name}",
    install_options => [{
        'APIKEY' => $api_key,
        'SITE'   => $site,
      }
    ],

  }
}
