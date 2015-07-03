describe 'housepub-hyperv' {
	It 'should be running Hyper-V Data Exchange Service' {
		(Get-Service -name 'vmickvpexchange').status | Should Be 'Running'
	}

	It 'should be running Hyper-V Guest Shutdown Service' {
		(Get-Service -name 'vmicshutdown').status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Heartbeat Service' {
		(Get-Service -name 'vmicheartbeat').status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Remote Desktop Virtualization Service' {
		(Get-Service -name 'vmicrdv').status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Time Synchronization Service' {
		(Get-Service -name 'vmictimesync').status | Should Be 'Running'
	}

	It 'Should be running Hyper-V Volume Shadow Copy Requestor Service' {
		(Get-Service -name 'vmicvss').status | Should Be 'Running'
	}
}