
// this runs once when the programm starts
void setup (){
  size(400, 400);
}

// this runs every time the operating
// system tells java to update the screen
void draw (){
  background(30, 255, 255);


for(int i=0; i<30; i++){
    //point(mouseX, mouseY);
    stroke(204, 102, 0);
    rect(mouseX + random(40), mouseY+random(40),20,20,80);
  }
   line(pmouseX, pmouseY, mouseX, mouseY);
}
