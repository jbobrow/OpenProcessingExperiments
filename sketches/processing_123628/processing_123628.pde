
size (1000, 1000);
background (0,0,43);
triangle(500, 200, 400, 600, 600, 600);
stroke (255);
rect (500,200, 1, -100);
stroke (255); 
rect (450, 150,100,1);
stroke (0);
fill (0,43,0);
rect (0,600, 1000,500);
stroke(244,250,187);
for (int j =0; j<600; j=j+5){
  float i= random (900);
  point (i,j);
}

for (int l=0; l<3; l ++) {
stroke (0);
fill (255,255,215);
triangle(450+l*90, 520, 375+l*90, 600, 450+l*90, 600);
}


