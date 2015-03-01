
void setup(){
  background(255);
  size(400,400);
}

void draw(){
  stroke(
      map(mouseX,0,300,0,255),220,255);
   strokeWeight(
       map(pmouseX,0,400,2.5,2));
 line(mouseX, mouseY, 10, 200);
 line(mouseX, mouseY, 400,200);
 line(mouseX, mouseY, 200, 100);
 line(mouseX, mouseY, 200, 400);
  
}


