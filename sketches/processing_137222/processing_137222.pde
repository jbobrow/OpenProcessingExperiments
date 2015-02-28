
PFont candara;
PFont vijaya;
PFont arial;
float timer = 0;
float x = 0;
float myscale = 1;
float myscalespeed = 0.01;
float xspeed = 1;
float rad = 0;

PImage JackFrost; 

         
void setup()
{
  size(500,500);
 
  vijaya = createFont("Vijaya",32);
  arial = createFont("Arial",32);
  centurygothic = createFont("CenturyGothic",32);
  
  JackFrost = requestImage("JackFrostDS.jpg");
}
 
 
void draw()
{ 
  image(JackFrost, 0, 0, width, height);
    
  // draw red text
  textFont(centurygothic);
  // we can store text in variables
  String s = "Heeho!!";   
  // textWidth gets the width our text is taking up (useful for formatting and collision)
  float widthOfcenturygothic = textWidth(s);
  // bounce off left and right
  if (x > width - widthOfcenturygothic)
  {
    xspeed = -1;
  }
  else if (x < 0)
  {
    xspeed = 1;
  }
   
  // move left or right depending on speed
  x += xspeed;
   
  // change the angle of rotation
  rad += 0.01;
   
   
  // draw the red text
  fill(0, 255, 0);
  textAlign(LEFT, TOP);
  text(s, x, 400); 
   
  fill(255);
  textFont(arial);
  text("Adorable", 0, 0, 200, 400);
  text("Innocent", 0, 450, 200, 400);
  text("Silly", 420, 0, 200, 400);
  text("Cute", 420, 450, 200, 400);
  
  fill(0, 255, 0);
  pushMatrix();
  // move the vijaya text to 100, 100
  translate(150, 100); 
  // rotate by the angle in rad
  rotate(rad);  
  // set font to vijaya
  textFont(vijaya);
  textAlign(CENTER,TOP);
  textSize(32);
  text("Fairy", 0, 0, 200, 400);
  popMatrix();
  
  textSize(25);
  text("Let's be friends!", 5, 250, 200, 400);
  
  fill(255, 0, 0);
  pushMatrix();
  // move the vijaya text to 100, 100
  translate(350, 100); 
  // rotate by the angle in rad
  rotate(rad);  
  // set font to vijaya
  textFont(vijaya);
  textAlign(CENTER,TOP);
  textSize(32);
  text("Demon", 0, 0, 200, 400);
  popMatrix();
  
  text("I'll teach you a lesson you'll never forget!", 330, 250, 200, 400);
  fill(255);
  textFont(arial);
  textSize(32);
  text("Ice magic", 180, 100, 200, 400);
  
}


