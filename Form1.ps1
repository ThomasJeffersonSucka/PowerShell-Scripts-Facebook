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
#$Source = Get-ChildItem -Recurse $Source_CheckedBox.CheckedItems
$totalfiles = $Source.count
$destination_folder = $richTextBox2.Text
$progressBar1.Maximum = $source.count
$progressBar1.Step = 1
$progressBar1.Value = 0

foreach($file in $Source) {
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
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$components = (New-Object -TypeName System.ComponentModel.Container)
$resources = 
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
$Form1.SuspendLayout()
#
#Copy_Items
#
$Copy_Items.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]141,[System.Int32]179))
$Copy_Items.Name = [System.String]'Copy_Items'
$Copy_Items.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]112,[System.Int32]35))
$Copy_Items.TabIndex = [System.Int32]0
$Copy_Items.Text = [System.String]'Copy Items'
$toolTip1.SetToolTip($Copy_Items,[System.String]'Copy')
$Copy_Items.UseVisualStyleBackColor = $true
$Copy_Items.add_Click($Copy_Items_Click)
#
#Select_Source
#
$Select_Source.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]141,[System.Int32]63))
$Select_Source.Name = [System.String]'Select_Source'
$Select_Source.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]112,[System.Int32]34))
$Select_Source.TabIndex = [System.Int32]3
$Select_Source.Text = [System.String]'Select Source'
$toolTip1.SetToolTip($Select_Source,[System.String]'Select the folder path that you want to copy.')
$Select_Source.UseVisualStyleBackColor = $true
$Select_Source.add_Click($Select_Source_Click)
#
#Select_Destination
#
$Select_Destination.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]179))
$Select_Destination.Name = [System.String]'Select_Destination'
$Select_Destination.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]126,[System.Int32]35))
$Select_Destination.TabIndex = [System.Int32]5
$Select_Destination.Text = [System.String]'Select Destination'
$toolTip1.SetToolTip($Select_Destination,[System.String]'Select the folder path that you want to copy.')
$Select_Destination.UseVisualStyleBackColor = $true
$Select_Destination.add_Click($Select_Destination_Click)
#
#progressBar1
#
$progressBar1.BackColor = [System.Drawing.SystemColors]::Info
$progressBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]270))
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
$label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]126,[System.Int32]24))
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
$type_Options.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]126,[System.Int32]21))
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
$label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]128))
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
$label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]244))
$label4.Name = [System.String]'label4'
$label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]23))
$label4.TabIndex = [System.Int32]19
$label4.Text = [System.String]'Copy Progress (Progress Bar Below)'
$label4.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#Clear_Items
#
$Clear_Items.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]537,[System.Int32]34))
$Clear_Items.Name = [System.String]'Clear_Items'
$Clear_Items.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$Clear_Items.TabIndex = [System.Int32]20
$Clear_Items.Text = [System.String]'Clear'
$Clear_Items.UseVisualStyleBackColor = $true
$Clear_Items.add_Click($Clear_Items_Click)
#
#Select_All
#
$Select_All.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]456,[System.Int32]34))
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
$richTextBox1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]8.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$richTextBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]259,[System.Int32]59))
$richTextBox1.Name = [System.String]'richTextBox1'
$richTextBox1.ReadOnly = $true
$richTextBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]353,[System.Int32]50))
$richTextBox1.TabIndex = [System.Int32]22
$richTextBox1.Text = "After clicking select source, in the upper right-hand corner of the window, use Ext:.doc OR Ext:.txt to search form multiple file types. This example searches for .doc and .txt file types. This replaces filter option.
"

#
#richTextBox2
#
$richTextBox2.BackColor = [System.Drawing.SystemColors]::Info
$richTextBox2.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$richTextBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]154))
$richTextBox2.Name = [System.String]'richTextBox2'
$richTextBox2.ReadOnly = $true
$richTextBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]441,[System.Int32]19))
$richTextBox2.TabIndex = [System.Int32]23
$richTextBox2.Text = [System.String]''
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]747,[System.Int32]490))
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
$Form1.ResumeLayout($false)
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
Add-Member -InputObject $Form1 -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent


$Form1.ShowDialog()