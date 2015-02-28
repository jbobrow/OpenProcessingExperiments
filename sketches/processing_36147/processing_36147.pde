

void setup(){
  size(500,500);
  smooth();
  strokeWeight(5);
  stroke(0,45);
  background(0);
}
void draw(){
  
   fill(214,34,2,200);
 ellipse(250,250,pmouseY,pmouseX);
   fill(214,90,2);
  ellipse(50,50,mouseX,mouseY);
  ellipse(450,450,mouseX,mouseY);
  ellipse(450,50,mouseX,mouseY);
  ellipse(50,450,mouseX,mouseY);}
                
                
