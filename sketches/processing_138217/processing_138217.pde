
// This is my Project for the course of Art with Processing
// Is very simple, whit this I like to show some thing that
// I would like to have in the night here in Switzerland in the
// city Lugano and near in the beach.
// Basically to put messages in the sky for to see for all people.
// For this I created the star in the sky for the night appear one to one
// if press the mouse, and put a sound of the background.
// Also, I put the user interaction with the following:
// press 't' or 'T' for to show a text static
// press 'r' or 'R' random color for the stroke to star
// press 'delete/backspace' for clear the drawing
// press 's' or 'S' fot to save the screenshot
// press '0' hasta el '3' for to change the color the star
// press click left in the mouse for generate other stars


// Import Library
import ddf.minim.*;

// GLobal Variables
Minim minim;
AudioPlayer nature;
PFont f;


// Define Color Palette
color[] palette = {#1D1AB2, #323086, #0B0974, #514ED9, #7573D9};
float counter = 0;
int strokeColorIndex = -1;

// Create setup code block
void setup(){
 //window size for the sky
 size(800, 600);
 //HSB color mode
 colorMode(HSB, 360, 100, 100, 100);
 //select the third color from the selected palette
 background(palette[2]);
 //Audio player in the background
 minim = new Minim(this);
 nature = minim.loadFile("nature.wav");
 nature.play();
 //font for the text
 f = createFont("Arial",42,true);
}

//Create the draw code block
void draw(){
 //Setup while loop counting up to 20
 if (mousePressed){
    // change the color
    if (strokeColorIndex == -1)
      stroke(color(random(0, 360), random(0, 100), random(0, 100)));
    else
      stroke(palette[strokeColorIndex]);
   //Set stroke weight
   strokeWeight(3);
   //Set fill color randomly from palette
   fill(palette[int(random(1, 5))]);
   //set star offset randomly horizontal randomly
   float d = random(10, 800);
   //set star offset randomly vertical randomly
   float g = random(10, 600);
   //draw Stars using Shape   
   while(counter < 20){
   beginShape();
   vertex(d+0, g-50);
   vertex(d+14, g-20);
   vertex(d+47, g-15);
   vertex(d+23, g+7);
   vertex(d+29, g+40);
   vertex(d+0, g+25);
   vertex(d-29, g+40);
   vertex(d-23, g+7);
   vertex(d-47, g-15);
   vertex(d-14, g-20);
   endShape(CLOSE);
   //change limiter count randomly between -1 and +2
   counter += random(-1, +2);
   }
   counter = 0;
   
 }
}

// Create key released code block
void keyReleased() {
  // clear the drawing
  if (key == DELETE || key == BACKSPACE)
    background(360);
  // save current drawings
  if (key=='s' || key=='S') 
    saveFrame(timestamp() + ".png");
  // put text
  if (key=='t' || key=='T') {
    //Specify font to be used
    textFont(f,42);  
    //Specify font color    
    fill(#FFFFFF);         
    //Display Text    
    text("Buon Wekend!",10,height/2);  
  }
    
  // select colors
  switch (key) {
    case '0':
    case '1':
    case '2':
    case '3':
      strokeColorIndex = key - '0';
      break;
    case 'r':
    case 'R':
      strokeColorIndex = -1;
      break;
  }
}

// timestamp return the current time
String timestamp() {
  return String.valueOf(year()) + '_' + String.valueOf(month()) + '_' + String.valueOf(day()) + '_' + String.valueOf(hour()) + '_' + String.valueOf(minute()) + '_' + String.valueOf(second());
}




