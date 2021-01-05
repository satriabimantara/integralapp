function trapesoid
  [x1,xn] = inputBatas();
  [x,y,length] = data();
  fprintf("Masukan berapa interval ");
  interval = input(">> ");
  # 1. Hitung nilai h
  h = (xn - x1) / interval;
  intervalArray = x1 : h : xn;
  integral=[];
  #cocokan apakah intervalArray ada di x? sebanyak interval +1
  cek =0;
  tolerance = 0.001;
  for i = 1: interval+1
    for j = 1 : length
      #comparing floating number 
      if abs(intervalArray(i)-x(j)) < tolerance
        integral(i) = y(j);
        cek++;
      endif
    endfor
  endfor
  if cek == interval+1
    #Hitung nilai integral
    hasilIntegral = 0;
    for i = 1 : interval+1
      #Jika indeks berada di awal atau diakhir
      if i == 1 || i == interval + 1
        hasilIntegral += integral(i);
      else
        hasilIntegral += 2*integral(i);
      endif
    endfor
    hasilIntegral = (h/2) * hasilIntegral;
    fprintf("Hasil integral >> %.4f\n",hasilIntegral);
  else
    fprintf("Hasil  = Tidak ada penyelesaian\n");
    animasi();
  endif
endfunction
