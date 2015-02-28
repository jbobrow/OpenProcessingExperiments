
void setup(){
  size(800 ,800);
  smooth();
}
// THIS ISNT PART OF THE SYSTEM
void draw(){
  if (mousePressed) 
  {
    fill(#f54fc0);
  } else 
  {
    fill(255);
  }
 ellipse(mouseX, mouseY, 40, 40);
 ellipse(mouseX, mouseY, 45, 45);
 ellipse(mouseX, mouseY, 35, 35);
 ellipse(mouseX, mouseY, 30, 30);
 ellipse(mouseX, mouseY, 25, 25);
 ellipse(mouseX, mouseY, 20, 20);
 ellipse(mouseX, mouseY, 15, 15);
 ellipse(mouseX, mouseY, 10, 10);
 line(mouseX, mouseY, 400, 400);
}

