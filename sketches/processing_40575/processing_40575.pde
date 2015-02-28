
//homework 8
//copyright Jessica Schafer, Sept. 2011, pittsburgh, pa
//basic game


//variables for automatic object
int dim = 50; //width
float objectx, objecty; // position 
float speedx, speedy; // change in  location
float directionx, directiony; //direction 
//colors
color col1, col2, col3, col4, col5, col6;
//variables for user controlled puck, which is really not a puck...
float puckx, pucky, puckSize, deltapx, deltapy, j; //j is the increase in speed per arrow press
//other
int c; //count collisions
PImage react;

void setup()
{
  size (400, 400);
  smooth();
  directionx = directiony = 1;
  frameRate (30);
//randomly assigned starting position for auto object
  objectx = random(100, 300);
  objecty = random (100, 300);
//randomly assigned horizontal and vertical speeds 
//(must be different for haphazard bouncing pattern?)
  speedx = random (1, 3);
  speedy = random (4, 5);
//initial user-controlled puck variabes
  puckx = width-75;
  pucky = height-75;
  puckSize = 50;
  deltapx = 0;
  deltapy = 0;
  j = 1;
//colors
  col1 = color (255, 250, 213);//ivory -- background
  col2 = color (189, 73, 50);//orange
  col3 = color (219, 158, 54);//gold
  col4 = color (255, 211, 78);//yellow
  col5 = color (16, 91, 99); // blue -- auto object
  col6 = color (95, 144, 149);//lighter blue is want (not currently used)
//other
 c = 0; //collision counter
 react = loadImage ("pow.png"); //pow image!
}


void draw ()
{
  drawBackground(100);
  
  drawObject();
  moveObject();
  
  drawPuck(puckx, pucky, puckSize);
  movePuck();
  resetPuck();
 
  checkCollision();
  warningBox();
  showStats(deltapx, deltapy, c);   
}



//BACKGROUND

void drawBackground(int a)
{
 noStroke();
 fill (col1, a);
 rect (0,0, width, height); 
}

//RANDOMLY MOVING OBJECT

void drawObject()
{
 fill(col2); 
 ellipse (objectx, objecty, dim, dim); 
 fill (col1);
 ellipse (objectx, objecty, dim/3, dim/3); 
 fill (col3);
 ellipse (objectx+(dim/2), objecty, dim/4, dim/4);
 ellipse (objectx-(dim/2), objecty, dim/4, dim/4);
 ellipse (objectx, objecty+(dim/2), dim/4, dim/4);
 ellipse (objectx, objecty-(dim/2), dim/4, dim/4);
}

void moveObject()
{
 objectx = objectx + (directionx*speedx);
 if (objectx > (width - dim/2) || objectx < dim/2)
   {
     directionx = -directionx;
   } 
 
 objecty = objecty + (directiony*speedy);
 if (objecty > (height-dim/2) || objecty < dim/2)
 {
   directiony = -directiony; 
 } 
}


//USER-CONTROLLED PUCK

void drawPuck (float x, float y, float dim)
{
 fill (col5);
 ellipse (x, y, dim, dim); 
 //fill (col6);
 ellipse (x+(dim/2), y, dim/4, dim/4);
 ellipse (x-(dim/2), y, dim/4, dim/4);
 ellipse (x, y+(dim/2), dim/4, dim/4);
 ellipse (x, y-(dim/2), dim/4, dim/4);
}

void movePuck()
{
 puckx = puckx + deltapx;
 pucky = pucky + deltapy;  
}

void keyReleased() //move puck with arrows without multiple changes per key press
{
  if (keyCode == UP)
   {
    deltapy = deltapy - j;
    }
   else if (keyCode == DOWN)
    {
     deltapy = deltapy + j;
    }
   else if (keyCode == LEFT)
    {
     deltapx = deltapx - j;
    }
   else if (keyCode == RIGHT)
    {
     deltapx = deltapx + j;
   }
}

void resetPuck()
{
 if (key == ' ')
  {
    puckx = width-75;
    pucky = height-75;
    deltapx = 0;
    deltapy = 0;
  }
}

//COLLISIONS

void checkCollision()
{

  float d = dist(objectx, objecty, puckx, pucky);
  if (d < puckSize)
   {
    frameRate(5);
     col5 = color (random (10,60), random (30, 230), random (30, 230));
    col1 = col2;
    //col5 = change;
    imageMode (CENTER);
    image (react, puckx, pucky);
    c++;
    drawBackground(100);
      objectx = random(50, width-50);
      objecty = random (50, height-50);
      speedx = random (1, 3);
      speedy = random (4, 5);
   }
  else
   {
    col1 = color (255, 250, 213);
    drawBackground(25);
    frameRate (30);
   }
}


void warningBox()
{
 if (puckx > width+puckSize/2 || puckx < -puckSize/2 || pucky > height+puckSize/2 || pucky< -puckSize/2)
  {
    stroke(col5);
    strokeWeight(2);
    line (width/2, height/2, puckx, pucky);
    stroke(0);
    strokeWeight(1);
    fill (col1, 90);
    rect (100, 175, 200, 100);
    fill (0);
    String s = "You have left the building. Please return.";
    text (s, 115, 190, 170, 70 );
    warningHint();
  } 
}

void warningHint()
{
  float d = dist (width/2, height/2, puckx, pucky);
  float f = d - (200 + puckSize/2);
  int rf = round(f);
  String h = "You are "+ rf + " pixels away.";
  text (h, 115, 225, 170, 70);

}

//STATS

void showStats (float x, float y, int c)
{
  int hoz = int (x);
  int vert = int (y);
  noStroke();
  fill (col1, 70);
  rect (0, 360, width, height);
  fill (0);
  text ("Speed:", 30, 375);
  text ("horizontal: "+ hoz + "  vertical: "+vert, 30, 390); 
  int m = millis()/1000;
  text ("Time: "+ m+ " seconds", 225, 375);
  fill (col5);
  text ("Collisions: "+ c, 225, 390);
}


