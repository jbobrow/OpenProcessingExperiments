
// this runs once when the program starts
void setup(){
  size(400, 400);
  background(0);
}

// this runs every time the operating 
// system tells java to update the screen
void draw(){
  if (mousePressed == true) {
  line(pmouseX + random(15), pmouseY + random(15), mouseX, mouseY);
  stroke(200);
  for(int i=0; i<30; i++){
    //point(mouseX, mouseY); 
    point(mouseX + random(5), mouseY + random(5));
  }
  }
   //line(pmouseX, pmouseY, mouseX, mouseY);
}
  


