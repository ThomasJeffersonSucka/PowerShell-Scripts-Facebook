$Form1_Load = {

}

$Import_Servers_Click = {
$openFileDialog1.ShowDialog()
$openFileDialog1.FileName
$servers_checkbox.Items.Clear()
$newserverlist = Get-Content $openFileDialog1.FileName
$servers_checkbox.Items.AddRange($newserverlist)}

$Export_servers_Click = {
$filepath = "$HOME\desktop\server-list.txt"
$servers_checkbox.Items | Out-File $filepath
Start-Process $filepath

}

$Select_all_servers_Click = {
for($i =0; $i -lt $servers_checkbox.Items.Count; $i ++){
$servers_checkbox.SetItemChecked($i,$true)}
}

$Add_server_Click = {
$new_server = $add_server_textbox.Text
$servers_checkbox.Items.add($new_server)
}

$Clear_Servers_Click = {
for($i =0; $i -lt $servers_checkbox.Items.Count; $i ++){
$servers_checkbox.SetItemChecked($i,$false)}
}

$Clear_Results_Click = {
$Results.clear()
}

$Clear_Items_Click = {
$Source_CheckedBox.Items.Clear()
}

$Select_All_Click = {
for($i =0; $i -lt $Source_CheckedBox.Items.Count; $i ++){
$Source_CheckedBox.SetItemChecked($i,$true)}
}

$Copy_Items_Click = {
if($type_Options.SelectedItem -eq 'folder'){$Source = Get-ChildItem -Recurse $Source_CheckedBox.CheckedItems | select -ExpandProperty fullname}
	else{$Source = @()
		foreach($item in $Source_CheckedBox.CheckedItems){$Source.Add($item)}}
$totalfiles = $Source.count
$destination_folder = $richTextBox2.Text
$progressBar1.Maximum = $source.count
$progressBar1.Step = 1
$progressBar1.Value = 0

$severs = $servers_checkbox.CheckedItems

foreach($file in $Source) {
	foreach($server in $servers){
		Invoke-Command -ComputerName $server -ScriptBlock{Copy-Item $file -Destination $destination_folder -Recurse -Force}
		Copy-Item $file -Destination 
	}
$Results.Text += "Copied $file successfully" | ft -AutoSize | Out-String
$progressBar1.PerformStep()
}

foreach($file in $source){$Results.Text += "Copy from $file to $destination_folder has been completed" | ft -AutoSize | Out-String}
}

$Select_Source_Click = {
if($Type_Options.SelectedItem -eq 'folder'){
$folderBrowserDialog1.ShowDialog()
$folderBrowserDialog1.SelectedPath
$Source_CheckedBox.Items.add($folderBrowserDialog1.SelectedPath)}
elseif($Type_Options.SelectedItem -eq 'file(s)'){
$openFileDialog1.ShowDialog()
$openFileDialog1.FileNames
$Source_CheckedBox.Items.Clear()
$Source_CheckedBox.Items.AddRange($openFileDialog1.FileNames)}
else{$Results.Text += "You must select a TYPE" | ft -AutoSize | Out-String}
}

$Select_Destination_Click = {
$folderBrowserDialog1.ShowDialog()
$folderBrowserDialog1.SelectedPath
$richtextBox2.Text = $folderBrowserDialog1.selectedpath
}

