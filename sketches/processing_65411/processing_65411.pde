
size(400,400);
background(0);
noFill();
colorMode(HSB);
float i=0;
while (i < 128) {
  stroke(i*2,255,255);
  ellipse(width/2, height/2,384-i*2, 128+i*2);
  i = i+4;
}

