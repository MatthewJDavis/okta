# Should be run from directory where the tfplan.json is - see Makefile.
BeforeAll {
  $data = Get-Content -Path 'tfplan.json' | ConvertFrom-Json
  $ruleData = $data.resource_changes | Where-Object -Property type -eq 'okta_app_signon_policy_rule'
  $policyData = $data.resource_changes | Where-Object -Property type -eq 'okta_app_signon_policy'
}

# Example of testing for constraints.
Describe 'Possession based constraint' {
  It 'Is phishing resistant.' {
    ($ruleData.change.after.constraints | Out-String) -match '"phishingResistant":"REQUIRED"' | Should -eq $true
  }
  It 'Is device bound.' {
    ($ruleData.change.after.constraints | Out-String) -match '"deviceBound":"REQUIRED"' | Should -eq $true
  }
}
