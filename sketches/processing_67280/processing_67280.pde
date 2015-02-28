
/* 
 a little alien made of a few shapes
 now with setup() and draw()
 
 introducting mouseX and mouseY
 
 figure out where the center of your character is
 subtract or add from mouseX and mouseY to make shapes move
 related to the mouse
 
 */

void setup() {
   //this runs once to set up the program
  size(400, 400);
  smooth();
}

void draw() {
  //this gets called over and over 
  background(5,97,131);
  ellipseMode(CENTER); //default but let's do it anyways
  strokeWeight(2);
  
   //shadow
  fill(9,87,129);
    float currY = mouseY;
    float shadowScale = currY/400;
  ellipse(mouseX, 380, (200*shadowScale), (50*shadowScale));
  

  
  //feet
  stroke(0);
  fill(50);
  //ellipse(160, 370, 40, 20);
  //ellipse(240, 370, 40, 20);
  ellipse(mouseX-40, mouseY+70, 40, 20);
  ellipse(mouseX+ 40, mouseY+70, 40, 20);
  
  //body
  fill(200);
  ellipse(mouseX, mouseY, 190, 140);
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY-2, 180, 140);
  
  //eyes
  stroke(0);
  fill(255);
  ellipse(mouseX-40, mouseY-60, 60, 60);
  ellipse(mouseX+40, mouseY-60, 60, 60);
  
  //inner eyes
  noStroke();
  fill(50);
  ellipse(mouseX-40, mouseY-50, 25, 25);
  ellipse(mouseX+40, mouseY-50, 25, 25);
  
  noStroke();
  fill(255);
  ellipse(mouseX-42, mouseY-55, 8,8);
  ellipse(mouseX+44, mouseY-55, 8,8);
  
  //nose
  noStroke();
  fill(50);
  ellipse(mouseX, mouseY-20, 50, 30);
  


}





