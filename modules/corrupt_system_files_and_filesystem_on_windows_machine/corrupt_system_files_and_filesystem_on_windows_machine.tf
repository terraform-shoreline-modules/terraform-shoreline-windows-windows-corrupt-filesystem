resource "shoreline_notebook" "corrupt_system_files_and_filesystem_on_windows_machine" {
  name       = "corrupt_system_files_and_filesystem_on_windows_machine"
  data       = file("${path.module}/data/corrupt_system_files_and_filesystem_on_windows_machine.json")
  depends_on = [shoreline_action.invoke_drive_check_and_fix]
}

resource "shoreline_file" "drive_check_and_fix" {
  name             = "drive_check_and_fix"
  input_file       = "${path.module}/data/drive_check_and_fix.sh"
  md5              = filemd5("${path.module}/data/drive_check_and_fix.sh")
  description      = "Check the hard drive for errors and bad sectors using a disk utility tool."
  destination_path = "/tmp/drive_check_and_fix.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_drive_check_and_fix" {
  name        = "invoke_drive_check_and_fix"
  description = "Check the hard drive for errors and bad sectors using a disk utility tool."
  command     = "`chmod +x /tmp/drive_check_and_fix.sh && /tmp/drive_check_and_fix.sh`"
  params      = ["DRIVE_LETTER"]
  file_deps   = ["drive_check_and_fix"]
  enabled     = true
  depends_on  = [shoreline_file.drive_check_and_fix]
}

