Param(
    $dnsName = "",
    $file = "",
    $secret = "secret"
)

[X509Certificate]$cert = New-SelfSignedCertificate -certstorelocation cert:\localmachine\my -dnsname $dnsName -KeyExportPolicy Exportable `
-Provider "Microsoft Strong Cryptographic Provider" `
-HashAlgorithm "SHA256";

$pwd = ConvertTo-SecureString -String $secret -Force -AsPlainText

Export-PfxCertificate -cert $cert -FilePath $file -Password $pwd