[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.ToolTip]$toolTip1 = $null
[System.ComponentModel.IContainer]$components = $null
[System.Windows.Forms.ProgressBar]$progressBar1 = $null
[System.DirectoryServices.DirectorySearcher]$directorySearcher1 = $null
[System.Windows.Forms.FolderBrowserDialog]$folderBrowserDialog1 = $null
[System.Windows.Forms.Button]$Copy_Items = $null
[System.Windows.Forms.RichTextBox]$Results = $null
[System.Windows.Forms.Label]$label2 = $null
[System.Windows.Forms.OpenFileDialog]$openFileDialog1 = $null
[System.Windows.Forms.ComboBox]$type_Options = $null
[System.Windows.Forms.Button]$Select_Source = $null
[System.Windows.Forms.Button]$Select_Destination = $null
[System.Windows.Forms.CheckedListBox]$Source_CheckedBox = $null
[System.Windows.Forms.Label]$label1 = $null
[System.Windows.Forms.Label]$label3 = $null
[System.Windows.Forms.Label]$label4 = $null
[System.Windows.Forms.Button]$Clear_Items = $null
[System.Windows.Forms.Button]$Select_All = $null
[System.Windows.Forms.Button]$Clear_Results = $null
[System.Windows.Forms.RichTextBox]$richTextBox1 = $null
[System.Windows.Forms.RichTextBox]$richTextBox2 = $null
[System.Windows.Forms.Label]$Server_List = $null
[System.Windows.Forms.Button]$add_server = $null
[System.Windows.Forms.Button]$Clear_Servers = $null
[System.Windows.Forms.Button]$export_servers = $null
[System.Windows.Forms.CheckedListBox]$servers_checkbox = $null
[System.Windows.Forms.TextBox]$add_server_textbox = $null
[System.Windows.Forms.Button]$Select_all_servers = $null
[System.Windows.Forms.Button]$Import_Servers = $null
[System.Windows.Forms.RichTextBox]$richTextBox3 = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$components = (New-Object -TypeName System.ComponentModel.Container)
$Copy_Items = (New-Object -TypeName System.Windows.Forms.Button)
$toolTip1 = (New-Object -TypeName System.Windows.Forms.ToolTip -ArgumentList @($components))
$Select_Source = (New-Object -TypeName System.Windows.Forms.Button)
$Select_Destination = (New-Object -TypeName System.Windows.Forms.Button)
$progressBar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$directorySearcher1 = (New-Object -TypeName System.DirectoryServices.DirectorySearcher)
$folderBrowserDialog1 = (New-Object -TypeName System.Windows.Forms.FolderBrowserDialog)
$Results = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$label2 = (New-Object -TypeName System.Windows.Forms.Label)
$openFileDialog1 = (New-Object -TypeName System.Windows.Forms.OpenFileDialog)
$type_Options = (New-Object -TypeName System.Windows.Forms.ComboBox)
$Clear_Results = (New-Object -TypeName System.Windows.Forms.Button)
$Source_CheckedBox = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$label1 = (New-Object -TypeName System.Windows.Forms.Label)
$label3 = (New-Object -TypeName System.Windows.Forms.Label)
$label4 = (New-Object -TypeName System.Windows.Forms.Label)
$Clear_Items = (New-Object -TypeName System.Windows.Forms.Button)
$Select_All = (New-Object -TypeName System.Windows.Forms.Button)
$richTextBox1 = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$richTextBox2 = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$servers_checkbox = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$Server_List = (New-Object -TypeName System.Windows.Forms.Label)
$add_server_textbox = (New-Object -TypeName System.Windows.Forms.TextBox)
$add_server = (New-Object -TypeName System.Windows.Forms.Button)
$Clear_Servers = (New-Object -TypeName System.Windows.Forms.Button)
$Select_all_servers = (New-Object -TypeName System.Windows.Forms.Button)
$export_servers = (New-Object -TypeName System.Windows.Forms.Button)
$Import_Servers = (New-Object -TypeName System.Windows.Forms.Button)
$richTextBox3 = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$Form1.SuspendLayout()
#
#Copy_Items
#
$Copy_Items.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]141,[System.Int32]195))
$Copy_Items.Name = [System.String]'Copy_Items'
$Copy_Items.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]112,[System.Int32]26))
$Copy_Items.TabIndex = [System.Int32]0
$Copy_Items.Text = [System.String]'Copy Items'
$toolTip1.SetToolTip($Copy_Items,[System.String]'Copy')
$Copy_Items.UseVisualStyleBackColor = $true
$Copy_Items.add_Click($Copy_Items_Click)
#
#Select_Source
#
$Select_Source.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]60))
$Select_Source.Name = [System.String]'Select_Source'
$Select_Source.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]145,[System.Int32]26))
$Select_Source.TabIndex = [System.Int32]3
$Select_Source.Text = [System.String]'Select Source'
$toolTip1.SetToolTip($Select_Source,[System.String]'Select the folder path that you want to copy.')
$Select_Source.UseVisualStyleBackColor = $true
$Select_Source.add_Click($Select_Source_Click)
#
#Select_Destination
#
$Select_Destination.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]195))
$Select_Destination.Name = [System.String]'Select_Destination'
$Select_Destination.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]126,[System.Int32]26))
$Select_Destination.TabIndex = [System.Int32]5
$Select_Destination.Text = [System.String]'Select Destination'
$toolTip1.SetToolTip($Select_Destination,[System.String]'Select the folder path that you want to copy.')
$Select_Destination.UseVisualStyleBackColor = $true
$Select_Destination.add_Click($Select_Destination_Click)
#
#progressBar1
#
$progressBar1.BackColor = [System.Drawing.SystemColors]::Info
$progressBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]301))
$progressBar1.Name = [System.String]'progressBar1'
$progressBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]23))
$progressBar1.TabIndex = [System.Int32]1
#
#directorySearcher1
#
$directorySearcher1.ClientTimeout = [System.TimeSpan]::Parse([System.String]'-00:00:01')

