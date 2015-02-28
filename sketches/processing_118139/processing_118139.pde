
int eSize = 3;

size(510, 510);
background(0, 0, 255);

for(int x = 0; x <= 510; x ++){
  stroke(0, 255, 255, 127);
  line(0, x, width/2, height/2);
  stroke(0, 255, 255, 127);
  line(width/2, height/2, width, x);
  stroke(255, 255, 0, 127);
  line(x, 0, width/2, height/2);
  stroke(255, 255, 0, 127);
  line(x, height, width/2, height/2);
}
noStroke();
fill(0, 60, 255, 127);
rectMode(CENTER);
rect(255, 255, 255, 255);
stroke(0, 255, 255, 127);
rect(255, 255, 375, 375);



