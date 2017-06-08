control 'Java 8' do
  impact 1.0
  title 'Java 8 should be installed'
  describe package('java-1.8.0-openjdk') do
    it { should be_installed }
  end
  describe package('java-1.8.0-openjdk-devel') do
    it { should be_installed }
  end
end

control 'unzip' do
  impact 1.0
  title 'unzip should be installed'
  describe package('unzip') do
    it { should be_installed }
  end
end

control 'wget' do
  impact 1.0
  title 'wget should be installed'
  describe package('wget') do
    it { should be_installed }
  end
end

control 'Environment Variables' do
  impact 1.0
  title 'Set environment variables'
  describe os_env('JAVA_HOME') do
    its('content') { should eq '/usr/lib/jvm/java-1.8.0-openjdk' }
  end
  describe os_env('APPSRV_HOME') do
    its('content') { should eq '/opt/wildfly' }
  end
  describe os_env('ANT_HOME') do
    its('content') { should eq '/opt/ant' }
  end
end

control 'Users' do
  impact 1.0
  title 'Wildfly user'
  describe user('wildfly') do
    it { should exist }
  end
end

control 'File Permissions' do
  impact 1.0
  title 'File Permissions'
  describe file('/opt/ejbca') do
    its('owner') { should eq 'wildfly' }
  end
  describe file('/opt/wildfly') do
    its('owner') { should eq 'wildfly' }
  end
end

control 'Ports' do
  impact 1.0
  title 'Open the ports'
  describe port(8080) do
    it { should be_listening }
  end
  describe port(8442) do
    it { should be_listening }
  end
  describe ssl(port: 8442) do
    it { should be_enabled }
  end
  describe port(8443) do
    it { should be_listening }
  end
  describe ssl(port: 8443) do
    it { should be_enabled }
  end
end
