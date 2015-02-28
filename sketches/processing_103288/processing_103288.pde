
//Matthew Hou'
//July 8 2013
//

void draw() {
  size(800, 800); // set screen size to 400 x 400
  background(60);
  strokeWeight(1);
  fill (255,255,0);
  ellipse(mouseX, mouseY, 100, 100);
  fill (0);
  ellipse(mouseX -20, mouseY -20,20,20);
  ellipse(mouseX +20, mouseY -20,20,20);
  arc (mouseX,mouseY +20,50,10,-8, PI);
  ellipse(mouseX -20, mouseY -20,5,20);
  ellipse(mouseX +20, mouseY -20,5,20);
  fill (255);
  text("He is sad :(", 20,20,0);

  

if (mousePressed == true){ 
 background(100,200,200);
 strokeWeight(1);
 fill (255,255,0);
  ellipse(mouseX, mouseY, 100, 100);
  fill (0);
  ellipse(mouseX -20, mouseY -20,20,20);
  ellipse(mouseX +20, mouseY -20,20,20);
  arc (mouseX,mouseY +20,50,25,0, PI);
  ellipse(mouseX -20, mouseY -20,5,20);
  ellipse(mouseX +20, mouseY -20,5,20);
  fill (255);
  text ("Now he is happy!!! :)",20,20,0) 
   
}
}
