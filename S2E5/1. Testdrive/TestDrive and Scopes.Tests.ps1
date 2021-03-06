Describe "TestDrive Scopes" {

    $TestDrive

    New-Item -ItemType File -Path TestDrive:\DescribeScope.txt

    It 'Should have a describe scope file'{
        Test-Path TestDrive:\DescribeScope.txt | Should -Be true
    }
    
    Context 'TestDrive1' {
        
        New-Item -ItemType File -Path TestDrive:\Context1.txt

        It 'Should have a describe scope file' {
            Test-Path TestDrive:\DescribeScope.txt | Should -Be true
        }

        It 'Should have a Context1 file' {
            Test-Path TestDrive:\Context1.txt | Should -Be true
        }
    }

    Context 'TestDrive2' {
        
        New-Item -ItemType File -Path TestDrive:\Context2.txt

        It 'Should have a describe scope file' {
            Test-Path TestDrive:\DescribeScope.txt | Should -Be true
        }

        It 'Should not have a Context1 file' {
            Test-Path TestDrive:\Context1.txt | Should -Be false
        }

        It 'Should have a Context2 file' {
            Test-Path TestDrive:\Context2.txt | Should -Be true
        }
    }

    Context 'TestDrive manipulation' {
        
        Rename-Item TestDrive:\DescribeScope.txt ReNamed.txt

        It 'Should have renamed the file' {      
            Test-Path TestDrive:\Renamed.txt | Should -Be true
        }
    }

    It 'Should NOT have a describe scope file' {
        Test-Path TestDrive:\DescribeScope.txt | Should -Be false
    }

    It 'Should NOT have a renamed scope file' {
        Test-Path TestDrive:\Renamed.txt | Should -Be false
    }
 }