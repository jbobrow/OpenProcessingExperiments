
size(900,400);
smooth();
noStroke(); //
float offset = (height/2);
float angleInc = PI/48;
float angle = 0.0;
colorMode(HSB);
background(0);


for ( float scaleVal = 18; scaleVal< 200; scaleVal += 3){
  for(int  x= 0; x <= width; x +=10){
    float y = offset + (sin(angle) * scaleVal);
    float newHue= map(scaleVal, 18, 200, 0,255);
    fill(newHue, 200,140);
    triangle(x,y, (x-8), (y-12), (x+8), (y-9));
    angle += angleInc;
    
  }
}


