
size(600,400);
fill(255,20);
float scaleVal = 58.0;
float angleInc = PI/28.0;
float angle = 0.0;
background(50);
for (int offset = -10; offset < width+10; offset += 5) {
  for (int y = 0; y <=height; y += 2){
    float x = offset + (sin(angle) * scaleVal);
    noStroke();
    ellipse(x,y,9,9);
    stroke(255,100);
    fill(150,250,200,40);
    ellipse(x,y,3,3);
    angle += angleInc;
  }
  angle += PI;
}


