
float phase = random(0,180);

void setup(){

  size(540,344);
  background(255);
 // noFill();
  smooth();
  frameRate(255);
  stroke(255,0,0);
  rectMode(CENTER);
  colorMode(HSB);
  frameCount = width + 1;
}

void draw(){
alpha(30);

int bai =  2*int(random(1,2));
int size = int(random(1,10));


if(frameCount > width) 
  {  
    frameCount = 10;
    phase += random(0,0.5);
    phase %= 360;
    stroke((phase * 10) % 255,random(0,255),255);
  }
  
  
  float percent = map(frameCount , 0 , width , 0 , 1);
  float v = percent;
  float centerx = lerp(0,width,v  + random(-0.01,0.01));
  float centery = lerp(0,height,sin( bai * v * radians(360) + phase) /2 ) + height /2;
  
  ellipse(centerx,centery,size,size);

  
  frameCount += random(-8,10);
 
}
                
