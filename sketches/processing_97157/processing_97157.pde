
size (200, 200);
background (53, 20, 193);
 

for (int x=40;x<170;x=x+40){
  for (int y=40;y<170;y=y+40){
    noStroke();
    fill (255, 255, 255, 250);
      if (x>50 && x<130 && y>90 && y<130){
          fill (0);
      }
      ellipse (x,y,10,10);
  }
}
 

 
for (int x=35;x<160;x=x+40){
  stroke (255,255, 255, 150);
  noFill ();
  rect (35,x,130,10);
  rect (x,35,10,130);
  }
