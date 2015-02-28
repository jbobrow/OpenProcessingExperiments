
//Nadav Hardof
//7/8/13
//Happy/Sad face.

void setup() {
  size(400, 400); // set screen size to 400 x 400
  background(0,0,255);
  smooth();
}

void draw() {
  background(240);
  
   ellipse(mouseX, mouseY, 80, 80);
  fill(0,220,0);
  ellipse(mouseX-15,mouseY-15,20,20);
  fill(0,220,0);
  ellipse(mouseX+15,mouseY-15,20,20);
  line(mouseX-15, mouseY+15,mouseX+15,mouseY+15);
  
  if (mousePressed == true) {
     fill(200, 0, 200); //***this value controls the clicked color
    line(mouseX-15, mouseY+15,mouseX+15,mouseY+15);
    arc(mouseX,mouseY+15,30,30,radians(0), radians(180));
  } 
  else {
    fill (255,255,0); //***this fill controls the unclicked color
  }
  /* try changing rect to oval!
   try changing the width and height of the shape 
   (the 3rd and 4th parameters) */

 
}
