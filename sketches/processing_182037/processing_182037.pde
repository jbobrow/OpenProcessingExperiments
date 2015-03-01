
float x;
float y;
float radius=100;
float radiusNoise;

void setup(){
  size(500,500);
  smooth();
  background(255);
  strokeWeight(2);
  frameRate(15);
  radiusNoise=random(10);
 //noLoop();
  
}

void draw(){
  translate(width/2,height/2);
  background(255);//turn this on and off
  for (float ang=0;ang<=360;ang+=10){//change ang increment
    float thisradius=radius+(noise(radiusNoise)*200-100);
    float rad=radians(ang);
  
  x=thisradius*cos(rad);
  y=thisradius*sin(rad);
  point(x,y); 
  radiusNoise=radiusNoise+.1;//.001 is more subtle
  }
  
}
