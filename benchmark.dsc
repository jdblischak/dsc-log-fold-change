#!/usr/bin/env dsc

%include modules/get_data
%include modules/glm.txt
%include modules/t_test.txt
%include modules/wilcox_test.txt

DSC:
  define:
    method: glm_pois, t_test, wilcoxon_test
  run:
    first_pass: get_data * t_test
  exec_path: code
  global:
    data_file: data/rawcounts.rds