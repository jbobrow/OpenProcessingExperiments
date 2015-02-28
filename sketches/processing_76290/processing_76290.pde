
//experimenting with sin cos motion
float angle =0.0;
float offset=200;
float scalar = 150;
float speed = 0.05;


void setup () {
    size (400,400);
    smooth();
    
}

void draw () {
  
  float x=offset + cos (angle)*scalar;
  float y=offset + sin (angle)*scalar;
  fill(random(0,255), random(150,0),100);
  ellipse (x,y,100,100);
  angle +=speed;
  
}
