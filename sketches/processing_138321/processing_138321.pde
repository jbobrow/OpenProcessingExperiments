
/* In this sketch I have used the dramatic color and flowing
forms of the Weave Silk program as a backdrop to create with.
The color scheme from my original Silk drawing is mimicked
within the trailing dots that can be sporadically sprinkled
all over the canvas or can be used to draw or write with. 
Also, there are several backdrops to choose from and the 
addition of random appearing bubbles. Overall it reminds me
of space, which was my initial concept.
*/

/* Instructions:
-Create trailing dots - Click the mouse and drag
-Create random white bubbles - Press and hold the 1 key
-Change to background 2 and clear canvas - Press 2
-Change to background 3 and clear canvas - Press 3
-Return to original background and clear canvas- Press 4
-Save screenshot - Press s or S key
*/

//Global variables
color[] mute = {#8E70A1, #BF4C32, #35943B, #00E8E8, #C75D97};
color[] burst = {#3AFF00, #FF9E00, #00CEFF, #FF00A6, #AEED29};

//Declare PImage variables
PImage silk;
PImage border;
PImage star;

//Setup
void setup() {
  size(1280, 696);
  silk = loadImage("silken beauty.png");
   image(silk, 0, 0);
}


//Draw block
void draw() {

//Trailing dots  
  if (mousePressed) {
    stroke(burst[int(random(5))]);
    fill(mute[int(random(5))]);
    strokeWeight(2);
    ellipse(mouseX,mouseY,5,5);
      }
}

//Key interaction
void keyPressed() {
  switch(key){
    
//Bubbles
  case '1':
    stroke(#FFFFFF);
    strokeWeight(random(5)); 
    noFill();
    float x = random(1280);
    float y = random(700);
    float d = random(20, 50);
   ellipse(x, y, d, d);
  break;
  
//Second background and clear canvas  
  case '2' :
   border = loadImage("silken border.png");
   image(border, 0, 0);
   break;

//Third background and clear canvas  
  case '3': 
   star = loadImage("a star is born.png");
   image(star, 0, 0);
   break;

//Return to original background and clear canvas   
  case '4' :
    silk = loadImage("silken beauty.png");
   image(silk, 0, 0);
   break;
  
  } 
//Save screenshot  
if (key=='s' || key=='S') saveFrame("screenshot.jpg");
 }


