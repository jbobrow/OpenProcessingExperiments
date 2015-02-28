
class Monkey {
  PImage monkey_image;
  float angle;
  float xpos;
  float ypos;
  float rspeed ;
  int angleDirection=1;
  
  Monkey(PImage p, float a, float x, float y, float s){
    
 monkey_image=p;
  angle=a;
  xpos=x;
  ypos=y;
  rspeed=s;
    
  }
  
  void display(){
    image(monkey_image, 0, ypos);
    
  }
  void parachute(){
  pushMatrix();
  translate (xpos, 0);
  rotate (angle);
  display();
  popMatrix ();
  angle += rspeed * angleDirection;
  if ((angle> QUARTER_PI/6) || (angle < -QUARTER_PI/6)) {
    angleDirection *= -1;
    
  }
  
}
void fall(float speed){
  ypos += speed;
  if (ypos> height + 200) {
    ypos = -100;
  }
}


}

