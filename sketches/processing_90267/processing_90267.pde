
size(200, 200);
background(90, 160, 210);
//antena
stroke(119, 136, 153);
strokeWeight(8);
strokeCap(SQUARE);
line(100, 20, 100, 200);
//parte baixo prédio
stroke(119, 136, 153);
strokeWeight(2);
fill (190, 190, 190);
rect(70, 90, 60, 140);
//janelas
stroke(238, 232, 170);
strokeWeight(1);
int x=0;
int y=0;
for (x=74; x<127; x=x+4)
  for (y=94; y<200; y=y+4)
    point (x, y);
//linha do meio
stroke(119, 136, 153);
strokeWeight(8);
strokeCap(SQUARE);
line(100, 90, 100, 200);
//parte de cima
stroke(119, 136, 153);
strokeWeight(2);
fill (190, 190, 190);
rect(80, 40, 40, 50);
//linhas
stroke(119, 136, 153);
strokeWeight(2);
int k=0;
for (k=40; k<90; k=k+4)
  line(79, k, 120, k);
//linha do meio
stroke(99,39,19);
strokeWeight(8);
strokeCap(SQUARE);
line(100, 185, 100, 200);
