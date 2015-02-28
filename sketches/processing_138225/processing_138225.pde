
/*

-- Simple Painter --

  Simple Painter is interactive sketch in which you can draw points or draw with brush in black, white or various shades of grey.
  There are also other options: erasing Canvas, saving Screenshots, selecting Stroke Weight and Turning On/Off Mouse Speed Parammeter.

Controls
  Mouse
    LEFT BUTTON   - Brush
    RIGHT BUTTON  - Point
    WHEEL         - Stroke Color
  Keyboard
    DELETE or BACKSPACE   - Erase
    Key 's' or 'S'        - Save Screenshot
    Key 'i' or 'I'        - Increase Stroke Weight
    Key 'u' or 'U'        - Decrease Stroke Weight
    Key 'j' or 'J'        - Darker Stroke Color
    Key 'k' or 'K'        - Brighter Stroke Color
    Key 'm' or 'M'        - Mouse Speed Parammeter On/Off
    
*/


// Global Variables

// Display Size
int dWidth = 1280;
int dHeight = 720;
// Stroke 
// Stroke Weight
float sW;
// Fixed amount of Stroke Weight
int sV = 1;
// Stroke Weight based on Mouse speed and additional parammeter
float sM = 1;
float sP = .2;
// Stroke Color
float sC = 0;

// M Signe Color
int mSC = 255;


// Setup Block
void setup(){
  // Screen Size, Color Mode and Background
  size(1280, 720); 
  colorMode(HSB);  
  background(#6B8FD4);
}


// Draw Block
void draw(){
  // Design
  // Frame 1
  stroke(0);
  strokeWeight(10);
  noFill();
  rect(0, 0, 1280, 720);
  
  // Frame 2  
  noStroke();
  fill(#05296E);
  rect(5, 5, 1270, 80);
  noFill();
  stroke(0);
  strokeWeight(5);
  line(0, 80, 1280, 80);
  
  // Text
  textAlign(CENTER);
  fill(255);
  textSize(25);
  text("S I M P L E          P A I N T E R", 640, 50);
  // Visuals
  // M Sign
  fill(mSC);
  textSize(15);
  text("M", 631, 75);
  // Stroke Weght
  fill(255);
  text(sV, 631, 18);
  // Stroke Color
  noStroke();
  fill(sC);
  ellipse(630, 40, 40, 40);
  
  
  // Painting Area
  // Stroke Color
  stroke(sC);
  
  // Checking if mouseX and mouseY are inside the painting area 
  if(mouseX > 5 && mouseX < 1275 && mouseY > 85 && mouseY < 715){
  
    // Drawing with Brush when using LEFT key of the mouse
    if(mousePressed && mouseButton == LEFT){
      // strokeWeight depending on mouse speed
      sM = abs((mouseX - pmouseX)+(mouseY - pmouseY)) * sP;
      // strokeWeight
      sW = (sM + sV);    
      strokeWeight(sW);
      // Drawing Line
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  
    // Drawing Points when using RIGHT key of the mouse
    if(mousePressed && mouseButton == RIGHT){
      // strokeWeight depending on mouse speed
      sM = abs((mouseX - pmouseX)+(mouseY - pmouseY)) * sP;
      // stroke weight
      sW = (sM + sV);    
      strokeWeight(sW);
      // Drawing Point
      point(mouseX, mouseY);
    }
  }
}


// Mouse Input
// Mouse Wheel is used for selecting color
void mouseWheel(MouseEvent event){
  if(event.getAmount() == 1) sC = abs(sC + event.getAmount()) + 25;
  if(event.getAmount() == -1) sC = abs(sC + event.getAmount()) - 25;
  if (sC < 0) sC = 0;
  if (sC > 255) sC = 255;
}

// Keyboard Input
void keyReleased(){
  // Clear the screen
  if(key == DELETE || key == BACKSPACE) background(#6B8FD4);
  // Save the screen
  if(key == 's' || key == 'S') saveFrame("screenshot####.png");
  // Increase Stroke Weight
  if(key == 'i' || key == 'I'){
    sV = sV + 5;
    if (sV >= 50) sV = 50;
  }
  // Decrease Stroke Weight
  if(key == 'u' || key == 'U'){
    sV = sV - 5;
    if(sV <=1) sV = 1;
  }
  // Stroke Color
  if(key == 'j' || key == 'J'){
    sC = sC - 25;
    if (sC <= 0) sC = 0;
  }
  if(key == 'k' || key == 'K'){
    sC = sC + 25;
    if (sC >= 255) sC = 255;
  }
  // Turn On or Turn Off Mouse Speed Parammeter
  if(key == 'm' || key == 'M'){
    if(sP != 0){
      sP = 0;
      mSC = 0;
    }
      else if(sP == 0){
        sP = 0.2;
        mSC = 255;
      }
  }
}


