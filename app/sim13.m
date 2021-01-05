function sim13()
  [x1,xn] = inputBatas();
  [x,y,length] = data(); #call data
  #show the rule of sub interval
  fprintf("\tStep to Sub Interval\n\n");
  for i = 1 : 7
    fprintf("%d step = 2 * %d sub interval = %d\n",i,i,2*i);
  endfor
  fprintf("dst\n");
  fprintf("\n");
  #input subinterval value
  fprintf("Masukan berapa sub interval ");
  subInt = input(">> ");
  #find h
  h = (xn - x1) / subInt;
  intervalArray = x1 : h : xn;
  integral=[];
  #cocokan apakah penambahan interval ada di x? sebanyak sub interval +1
  cek =0;
  tolerance = 0.001;
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
    for i = 1 : subInt+1
      # Jika indeks berada di awal atau akhir
      if i == 1 || i == subInt + 1
        hasilIntegral += integral(i);
      #jika genap 
      elseif mod(i,2) == 0 && i <= subInt
        hasilIntegral += 4*integral(i);
      #jika ganjil
      elseif mod(i,2) ==1 && i <= (subInt+1)-2
        hasilIntegral += 2*integral(i);
      endif
    endfor
    hasilIntegral = (h/3) * hasilIntegral;
    fprintf("Hasil integral >> %f\n",hasilIntegral);
  else
    fprintf("Hasil = Tidak ada penyelesaian\n");
  endif
endfunction
