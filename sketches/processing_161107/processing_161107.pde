
size(500, 500);
background(0, 240, 230);


float mr_m = 0;
for (int x=0; x<width; x++) {
  float m = cos(x + 5) * 200 + height/2;
  line(x, m+1, (x-25), mr_m);
  mr_m = m;
  stroke(255, 0, 80);
  strokeWeight(2);
}

fill(0, 240, 230);
ellipse(220, 250, 100, 100);
stroke(0, 240, 230);
strokeWeight(0);

fill(0, 240, 230);
ellipse(50, 250, 100, 100);
stroke(0, 240, 230);
strokeWeight(0);

fill(0, 240, 230);
ellipse(415, 250, 100, 100);
stroke(0, 240, 230);
strokeWeight(0);


float old_y = 0;
for (int x=0; x<width; x++) {
  float y = cos(x + 5) * 150 + height/2;
  line(x+100, y+1, (x-25), old_y);
  old_y = y;
  stroke(223, 190, 80);
  strokeWeight(1);
  
}




  


