

int numFrames = 2;  // The number of frames in the animation  
int frame = 0; 
int x;

int maxStarSize = 14;
String graphicsMode =  P2D;
ArrayList fallingChars;
 

PImage[] images = new PImage[numFrames]; 
PImage IDA;
PImage ChIDA;


void setup(){
 size(750,120); 
 
  frameRate(5); 
 images[0] = loadImage("a3.png");
 images[1] = loadImage("a4.png");
 
 
  IDA = loadImage ("IDA1.png");
 ChIDA = loadImage ("ChIDA1.png");
 
  
  colorMode(RGB, 255, 255, 255, 255);
  fallingChars = new ArrayList();  
  for( int i = 0; i< 60; i++)      
    CreateChar(1);
}

 
 

 


void draw(){
  
background(0);

image (IDA, 500, 5);



if (x > 400) {
image (ChIDA, 500, 10);
}else{
  image (IDA, 500, 5);
}

frame = (frame+1)%numFrames; 
image(images[frame], x, 0); 
x=mouseX;



  for (int i = fallingChars.size()-1; i >= 0; i--)
  {   
      fallingStar fc = (fallingStar) fallingChars.get(i);
      if (fc.notVisible() ) fallingChars.remove(i);
      else
      {
        fc.fall();
        fc.display();
      }
  }
  if ((frameCount & 2) > 0 )
  {
    int x = (int)random(4);
    for (int j = 0; j < x; j++)
      {
          CreateChar(4);  // top 1/4th
          CreateChar(8);  // top 1/8th
      }
  }



}


class fallingStar {
  int mx;
  float my;
  int mAlpha;
  float mSize;
  float mRotate;
  int mnPoints;
  //constructor
  fallingStar(int x, int y)
      {mx = x;
       my = y;
       mAlpha = 255;
       mSize = random(maxStarSize);
       mRotate = random(TWO_PI);
       mnPoints = 5 + (int)random(5);
      }
     
  boolean notVisible() {
    if (my < 0) {return false;}
    else
    return (my > height) || (mAlpha < 0)  || (mSize < 1.5);
    }
   
  void display()
    {
      if (!notVisible()) {
      fill(color(255,255,255), mAlpha);
      pushMatrix();
      translate(mx - mSize /2, my - mSize /2);
      rotate(mRotate);
      star(mnPoints,mSize, mSize/4);
      popMatrix();
      }
    }
     
   void fall()
    {
      mAlpha = mAlpha - 1;
      my = my + 1 + mSize / 5;
      mSize = mSize * 0.99;
    }
}
 
void CreateChar(int n)
{
      int x = (int)random(width);
      int y = (int)random(height/ n);
      if (n == 1) 
      fallingChars.add(new fallingStar(x, y)); 
      else // top-up
      fallingChars.add(new fallingStar(x, -y));  
}

void star(int nPoints, float rad1, float rad2)
{
float angle = TWO_PI / nPoints;
float angle2 = angle / 2;
float origAngle = 0.0;
beginShape();
fill(255,255,255);
stroke(255,255,255);
strokeWeight(1);
for (int i = 0; i < nPoints; i++)
  {
  float y1 = rad1 * sin(origAngle);
  float x1 = rad1 * cos(origAngle);
  float y2 = rad2 * sin(origAngle + angle2);
  float x2 = rad2 * cos(origAngle + angle2);
  vertex(x1, y1);
  vertex(x2, y2);
  origAngle += angle;
  }
endShape(CLOSE);
}


