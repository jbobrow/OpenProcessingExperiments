
void setup(){
  background(255);
  size(400,400);
  frameRate(5);
}
 
void draw(){
  stroke(
      map(mouseX,10,400,0,255),100,200);
   strokeWeight(
       map(pmouseX,10,200,2.5,2));
 line(mouseX, mouseY, 10, 200);
 line(mouseX, mouseY, 200,200);
 line(mouseX, mouseY, 200, 10);
 line(mouseX, mouseY, 200, 200);
   
}



