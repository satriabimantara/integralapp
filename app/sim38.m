function sim38()
  [x1,xn] = inputBatas();
  [x,y,length] = data(); #call data
  fprintf("\tStep to Sub Interval\n\n");
  for i = 1 : 7
    fprintf("%d step = 3 * %d sub interval = %d\n",i,i,3*i);
  endfor
  fprintf("dst\n");
  fprintf("\n");
  fprintf("Masukan berapa sub interval ");
  subInt = input(">> ");
  h = (xn - x1) / subInt;
  intervalArray = x1 : h : xn;
  integral=[];
  #cocokan apakah penambahan interval ada di x? sebanyak sub interval +1
  cek =0;
  tolerance = 0.001; #anticipate comparison with floating number
  for i = 1: subInt+1
    for j = 1 : length
      if abs(intervalArray(i)-x(j)) < tolerance
        integral(i) = y(j);
        cek++;
      endif
    endfor
  endfor
  if cek == subInt+1
    #Hitung nilai integral
    hasilIntegral = 0;
    #{
    loncat sebagai indeks dalam rumus simpson 3/8 
    2(f3 + f6 + f9 +....)
    karena indeks octave dimulai dari 1, maka
    2(f4 + f7 + f10 +...)
    #}
    loncat = 0; 
    #looping akan bertambah 3 seiring iterasi
    for i = 1 : 3 : subInt+1
      indexAwal = loncat+1; #for start looping for second iteration
      #Jika indeks berada akhir
      if i == subInt + 1
        hasilIntegral += integral(i);
      else
        loncat = i+3;
        #mengantisipasi penambahan dua kali terhadap nilai yg paling belakang
        if loncat!=subInt+1
           hasilIntegral += 2*integral(loncat);
        endif
        for j=indexAwal : loncat-1
          if j == 1
            hasilIntegral += integral(j);
          else
            hasilIntegral += 3*integral(j);
          endif
        endfor  
      endif
    endfor
    hasilIntegral = (3*h/8) * hasilIntegral;
    fprintf("Hasil integral >> %f\n",hasilIntegral);
  else
    fprintf("Hasil = Tidak ada penyelesaian\n");
  endif
endfunction
