
// Coursera - Open SUNY
// Introduction to Computational Arts: Processing
// by Dr. Margaret Anne Schedel, Mr. Timothy James Vallier

// Assignment #4: Curves of Pursuit
// Student: Daniel Wyllie Lacerda Rodrigues

// Intersections between math and visual arts have always fascinated me.
// My artwork is based on a well known effect in the 60s in the context 
// of Op Art. Eight tiles are drawn at the middle of the canvas. All 
// tiles have the same design. However, some of them are reflected in 
// relationship to their neighbours. A master tile is drawn at first. 
// This squared tile holds several smaller squares, one inside the 
// other. Each inner square shrinks and rotates. In the end, four 
// congruent logarithmic spirals are formed.

// Martin Gardner in his book called "My Best Mathematical and 
// Logic Puzzles" states the following problem (ex.16, page 8):
// Four bugs - A, B, C & D - occupy the corners of a square 
// 10 inches on a side. A and C are male, B and D are female. 
// Simultaneously, A crawls directly toward B, B toward C, 
// C toward D, and D toward A. If all four bugs crawl at the 
// same constant rate, they will describe four congruent 
// logarithmic spirals that meet at the center of the square.
// How far does each bug travel before they meet? The problem 
// can be solved without calculus.

// Did you ever played with the LOGO microworld in the 70s?
// Even kids can understand this algorithm without trouble.   
// Ivars Peterson writes about this kind of curves here:
// https://www.sciencenews.org/article/art-pursuit-3

//--------------------------
// INSTRUCTIONS
//--------------------------
// Press '+','-' to change the speed
// Press 'P' to pause / resume animation
// Press 'S' to save a screenshot
// Move cursor to the left to decrease the weigth of the strokes
// Move cursor to the right to increase the weigth of the strokes
// Click the left mouse button to toggle between 2 patterns
//--------------------------

// I uploaded this animation to YouTube (with sound)
// 

// I completed this Coursera Course before this one:
// https://www.coursera.org/records/euMnBmPBDu59cqFf

/**
Coursera - Open SUNY - Introduction to Computational Arts: Processing <BR>
by Dr. Margaret Anne Schedel, Mr. Timothy James Vallier <BR><BR>
Assignment #4: Curves of Pursuit <BR>
Student: Daniel Wyllie Lacerda Rodrigues <BR>
*/

//--------------------------
// Global Variables
//--------------------------
PImage    img;
PGraphics pg;
PFont     f;

int   shotCounter = 0;
float factor      = 0;  // dilation factor
float counter     = 0;  // counter
float speed       = 10; // speed
int   signal      = 1;  // 1 or -1
int   limit       = 4;  // number of squares           
int   halfSide    = 80; // side of the square 
                        // divided by 2
                        
boolean playMode  = true;  // play (true) or pause (false)
boolean lineMode  = false; // squares (true) or strokes (false)
boolean scoreMode = false; // useful to save sequences

// Messages
String [] message = {
  "Press '+','-' to change the speed", 
  "Press 'P' to pause / resume animation", 
  "Press 'S' to save a screenshot"
}; 

