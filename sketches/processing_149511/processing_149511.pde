

size (500, 500);
background (255, 30, 100);


for (int a = 100; a < 400; a+=10){
  for (int b = 100; b < 400; b+=10){
    if ((a>200)&&(a<300)) {
      
      ellipse(a, b, 5, 5);}
      else {
        line(a, b, a+3, b+3);}
  }
}

      


