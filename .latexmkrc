$lualatex = 'lualatex -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$max_repeat = 20;
$aux_dir = 'tmp';

$bibtex = 0;

$makeindex = 0;

#.flsファイルを作成しない
$recorder = 0;

$pdf_mode = 4;

$pvc_view_file_via_temporary = 0;
$pdf_previewer = "zathura %O %S";
