

void setup(){
  background(255);
  size(400,400);
  frameRate(5);
}

void draw(){
  stroke(
      map(mouseX,0,400,0,255),255,255);
   strokeWeight(
       map(pmouseX,0,400,2.5,2));
 line(mouseX, mouseY, 0, 200);
 line(mouseX, mouseY, 400,200);
 line(mouseX, mouseY, 200, 0);
 line(mouseX, mouseY, 200, 400);
  
}


