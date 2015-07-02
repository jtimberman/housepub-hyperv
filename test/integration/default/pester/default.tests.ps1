describe 'housepub-hyperv' do {
	It 'should be running Hyper-V Data Exchange Service' {
		(Get-Service -name).status | Should Be 'Running'
	}

	It 'should be running Hyper-V Guest Shutdown Service' {
		(Get-Service -name).status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Heartbeat Service' {
		(Get-Service -name).status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Remote Desktop Virtualization Service' {
		(Get-Service -name).status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Time Synchronization Service' {
		(Get-Service -name).status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Volume Shadow Copy Requestor Service' {
		(Get-Service -name).status | Should Be 'Running'
	}
}