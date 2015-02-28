
//Assignment #2
//Name: Ilena Yeru Pegan
//Email: ipegan@brynmawr.edu
//Course: CS 110 - Section #03
//Submitted: September 15, 2011

//This is a sketch of a horizon - the top of the image is the
//sky (space) and the bottom half the ground. When pressing down on your 
//mouse images will appropriately scale to the sky and the ground.

//Variables
float horizon;
float scale;

void setup () {
  size (500, 500);
  smooth ();
  background (203);
  horizon = random (250, 400);

//Ground: Moon
stroke (203);
fill (0);
rect (0, 0, 500, horizon);

//Space: Insert Earth Image
PImage b;
b = loadImage ("Earth.jpg");
image (b, 20, 20, width/6, height/6);

//Crater
stroke (170);
fill (170);
  //1st Set
ellipse (random(500), random(420,430), 100, 7);
ellipse (random (500), random (420, 430), 100, 7);
ellipse (random (500), random (420, 430), 100, 7);
  //2nd Set
ellipse (40, random (460,500), 200, 10);
ellipse (100, random (460,500), 200, 10);
}

 void draw() { 
  }

//Mouse Pressed & Scale Function
void mousePressed() {
  
  if (mouseY < horizon) {
    scale = (horizon - mouseY)/horizon;
    drawStar(mouseX, mouseY, scale);
  } else  {
    scale = (mouseY - horizon)/(500 - horizon);
    drawAlien (mouseX, mouseY, scale);
    }
    
  }
  
  
  // Function: Stars in Sky
  void drawStar(int mouseX, int mouseY, float scale ) {
    noStroke();
    fill(250);
    ellipse(mouseX , mouseY, 10 * scale, 10 * scale);
    ellipse(mouseX - (500 * scale), mouseY - random(500 * scale), 7 * scale, 7 * scale);
    ellipse(mouseX + (500 * scale), mouseY - random(500 * scale), 7 * scale, 7 * scale);
    
  }

  // Function: Aliens on Ground
    void drawAlien( int mouseX, int mouseY, float scale ) {
    noStroke();
    fill(78,242,87 );
    rect(mouseX ,mouseY ,20  * scale,70  * scale);
    fill(78,242,87 );
    ellipse((mouseX+ (10  * scale)),(mouseY- (10  * scale)),60 * scale,60 * scale);
    fill(0);
    ellipse((mouseX+ (2 * scale)),(mouseY -(17 * scale)),16 * scale,32 * scale);
    ellipse((mouseX+ (20 * scale)),(mouseY -(17 * scale)),16 * scale,32 * scale);

   
  }


