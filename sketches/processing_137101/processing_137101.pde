
/*'The Eye' made by Fabien Bruttin
version: 1.0 (to be evaluated by peers of Coursera)


Press 'i' to see instructions


*/


/* Variables:
xoff & g : used for the function drawing the lines using perlin noise.
speed: speed of the line drawing
ppressed: store if the key p is pressed (to pause / run)
ipressed: store if the key i is pressed (show instuctions)
firststart: store if the program just started

*/
 float xoff = 0.0;
 float g=1;
 int speed = 5;
 boolean ppressed = false;
 boolean ipressed = false;
 boolean firstart = true;
 
// setup, simple black background, size of the sceen: 1000x600
void setup () {
size (1000,600);
background (0);
}


void draw () {
  
// check if the program just started and fix the color of the line randomely 
if (firstart) {
  stroke(random(250,255),random(255),random(255),100); 
  firstart = false;
}
 
// check if the key "i" is pressed, if its the case, shows the instuctions
 
  if (ipressed) {
     ppressed = false;
  background(0);
  textSize(50);
  fill(255);
  textAlign(CENTER, TOP);
  text("Instructions",width/2,10);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("1-3: Switch speed (1: slow >> 3: fast)",width/2,120);
  text("BACKSPACE or DEL : Erase screen",width/2,150);
  
  text("Right click: change color",width/2,210);
  text("Left click: run / pause",width/2,240);
  
  text("'s' or 'S': save a screenshot (as PNG)",width/2,300);
  text("'i': instructions",width/2,330);
  
  textSize(10);
  text("Original version made by F. Bruttin, feel free to modify/share !",width/2,500);
  

 }

// check if the key "p" is pressed / left button pressed and
// if so run the function which draw the lines

  if (ppressed) {
  xoff = xoff + 1;
  float n = noise(xoff)* width/2;
    for (float g = 1; g < 360; g = g+15) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(g);
    line(n, 0, mouseX*2, mouseY);
    delay(speed);
    popMatrix();
    }
  }
}

/* interaction with the mouse to pause the program (left button) or 
change the color of the line (right button).
*/

void mouseReleased() {
   if (mouseButton == LEFT) {
  ppressed=! ppressed;
ipressed = false;  
   }
   if (mouseButton == RIGHT) {
    stroke(random(255),random(255),random(255),100); 
   }

}

// key pressed fonction

void keyReleased() {
  if (key == DELETE || key == BACKSPACE)  background(0);
  if (key == 's' || key == 'S')  saveFrame("eyeScrenshot.png");
  
 switch(key) {
   
   case '1':
    speed = 5;
    break;
 
    case '2':
    speed = 2;
    break;
    
    case '3':
    speed = 0;
    break;
  
    case 'p':
    ppressed = !ppressed;
    break;
    
        case 'i':
        background(0);
    ipressed = !ipressed;
    break;
   
 }
}

