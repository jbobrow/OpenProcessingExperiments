
void setup(){
  background(255);
  size(400,400);
}

void draw(){
  stroke(
      map(mouseX,0,400,0,255),127,255);
   strokeWeight(
       map(pmouseX,0,400,2.5,2));
 line(mouseX, mouseY, 0, 200);
 line(mouseX, mouseY, 400,200);
 line(mouseX, mouseY, 200, 0);

  
}


