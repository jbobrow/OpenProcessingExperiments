
void setup(){
  size(500,500);
  smooth();
  noCursor();
}


void draw(){
  fill(0,20);
  rect(0,0,width,height);
  stroke(255);
  line(width/2,0,mouseX,mouseY);
  line(width,height/2,mouseX,mouseY);
  line(width/2,height,mouseX,mouseY);
  line(0,height/2,mouseX,mouseY);
 }
      