//--------------------------
// Setup
//--------------------------
void setup() 
{  
  size(800, 600);
  background(#246294);
  frameRate(30);
  cursor(CROSS);
  smooth();
 
  // Background image
  imageMode(CENTER);
  img = loadImage("frame.png");
  
  // font  
  f = createFont("MoolBoran-48", 18);
  textFont(f);
  
  // Buffer where the first tile will be drawn
  pg = createGraphics(2*halfSide, 2*halfSide);
}

//--------------------------
// Draw a Menu
//--------------------------
void drawMenu()
{
  // Draw a rectangle
  fill(0, 100);
  noStroke();
  pushMatrix();
  translate(width/2, 90);
  rectMode(CENTER);
  rect(0, 0, 360, 92);
  popMatrix();
  
  // Instructions
  textAlign(LEFT, CENTER);
  fill(255);
  text(message[0], 250, 62); 
  text(message[1], 250, 84);
  text(message[2], 250, 110);
  text("Speed:", 640, 540);
  text(round(speed), 700, 540);  
  text("Click and move the cursor from left to right and see what happens", 80, 540);
}


//--------------------------
// Draw Square
//--------------------------
void drawSquare(float cX, float cY)
{
  // Pattern 1
  // Draw Squares with Border
  if (lineMode)
  { 
    float weight = mouseX/200; 
    pg.strokeWeight(weight);
    pg.stroke(255);
    pg.fill(#246294,20);
    pg.quad(cX,  cY,  // A coordinates
            cY, -cX,  // B coordinates
           -cX, -cY,  // C coordinates
           -cY,  cX); // D coordinates
  }
  // Pattern 2
  // Draw Vertices as Circles
  else
  {
    pg.noStroke();
    pg.fill(255);
    float ray =  mouseX/10*pow(factor,1.4); 
    pg.ellipse ( cX,  cY, ray, ray); // A coordinates
    pg.ellipse ( cY, -cX, ray, ray); // B coordinates
    pg.ellipse (-cX, -cY, ray, ray); // C coordinates
    pg.ellipse (-cY,  cX, ray, ray); // D coordinates
  }
}


//--------------------------
// Draw All the 8 Tiles 
//--------------------------
void drawTiles()
{
  int i = 0;
  int j = 0;
  int sX = 1;
  int sY = 1;
  
  pushMatrix();
  translate(0, 30);
  for (int x=-3*halfSide; x<=3*halfSide; x += 2*halfSide)
  {
    for (int y=-halfSide; y<=halfSide; y += 2*halfSide)
    { 
      pushMatrix();
      translate(x+width/2, y+height/2);
      if (i%2==0)
      {
        sX=-1;
      }
      else
      {
        sX=1;
      }
      if (j%2==0)
      {
        sY=-1;
      }
      else
      {
        sY=1;
      }
      scale(sX, sY);
      image(pg.get(), 0, 0); 
      popMatrix();
      i++;
    }
    j++;
  }
  popMatrix();
}

//--------------------------
// Draw the First Tile
//--------------------------
void drawFirstTile()
{ 
  // Draw in a buffer called pg
  pg.beginDraw();
  pg.pushMatrix();
  pg.fill(#246294, 5);
  pg.rect(0, 0, pg.width, pg.height);
  pg.strokeJoin(ROUND);
  pg.translate(pg.width/2, pg.height/2);
  
  float pX = halfSide;  // x coordinate of the bottom right 
                        // corner of the outer square 
  
  float pY = halfSide;  // y coordinate of the bottom right 
                        //corner of the outer square 
  
  factor = map(counter, 0, 100, 0, 1); // dilation factor 
                                       // is a function of 
                                       // the counter

  // Draw inner squares up to the limit
  for (int x=0; x<limit; x++)
  {
    pg.stroke(map(x,0,3,0,255),20); 
    drawSquare(pX, pY); 
    float temp_pX = pX;
    pX = lerp(pX, pY, factor);
    pY = lerp(pY, -temp_pX, factor);
  }

  pg.popMatrix();
  pg.endDraw(); 
}

//--------------------------
// Main Draw Loop
//--------------------------
void draw() {

  // Draw the master tile
  drawFirstTile();

  // Draw on the main canvas
  background(0);
  image(img, width/2, height/2);
  drawTiles();
  drawMenu();

  // Increment counter
  counter += signal * speed/10 ;
  
  // Change the direction of the velocity
  if (counter > 99.8 || counter < speed/10)
  {
    signal = signal * (-1);
  }

  // Useful to prepare the PDF document
  if (scoreMode) 
  {
      println(shotCounter);
      if (shotCounter % 5 == 0)
        saveFrame("screenshot-"+shotCounter+".png");
      if (shotCounter == 100)
        noLoop();
      shotCounter++;
  }

}

//--------------------------
// MouseClicked Handler
//--------------------------
void mouseClicked()
{
  // Toggle the pattern
  lineMode = !lineMode;
  if (lineMode)
  {
     limit = 10;
  }
  else
  {
     limit = 4;
     pg.background(0);
  }
}

//--------------------------
// KeyPressed Handler
//--------------------------
void keyPressed()
{
  // Save a screenshot
  if ((key == 's') || (key == 'S'))
  {
    saveFrame("screenshot-#####.png");
  } 

  // Pause / resume the animation
  if ((key == 'p') || (key == 'P'))
  {
    if (playMode)
    {
      noLoop();
    }
    else
    {
      loop();
    }
    playMode = !playMode;
  }

  // Change the speed
  if (key == '+')
  {
    speed += 1;
  }

  if (key == '-')
  {
    speed -= 1;
  }
}

