
PImage rb;

float xoff = 0.0;

void setup(){
  size (640,480);
  smooth();
  frameRate(25);
    rb = loadImage("rb.png");
  
}

void draw(){
  

  
  noStroke();
  background(0);
  
  xoff = xoff + .01;
  float n = noise(xoff) * 100;
  float ts = n;
  
  
  
  for ( int i = 0; i<width/ts;i++){
    for ( int j = 0; j<height/ts;j++){
      fill(random(255),0,random(0,100));
       triangle(i*ts,j*ts,i*ts-(2/ts),j*ts-ts,i*ts+ts,j*ts);
        fill(random(255),0,random(255));
         triangle(i*ts,j*ts,i*ts+(2/ts),j*ts+ts,i*ts-ts,j*ts);
    }
  }
 float x = width/2+sin(frameCount/25.0)*140;
 float y = height/2+cos(frameCount/25.0)*140;
 
 image(rb,x-32,y-32,64,64);
 
 float x2 = x + sin(frameCount/10.0)*100;
 float y2 = y + cos(frameCount/10.0)*100;
 
 image(rb,x2-16,y2-16,32,32);
 
}
      


