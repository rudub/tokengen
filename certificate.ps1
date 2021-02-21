import-module webadministration


$cert = New-SelfSignedCertificate -DnsName myweb -Friendlyname MyCert -CertStoreLocation Cert:\LocalMachine\My

$rootStore = New-Object System.Security.Cryptography.X509Certificates.X509Store -ArgumentList Root, LocalMachine

$rootStore.Open("MaxAllowed")
$rootStore.Add($cert)
$rootStore.Close()

#Remove-WebSite -Name 'tokengenerator' 
new-item -path IIS:\SslBindings\0.0.0.0!443 -value $cert
#New-Website -Name 'tokengenerator' -Port 443 -PhysicalPath 'c:\tokengenerator' -ApplicationPool '.NET v4.5'
New-WebBinding -Name "tokengenerator" -IP "*" -Port 443 -Protocol https
iisreset
