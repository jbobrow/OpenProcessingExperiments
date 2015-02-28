
//Reforço6

size (200, 200);
background (230,250,180);

//circulos
for (int x=40;x<170;x=x+40){
  for (int y=40;y<170;y=y+40){
    noStroke();
    fill (255,0,0,100);
      if (x>50 && x<130 && y>90 && y<130){
          fill (0,255,0);
      }
      ellipse (x,y,10,10);
  }
}

//retangulos

for (int x=35;x<160;x=x+40){
  stroke (255,0,0,100);
  noFill ();
  rect (35,x,130,10);
  rect (x,35,10,130);
  }
