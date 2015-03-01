

PImage img;
//-------------- Global Variables ----------------------

//--------------setup()----------------------------
void setup()  {
  //change the way processing interprets color Data
  //colorMode(mode, redRange, greeRange, blueRange);
  size(1000, 600);
  img = loadImage("new4.png");

  background(161, 161, 161);
  
}

//------------------draw()---------------------
void draw()  {
  image(img, 0, 0);
  stroke(mouseX, mouseY, 100);
  fill(mouseY, mouseX, 150);
  ellipse(500, 230, 195, 195);
  strokeWeight(5);
  
   ellipse(501, 230, 130, 130);
   ellipse(503, 230, 80, 80);

  //-----Transform the grid---
  pushMatrix();
  stroke(100, mouseX, mouseY);
  translate(100, 100);
  scale(1.5);
  rotate(radians(15));
  stroke(mouseX, 150, mouseY);
  ellipse(420, -25, 130, 130);
  ellipse(422, -25, 100, 100);
  ellipse(423, -25, 65, 65);
  popMatrix();
  fill(mouseX, mouseY, 75);
  if(keyPressed == true) {
  ellipse(300, 200, 125, 125);
  }

  //--------Input------------
  
  
  //keyPressed
}
  
//---------MouseInput--------------
//mouseMoved() 
void mouseMoved()  {
  //mouseMoved() function is called
  //every time the mouse moves and a mouse
  //button is not pressed.
  
 
}
//mouseDragged()
void mouseDragged()  {
  //The mouseReleased() function is called
  //evey time a mouse button is released.
 
}

//mouseReleased()
void mouseReleased()  {
  //The mouseReleased() function is called
  //evey time a mouse button is released.
 
}

//--------------Keyboard Input-----------------
//keyPressed()
void keyPressed()  {
  //The keyPressed() function is called
  //once every time a key is pressed.
  //The key that was pressed is stored
  // in the key variable
 if (key == ENTER ) background(100);
  if (key =='s' || key == 'S') saveFrame("new4.png");
    
}
//keyReleased()
void keyReleased()  {
  //The keyReleased() function is called
  //once every time a key is released.
  //THe key that was released will be
  //stored in the key variable.

 
  
}
  
  

