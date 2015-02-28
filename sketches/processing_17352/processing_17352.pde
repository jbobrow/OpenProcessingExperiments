
float angle=0.0;
float speed=0.05;
float radius=50.0;
float sx=1.0;
float sy=0.5;

void setup(){
  size(500,500);
  background(255);
  strokeWeight(0.15);
  smooth();
}

void draw(){
 // fill(0,4);
  //rect(0,0,width,height);
  angle+=speed;
  float sinval=sin(angle);
  float cosval=cos(angle);
  float x=mouseX+(cosval*radius);
  float y=mouseY+(sinval*radius);
  fill(255);
  stroke(0);
  //line(x,y,2,2);

  float x2=x+cos(angle*sx)*radius/2;
  float y2=y+sin(angle*sy)*radius/2;
  line(x2,y2,x,y);
}
void keyPressed(){
  background(255);
}



