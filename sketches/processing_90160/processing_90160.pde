
size (200,200);
    noStroke ();
colorMode (RGB,250);
for (int i=0; i<200; i+=18){
  for (int j=0; j<200; j+=18) {
    fill (i+10, j+200, j+200);
    rect (i,j, 200,200);

  }
}

fill (154, 205, 50);
rect (0, 150, 200, 80);

fill (248, 248, 255);
rect (40,40,120,150);

fill (131, 139, 131);
for (int i=45; i<200; i+=30){
  for (int j=45; i<150; i+=30){
    rect (i,j,15,15);
  }
}
fill (131, 139, 131);
for (int i=45; i<200; i+=30){
  for (int j=85; i<150; i+=30){
    rect (i,j,15,15);
  }
}

fill (131, 139, 131);
for (int i=45; i<200; i+=30){
  for (int j=125; i<150; i+=30){
    rect (i,j,15,15);
  }
}




fill (54, 54, 54);
rect (70, 160, 60, 30);

fill (110, 123, 139);
quad(70,190,130,190,200,200,0,200);