$directorySearcher1.ServerPageTimeLimit = [System.TimeSpan]::Parse([System.String]'-00:00:01')

$directorySearcher1.ServerTimeLimit = [System.TimeSpan]::Parse([System.String]'-00:00:01')

#
#Results
#
$Results.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Results.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]395))
$Results.Name = [System.String]'Results'
$Results.ReadOnly = $true
$Results.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]723,[System.Int32]83))
$Results.TabIndex = [System.Int32]8
$Results.Text = [System.String]''
#
#label2
#
$label2.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]61))
$label2.Name = [System.String]'label2'
$label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]93,[System.Int32]24))
$label2.TabIndex = [System.Int32]11
$label2.Text = [System.String]'Which Type?'
$label2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#openFileDialog1
#
$openFileDialog1.FileName = [System.String]'openFileDialog1'
$openFileDialog1.Multiselect = $true
#
#type_Options
#
$type_Options.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$type_Options.FormattingEnabled = $true
$type_Options.ItemHeight = [System.Int32]13
$type_Options.Items.AddRange([System.Object[]]@([System.String]'File(s)',[System.String]'Folder'))
$type_Options.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]88))
$type_Options.Name = [System.String]'type_Options'
$type_Options.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]93,[System.Int32]21))
$type_Options.TabIndex = [System.Int32]12
#
#Clear_Results
#
$Clear_Results.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]366))
$Clear_Results.Name = [System.String]'Clear_Results'
$Clear_Results.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$Clear_Results.TabIndex = [System.Int32]14
$Clear_Results.Text = [System.String]'Clear'
$Clear_Results.UseVisualStyleBackColor = $true
$Clear_Results.add_Click($Clear_Results_Click)
#
#Source_CheckedBox
#
$Source_CheckedBox.BackColor = [System.Drawing.SystemColors]::Info
$Source_CheckedBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Source_CheckedBox.FormattingEnabled = $true
$Source_CheckedBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]36))
$Source_CheckedBox.Name = [System.String]'Source_CheckedBox'
$Source_CheckedBox.ScrollAlwaysVisible = $true
$Source_CheckedBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]17))
$Source_CheckedBox.TabIndex = [System.Int32]15
#
#label1
#
$label1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]9))
$label1.Name = [System.String]'label1'
$label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]23))
$label1.TabIndex = [System.Int32]17
$label1.Text = [System.String]'Source'
$label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#label3
#
$label3.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$label3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]140))
$label3.Name = [System.String]'label3'
$label3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]23))
$label3.TabIndex = [System.Int32]18
$label3.Text = [System.String]'Destination'
$label3.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#label4
#
$label4.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$label4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]275))
$label4.Name = [System.String]'label4'
$label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]23))
$label4.TabIndex = [System.Int32]19
$label4.Text = [System.String]'Copy Progress (Progress Bar Below)'
$label4.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#Clear_Items
#
$Clear_Items.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]189,[System.Int32]86))
$Clear_Items.Name = [System.String]'Clear_Items'
$Clear_Items.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]64,[System.Int32]23))
$Clear_Items.TabIndex = [System.Int32]20
$Clear_Items.Text = [System.String]'Clear'
$Clear_Items.UseVisualStyleBackColor = $true
$Clear_Items.add_Click($Clear_Items_Click)
#
#Select_All
#
$Select_All.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]86))
$Select_All.Name = [System.String]'Select_All'
$Select_All.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$Select_All.TabIndex = [System.Int32]21
$Select_All.Text = [System.String]'Seelct All'
$Select_All.UseVisualStyleBackColor = $true
$Select_All.add_Click($Select_All_Click)
#
#richTextBox1
#
$richTextBox1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$richTextBox1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]7,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$richTextBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]259,[System.Int32]59))
$richTextBox1.Name = [System.String]'richTextBox1'
$richTextBox1.ReadOnly = $true
$richTextBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]191,[System.Int32]66))
$richTextBox1.TabIndex = [System.Int32]22
$richTextBox1.Text = [System.String]'After clicking select source, use Ext:.doc OR Ext:.txt to search for multiple file types. This example searches for .doc and .txt file types. This replaces -filter.'
#
#richTextBox2
#
$richTextBox2.BackColor = [System.Drawing.SystemColors]::Info
$richTextBox2.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$richTextBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]166))
$richTextBox2.Name = [System.String]'richTextBox2'
$richTextBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]19))
$richTextBox2.TabIndex = [System.Int32]23
$richTextBox2.Text = [System.String]''
#
#servers_checkbox
#
$servers_checkbox.FormattingEnabled = $true
$servers_checkbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]114))
$servers_checkbox.Name = [System.String]'servers_checkbox'
$servers_checkbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]156,[System.Int32]94))
$servers_checkbox.TabIndex = [System.Int32]24
#
#Server_List
#
$Server_List.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Server_List.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]88))
$Server_List.Name = [System.String]'Server_List'
$Server_List.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]156,[System.Int32]23))
$Server_List.TabIndex = [System.Int32]25
$Server_List.Text = [System.String]'Servers'
$Server_List.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#add_server_textbox
#
$add_server_textbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]540,[System.Int32]245))
$add_server_textbox.Name = [System.String]'add_server_textbox'
$add_server_textbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]20))
$add_server_textbox.TabIndex = [System.Int32]26
#
#add_server
#
$add_server.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]243))
$add_server.Name = [System.String]'add_server'
$add_server.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$add_server.TabIndex = [System.Int32]27
$add_server.Text = [System.String]'Add'
$add_server.UseVisualStyleBackColor = $true
$add_server.add_Click($Add_server_Click)
#
#Clear_Servers
#
$Clear_Servers.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]540,[System.Int32]214))
$Clear_Servers.Name = [System.String]'Clear_Servers'
$Clear_Servers.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]23))
$Clear_Servers.TabIndex = [System.Int32]28
$Clear_Servers.Text = [System.String]'Clear'
$Clear_Servers.UseVisualStyleBackColor = $true
$Clear_Servers.add_Click($Clear_Servers_Click)
#
#Select_all_servers
#
$Select_all_servers.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]214))
$Select_all_servers.Name = [System.String]'Select_all_servers'
$Select_all_servers.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$Select_all_servers.TabIndex = [System.Int32]29
$Select_all_servers.Text = [System.String]'Select All'
$Select_all_servers.UseVisualStyleBackColor = $true
$Select_all_servers.add_Click($Select_all_servers_Click)
#
#export_servers
#
$export_servers.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]272))
$export_servers.Name = [System.String]'export_servers'
$export_servers.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]156,[System.Int32]23))
$export_servers.TabIndex = [System.Int32]30
$export_servers.Text = [System.String]'Export List to File'
$export_servers.UseVisualStyleBackColor = $true
$export_servers.add_Click($Export_servers_Click)
#
#Import_Servers
#
$Import_Servers.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]301))
$Import_Servers.Name = [System.String]'Import_Servers'
$Import_Servers.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]156,[System.Int32]23))
$Import_Servers.TabIndex = [System.Int32]31
$Import_Servers.Text = [System.String]'Import Server File'
$Import_Servers.UseVisualStyleBackColor = $true
$Import_Servers.add_Click($Import_Servers_Click)
#
#richTextBox3
#
$richTextBox3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]259,[System.Int32]191))
$richTextBox3.Name = [System.String]'richTextBox3'
$richTextBox3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]191,[System.Int32]62))
$richTextBox3.TabIndex = [System.Int32]32
$richTextBox3.Text = [System.String]'Note: When you click copy, script will auto create destination folder on all srevers.'
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]747,[System.Int32]490))
$Form1.Controls.Add($richTextBox3)
$Form1.Controls.Add($Import_Servers)
$Form1.Controls.Add($export_servers)
$Form1.Controls.Add($Select_all_servers)
$Form1.Controls.Add($Clear_Servers)
$Form1.Controls.Add($add_server)
$Form1.Controls.Add($add_server_textbox)
$Form1.Controls.Add($Server_List)
$Form1.Controls.Add($servers_checkbox)
$Form1.Controls.Add($richTextBox2)
$Form1.Controls.Add($richTextBox1)
$Form1.Controls.Add($Select_All)
$Form1.Controls.Add($Clear_Items)
$Form1.Controls.Add($label4)
$Form1.Controls.Add($label3)
$Form1.Controls.Add($label1)
$Form1.Controls.Add($Source_CheckedBox)
$Form1.Controls.Add($Clear_Results)
$Form1.Controls.Add($type_Options)
$Form1.Controls.Add($label2)
$Form1.Controls.Add($Results)
$Form1.Controls.Add($Select_Destination)
$Form1.Controls.Add($Select_Source)
$Form1.Controls.Add($progressBar1)
$Form1.Controls.Add($Copy_Items)
$Form1.Name = [System.String]'Form1'
$Form1.add_Load($Form1_Load)
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name toolTip1 -Value $toolTip1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name components -Value $components -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name progressBar1 -Value $progressBar1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name directorySearcher1 -Value $directorySearcher1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name folderBrowserDialog1 -Value $folderBrowserDialog1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Copy_Items -Value $Copy_Items -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Results -Value $Results -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name label2 -Value $label2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name openFileDialog1 -Value $openFileDialog1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name type_Options -Value $type_Options -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Select_Source -Value $Select_Source -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Select_Destination -Value $Select_Destination -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Source_CheckedBox -Value $Source_CheckedBox -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name label1 -Value $label1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name label3 -Value $label3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name label4 -Value $label4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Clear_Items -Value $Clear_Items -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Select_All -Value $Select_All -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Clear_Results -Value $Clear_Results -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name richTextBox1 -Value $richTextBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name richTextBox2 -Value $richTextBox2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Server_List -Value $Server_List -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name add_server -Value $add_server -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Clear_Servers -Value $Clear_Servers -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name export_servers -Value $export_servers -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name servers_checkbox -Value $servers_checkbox -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name add_server_textbox -Value $add_server_textbox -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Select_all_servers -Value $Select_all_servers -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Import_Servers -Value $Import_Servers -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name richTextBox3 -Value $richTextBox3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent


$Form1.ShowDialog()
