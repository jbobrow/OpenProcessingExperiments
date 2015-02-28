
// Assignment #3: Hinged Tessellation
// by Daniel Wyllie Lacerda Rodrigues

// This time I created a minimalistic artwork.
// A hinged tessellation is a tessellation to which 
// we add hinges in a regular fashion. We can pull 
// open the tessellation, rotating some of the polygons 
// (squares in this case), so that the background 
// becomes visible.

// CLICK ON THE LEFT MOUSE BUTTON ANYWHERE ON THE
// BLANK SCREEN TO START INTERACTING WITH THE APP.

// I uploaded this animation to YouTube (with sound)
// https://www.youtube.com/watch?v=3b3yzEPGaZQ

// I completed this Coursera Course before this one:
// https://www.coursera.org/records/euMnBmPBDu59cqFf

// Variables
color palette[] = { #3415B0, #FFCF00,
                    #FFA100, #0F4DAB,
                    #F80012, #1DD300,
                    #FFFFFF, #999999};               
int size_b;
int size_a;
int dir        = 1;
int time_den   = 120;
int fr         = 30;
int c_pal      = 0;

float cont = 0;

boolean showMenu = true;
boolean go_ahead = true;
boolean grid     = false;

final int BIG   = 0; 
final int SMALL = 1;

String [] message = {"Press '+','-' to change the frame rate",
                     "Press 'C' to change the color palette",
                     "Press 'S' to save a screenshot",
                     "Click to change mode"};                     
PFont f;

// Draw a Menu
void drawMenu()
{
  fill(255,255,255,100);
  noStroke();
  pushMatrix();
  translate(width/2,70);
  rectMode(CENTER);
  rect(0,0,310,92);
  popMatrix();
  textAlign(LEFT, CENTER);
  fill(255);
  text(message[0], 258, 42); 
  text(message[1], 258, 64);
  text(message[2], 258, 90);
  text(message[3], 25, 540);
  text("Frame Rate:", 614, 540);
  text(fr,717,540);
  text("fps",740,540);     
}

// Draw a Square given its coordinates
// The last parameter identify the kind of Square (BIG or SMALL)
void drawSquare(float x1, float y1, float x2, float y2, int index)
{
  fill(palette[index+2*c_pal]);
  if (grid)
  {
    noFill();
    strokeWeight(2);  
    stroke(255);
  }
  else
    noStroke();
  rect(x1, y1, x2, y2);
}

void setup()
{
  f = createFont("MoolBoran-48", 18);
  textFont(f);
  size(800, 600);
  smooth();
  noStroke();
  strokeJoin(ROUND);
  background(0);
  frameRate(30);
  cursor(CROSS);
}

void draw()
{
  
  if (go_ahead)
  { 
    size_b = 100 * mouseX/800;
    size_a = 100 - size_b;
    if (cont == time_den) 
      dir = -1;
    if (cont == 0) 
      dir = 1;
    cont += dir;  
    
    rectMode(CENTER);
    background(0);
    
    // Heart of the animation 
    pushMatrix();
    translate(width/2,60+height/2);
    rotate(-cont*PI/time_den);
    for (int i=0; i<4; i++)
    {
      rotate(PI/2);
      pushMatrix();
      translate(-size_b/2,-size_b/2);
      rotate(3*PI/2 + cont*PI/time_den);
      drawSquare(-size_a/2,-size_a/2,size_a,size_a,SMALL);
      translate(-size_a,-size_a);
      rotate(PI/2 - cont*PI/time_den);
      translate(-size_b,0);
      drawSquare(size_b/2,-size_b/2,size_b,size_b,BIG);
      rotate(-3*PI/2 + cont*PI/time_den);
      translate(0,-size_a);
      drawSquare(size_a/2,size_a/2,size_a,size_a,SMALL);
      rotate(-PI/2 - cont*PI/time_den);
      drawSquare(size_b/2,size_b/2,size_b,size_b,BIG);
      translate(0,size_b);
      rotate(-3*PI/2 + cont*PI/time_den);
      drawSquare(size_a/2,-size_a/2,size_a,-size_a,SMALL);
      translate(0,size_b);
      popMatrix();
    }
    drawSquare(0,0,size_b,size_b,BIG);
    popMatrix();
 
    if (showMenu)
      drawMenu();
    else
    {
      saveFrame("screenshot-#####.png");
      showMenu = true;
    }
  }
}

// mouse Handler
void mousePressed()
{
   // Change mode
   grid = !grid;
}

// key Handler
void keyPressed()
{
    // Change the frame rate
    if ((key == '+') && (fr <60)) 
      fr ++;
    if ((key == '-') && (fr >22))
      fr --;
    frameRate(fr);
    
    // Save a screenshot 
    if ((key == 's') || (key == 'S'))
      showMenu = false;
      
    // Change palette
    if ((key == 'c') || (key == 'C'))
      c_pal ++;
    if (c_pal > 3)
      c_pal = 0;
}

