
/* Digital Toy Pseudocode

An aerial view of a recycling factory.

Create array that holds randomly generated members,
numbered 0 through 3.
  mat[0] == paper
  mat[1] == plastic
  mat[2] == glass
  mat[3] == aluminum
This will be an array of objects, so each number is
an object. The display() function will check if the
array member is a 0, 1, 2, or 3, and display accord-
ing to that number.
  mat[0].display() == white
  mat[1].display() == light blue
  mat[2].display() == green
  may[3].display() == gray
They will also share a move() function that moves them
on a conveyor belt at the same speed.

                plastics   glass
      paper                         aluminum
      \    \    |     |   |    |    /    /
       \    \   |     |   |    |   /    /
        \    \  |     |   |    |  /    /
         \    \ |     |   |    | /    /
          |---   -----     ----   ----|
          |                           |
          |                           |
          |                           |
          |                           |
          
Objects move on a straight line on this conveyor belt.
Whatever object is at the top of the line is "live."
It is the user's responsibility to click the gate that
corresponds to the object, opening the gate and letting
it fall into the right bin. If a user clicks the wrong
gate, nothing happens. Therefore, these gates will be
held in another array of SIZE = 4 with numbers that
correspond to their recyclables.
  gate[0] == paper
  gate[1] == plastic
  gate[2] == glass
  gate[3] == aluminum
  
A function will check to see if the number at the index
of the material object array and the number of the gate
clicked are matching. If so, the gate will open and the
material will go in (we'll see if I can actually ani-
mate this. Otherwise, it will just be inferred). If not,
the gate will remain closed and the material will keep
moving.

shuffle bins instead of gates
currentBin variable holds bin in center
currentMat variable holds mat at top of line
check to see if variable matches number in array

*/

int correctBin;
int binClicked;
int timerStart;
boolean clicked = false;
bins[] binArray;
int[] positions = {50,250,450,650};
color[] colors = {color(227,226,224), color(134,191,211), color(30,108,50), color(153,151,152)};
int repeats[] = {4, 4, 4, 4};
PImage[] images = new PImage[4];

// 0 = paper
// 1 = plastic
// 2 = glass
// 3 = aluminum

float matX = 400;
float matY = 800;
float matSpeed = 4;
color matColor;

void setup()
{
  size(800,800);
  binArray = new bins[4];
  for(int i = 0; i < 4; i++)
  {
   binArray[i] = new bins(color(0,0,0), positions[i], 250, 100, 100); 
  }
  for ( int i = 0; i< 4; i++ )
  {
  images[i] = loadImage( i + ".jpg" );
  }
  reset();
}

void randomize()
{
  for(int i = 0; i < (colors.length-1); i++)
  {
 float swap = int(random(2));
   if(swap == 1)
   {
    color tempColor = colors[i];
    colors[i] = colors[i+1];
    colors[i+1] = tempColor;
  }
  }
}

void reset()
{
 correctBin = int(random(4));
 binClicked = -1;
 clicked = false;
 background(200);
 randomize();
 for (int i = 0; i < 4; i++)
 {
  binArray[i].setColor(colors[i]);
 }
}

void mat()
{
  matColor = binArray[correctBin].getColor();
  int correctImage = 0;
  
  if(matColor == color(227,226,224))
  {
    correctImage = 0;
  } else if(matColor == color(134,191,211))
  {
    correctImage = 1; 
  } else if(matColor == color(30,108,50))
  {
   correctImage = 2; 
  } else if(matColor == color(153,151,152))
  {
   correctImage = 3; 
  }
  
  fill(matColor);
  rect(350,matY,99,99);
  image(images[correctImage],350,matY,100,100);
  
  if(matY > -25)
  {
   matY -= matSpeed; 
  } else {
    matY = 800;
  }
}

void draw()
{
  background(209,176,199);
  
  fill(31,74,166);
  textSize(72);
  text("RECYCLE!", 250, 100);
  textSize(20);
  text("The color of the recyclable matches the color of its bin!",140,200);

  
  if (millis() > timerStart + 10 && clicked == true)
  {
   reset(); 
  }
  for(int i = 0; i < 4; i++)
  {
    binArray[i].display();
  }
  mat();
}

void mouseClicked()
{
 for (int n=0; n < 4; n++)
 {
  if (dist(mouseX,mouseY,positions[n],250) < 100)
  {
    binClicked = n;
    if (correctBin == binClicked)
    {    
      clicked = true;
    }
  }
  if (clicked)
  {
   matY = -25;
   timerStart = millis();
  }
 } 
}
class bins {
  int x;
  int y;
  int binWidth;
  int binHeight;
  color binColor;
  
  bins(color tempCol, int tempX, int tempY, int tempBinWidth, int tempBinHeight) {
   x = tempX;
   y = tempY;
   binWidth = tempBinWidth;
   binHeight = tempBinHeight;
   binColor = tempCol;
  }

    void setPos(int xx, int yy) {
      x = xx;
      y = yy;
    }
    
    void setBin(int tempBinWidth, int tempBinHeight) {
      binWidth = tempBinWidth;
      binHeight = tempBinHeight;
    }
    
    int getBinWidth()
    {
     return binWidth; 
    }
    
    int getBinHeight()
    {
     return binHeight; 
    }
    
    void setColor(color c) {
      binColor = c;
    }
    
    color getColor() {
      return binColor; 
    }

    void display() {
      fill(binColor);
      rect(x,y,binWidth,binHeight);
    }
}
class mat {
  int x;
  int y;
  int matWidth;
  int matHeight;
  color matColor;
  float speed;
  
  mat(color tempCol, int tempX, int tempY, int tempMatWidth, int tempMatHeight, float tempSpeed) {
   x = tempX;
   y = tempY;
   matWidth = tempMatWidth;
   matHeight = tempMatHeight;
   matColor = tempCol;
   speed = tempSpeed;
  }

    void setPos(int xx, int yy) {
      x = xx;
      y = yy;
    }
    
    void setMat(int tempMatWidth, int tempMatHeight) {
      matWidth = tempMatWidth;
      matHeight = tempMatHeight;
    }
    
    int getMatYPos()
    {
     return y; 
    }
    
    int getMatXPos()
    {
     return x; 
    }
    
    void setColor(color c) {
      matColor = c;
    }
    
    color getColor() {
      return matColor; 
    }

    void display() {
      fill(matColor);
      rect(x,y,matWidth,matHeight);
    }
    
    void move() {
      if(getMatYPos() > -25)
      {
        y -= speed;
      
      } 
    }
}


