FROM microsoft/iis
SHELL ["powershell"]

RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45

COPY token-generator tokengenerator
RUN Remove-WebSite -Name 'Default Web Site'
RUN New-Website -Name 'tokengenerator' -Port 80 \
    -PhysicalPath 'c:\tokengenerator' -ApplicationPool '.NET v4.5'
EXPOSE 80
