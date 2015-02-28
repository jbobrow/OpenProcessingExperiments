
int aumenta = 0;
void setup(){
  background(0,0,0);
size(900,900);
}
void draw(){
  noFill();
   stroke(255,255,255);
ellipse(aumenta,height/2,aumenta,aumenta);
aumenta+=15;
ellipse(width/2,aumenta,aumenta,aumenta);
 ellipse(width-aumenta,height/2,aumenta,aumenta);
ellipse(width/2,height-aumenta,aumenta,aumenta);
}
