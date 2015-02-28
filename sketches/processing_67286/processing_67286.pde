
float rect_x;

void setup(){
 size(400,400); 
 rect_x = width*.5;
}

void draw(){
  background(255);
 rect_x= sin(millis() * .01)*50+ mouseX;  //sin is always between 1 and -1. (ease in and ease out)
 //rect_x= cos(millis() * .001)*200+200;  //cos is always between 1 and -1. (ease in and ease out) same as in sin!
 rect (rect_x-10, mouseY, 20,20);
}

