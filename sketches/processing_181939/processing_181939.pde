
float radius=100;

float x;
float y;
float radiusNoise;
int greyScale;

void setup(){
  size(500,500);
  smooth();
  background(255);
  strokeWeight(2);
  frameRate(15);
  radiusNoise=random(10);

  
}

void draw(){
  translate(width/2,height/2);
  int greyScale=int(random(255));
  //background(255);//turn this on and off
  for (float ang=0;ang<=360;ang+=5){//change ang increment
    float thisradius=radius+(noise(radiusNoise)*200-100); //change 200 and 100; multiplication is more variation and -100 keeps it contained.
    float rad=radians(ang);
  
  x=thisradius*cos(rad);
  y=thisradius*sin(rad);
  int transparency=int(map(ang,0,360,0,255));
  stroke(greyScale,transparency);
  ellipse(x,y,5,5); 
  radiusNoise=radiusNoise+.1;
  //radius=radius-.005;
  
  }
  
}
