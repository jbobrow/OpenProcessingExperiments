
void setup() {
  size(400, 400);
}

void draw() {
   fill(129, 186, 255, 100);
   noStroke();
   
 //sky  
 rect(0, 0, 500, 175);
 
 //grass
 fill(55, 142, 36, 50);
 rect(0, 175, 400, 175);
 
 //sun
  fill(255, 225, 49);
  ellipse(150, 55, 75, 75);
  
  
  //Foreground triangle
 fill(130,50,60);
 triangle(15, 350, 175, 175, 400, 350);
 fill(57,15,14);
 triangle(115, 350, 175, 175, 400, 350);
 
 fill(mouseX,0,mouseY,75); //0-400
 rect(0,0,400,400);
}

