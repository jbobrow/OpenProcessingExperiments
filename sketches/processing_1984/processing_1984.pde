
float f = 0;

void setup(){
  size(400,400);
  colorMode(HSB);
  background(50);
}

void draw(){
  for(int i=0;i<1111;i++){
    float x,y;
    x=random(0,width);
    y=random(0,height);
    float d = dist(x,y,200+cos(f)*cos(f/10)*30,200+sin(f)*sin(f/10)*30);
    stroke((33+d/1.5)%255,(20 / d)*255,(80 / d)*255,255);
    point(x,y);
  }
  f += .1;
}

