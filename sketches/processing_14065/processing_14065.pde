
float a=0.1;

void setup(){
  size(360,200);
  colorMode(HSB, 360,200,100);
}

void draw(){
  background(360);
  noStroke();
  for(int x=0; x<100; x=x+5) {
  float y=sin(radians(x+frameCount))*10*150+100;
  fill(HSB,random(200),random(100),random(100));
  ellipse(x+100,x-30,y,y);
  fill(HSB,random(100),random(100),random(100));
  ellipse(x-20,x+100,y,y);
 }
}

