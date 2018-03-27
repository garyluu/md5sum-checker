task md5 {
  File inputFile

  command {
    /bin/my_md5sum ${inputFile}
  }

 output {
    File value = "md5sum.txt"
 }

 runtime {
   docker: "quay.io/agduncan94/md5sum-checker"
   cpu: 1
   memory: "512 MB"
   disks: "local-disk 10 HDD"
 }
}

workflow ga4ghMd5 {
 File inputFile
 call md5 { input: inputFile=inputFile }
}
