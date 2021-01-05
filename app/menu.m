


function menu()
  fprintf("\tINTEGRAL NUMERIK\n");
  fprintf("\t1. Metode Trapesoid\n");
  fprintf("\t2. Metode Simpson 1/3\n");
  fprintf("\t3. Metode Simpson 3/8\n");
  fprintf("\n");
  pil = input("Mau metode berapa >> ");
  fprintf("\n");
  if pil == 1
    trapesoid();
  elseif pil == 2
    sim13();
  elseif pil == 3
    sim38();
  else
    fprintf("Pilihan tidak ada di dalam menu!\n");
    fprintf("Silahkan inputkan yang benar!\n");
    animasi();
  endif
  
  
  
  
endfunction
