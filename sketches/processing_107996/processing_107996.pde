
//Triangle creator "Origami." by Neha Rao ITEC Comp Graphics and Multimedia Section 01 Fall 2013  (randomized triangles in a randomized bg.)

//Refresh the page and the BG  color changes!

int x=25;
int y=50;
int xspeed = 2;
int yspeed = 4; //Speed of triangle paper spawns.
 
void setup () {
   
  size (600,600);
  smooth ();
  background(random(255),random(255),random(255)); //Randomize the background.
}
 
 
 
void draw () {
  fill(random(255),random(255),random(255)); //Randomized the "drawn" triangles.
   
   triangle( x, y, 200, x, y, 200);
  x += xspeed;  //Speed settings.
  y += yspeed;
   
 if (x>width-25) { //Width settings for X value.
    
   xspeed = -xspeed;
 }
    
  else if (x<25) {
     
    xspeed = -xspeed;
     
  }
   
  if (y<25) {
     
    yspeed = -yspeed;
     
  }
   
  else if (y>height-25) {
     
    yspeed = -yspeed;
     
  }

  
  
}
   //If the mouse is pressed, create a triangle of said x, y, values.
   
  void mousePressed () {
     
    triangle( mouseX, mouseY, 200, mouseX, mouseY, 200);
     
}
 
 
  void keyPressed () {
     
    background (130,0,150);  //When you press a key, you can move the triangles spawning location. :D
     
  }
