
//Matthew Hou'
//July 8 2013
//

void setup() {
  size(400, 400); // set screen size to 400 x 400
  background(217);
}

void draw() {
  if (mousePressed == true) {
    fill(129, 230, 290); //***this value controls the clicked color
  } 
  else {
    fill (255,234,15); 
  }
  
  ellipse(mouseX, mouseY, 80, 80);
}
