
size(600,400);
strokeWeight(3);
background(0);
float offset = 150.0;
float scaleVal = 80.0;
float angleInc = 0.42;
float angle = 0.0;

for (int x = -252; x<=width; x += 5) {
  float y = offset + (sin(angle) * scaleVal);
  stroke(y,y+10,y+50);
  line(x,0,x+200,height);
  angle += angleInc;
}


