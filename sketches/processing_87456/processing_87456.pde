
// pattern : points02

size (500, 500);
smooth ();
background (255);



strokeWeight (20);
stroke (20, 185, 230, 50);
for (int i=5; i<=width; i=i+21){
  for (int j=5; j<=height; j=j+23){
  point (i, j);
  }
}

strokeWeight (4);
stroke (255);
for (int i=5; i<300; i=i+8){
  for (int j=5; j<300; j=j+10){
  point (100+i, 100+j);
  }
}

strokeWeight (2);
stroke (220, 230, 20);
for (int i=5; i<200; i=i+11){
  for (int j=5; j<200; j=j+12){
  point (150+ i, 150+j);
  }
}





