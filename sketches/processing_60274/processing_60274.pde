
size(900,400);
smooth();
float offset = (height/2);
float angleInc = PI/48;
float angle = 0.0;
colorMode(HSB);

for ( float scaleVal = 18; scaleVal< 100; scaleVal += 3){
  for(int  x= 0; x <= width; x +=10){
    float y = offset + (sin(angle) * scaleVal);
    float newHue= map(scaleVal, 18, 100, 0,255);
    fill(newHue, 255,200);
    ellipse(x,y, 10,10);
    angle += angleInc;
    
  }
}


