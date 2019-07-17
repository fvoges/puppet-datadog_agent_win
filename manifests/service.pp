# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include datadog_agent_win::service
class datadog_agent_win::service {
  $agent_service   = $datadog_agent_win::agent_service
  $process_enable  = $datadog_agent_win::process_enable
  $process_service = $datadog_agent_win::process_service
  $trace_service   = $datadog_agent_win::trace_service

  $process_ensure = $process_enable ? {
    true    => 'running',
    default => 'stopped',
  }

  service { $agent_service:
    ensure => 'running',
    enable => true,
  }

  service { $process_service:
    ensure => $process_ensure,
    enable => $process_enable,
  }
}
