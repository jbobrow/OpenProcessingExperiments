
int aumenta = 0;
void setup(){
  background(0);
size(800,800);
}
void draw(){
  frameRate(7);
  noFill();
   stroke(255,255,255);
ellipse(aumenta,height/2,aumenta,aumenta);

aumenta+=100;
ellipse(width/2,aumenta,aumenta,aumenta);
 ellipse(width-aumenta,height/2,aumenta,aumenta);
ellipse(width/2,height-aumenta,aumenta,aumenta);





}
