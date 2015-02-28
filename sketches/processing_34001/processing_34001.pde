

PFont font;

void setup(){
  size(400,400);
  font=loadFont("Helvetica-24.vlw");
 
}
void draw(){
  background(190,205,147);
   float d = map(day(),0,31,365,(width-30));
    float h = map(hour(),0,23,30,(width-30));
  float m = map(minute(),0,60,30,(width-30));
  float s = map(second(),0,60,30,(width-30));
  
   text((day() +":"+ hour()+":" + minute() + ":" + second()),mouseX,mouseY);
   
 text("days without sleep");

}
  


