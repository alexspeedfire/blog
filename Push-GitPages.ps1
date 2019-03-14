<#
.SYNOPSIS   
������, ��������������� ��� ������ ����� �� github.io

.DESCRIPTION 
���� ������ ������������ � ������ � hugo � git ��� ������ �����, ���������� hugo �� github pages.

.PARAMETER Message
�������� ��������� ������ ��������� ��������� � �������.

.NOTES   
Name: Push-GitPages.ps1
Author: Alex Speedfire
DateCreated: 2019-03-14
DateUpdated: 2019-03-14
Site: https://alexspeedfire.github.io/
Version: 0.0.1

.LINK
https://alexspeedfire.github.io/

.EXAMPLE
	.\Push-GitPages.ps1

Description
-----------
��� ������� ������ � ������� hugo ���� � ������� ��� �� github � ������ ��������� "rebuilding site %date%"

.EXAMPLE
	.\Push-GitPages.ps1 -Message "Commit Message"

Description
-----------
��� ������� ������ � ������� hugo ���� � ������� ��� �� github � ������ ��������� "Commit Message"
#>

param(
	[string]$Message = "Rebuilding site "+(Get-Date).ToString("yyyyMMdd")
)

Write-Host "Deploying updates to GitHub..."

# �������� ����.
hugo

# ������ � ����� � ��������� ������.
cd public
# ��������� ��������� � ���
git add .

# �������� ���������.
git commit -m "$Message"

# ����� �� �� ������
git push origin master

# ������������ �������
cd ..

# �������� � �������� �����������.
git add .

# �������� ���������.
git commit -m "$Message"

# ����� �� �� ������
git push origin master
