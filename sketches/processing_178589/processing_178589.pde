
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

PImage img;
PImage character;

Animation runAnim;
Animation walkAnim;
Animation homeAnim;

ArrayList<ArrayList> dotArr;
int dotArrSize;
int rowArrSize;

int colPixelNum, rowPixelNum;
int colDotCount;
int rowCount;

int start_col_num = 80;

int prevX=9999;

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

class Dot {
  public int x, y, radius;
  public float r,g,b,a;
  
  boolean isFixed;
  
  public Dot(int _x, int _y, int _radius, float _r, float _g, float _b, float _a)
  {
    x=_x; y=_y; radius=_radius ; r=_r ; g=_g ; b=_b; a=_a; 
    isFixed = false;
  }
  
  public void drawDot(int additionalRadius)
  {
    if(a==255)
    {
      Coord coord = coordinateIndexAtMousePosition(x,y);
      
      if(coord.y-1>=0)
      {
        Dot dot = (Dot)dotArr.get(coord.y-1).get(coord.x);
        
        if(dot.isFixed == true)
        {
         isFixed = true; 
        }
        
        if(dot != null)
        {
          dot.touchDot();
        } 
      } 
      else
      {
        isFixed = true;
      }
    }
    
    fill(r,g,b,a);
    int nRadius = radius + additionalRadius;
    ellipse(x+radius/2,y+radius/2,nRadius,nRadius);
  
    if(isFixed == false)
      a -= 10;
  }
  
  public void touchDot()
  {
    a=255;
  }
}

class Coord {
 public int x, y; 
}

void setup()
{
  //background(255);
  
 img = loadImage("image2.png");

 //size(img.width, img.height);
 size(840, 557);
 //frameRate(5);
 minim = new Minim(this);
 song = minim.loadFile("test.mp3");
 song.play();
 
 fft = new FFT( song.bufferSize(), song.sampleRate() );
 
 createColorMatrix(start_col_num,0);
 drawColorMatrix(0);
 
 //colDotCount = ((ArrayList)dotArr.get(0)).size();
 colDotCount = rowArrSize;
 //rowCount = dotArr.size();
 rowCount = dotArrSize;
 
 // Add Character git animation
 runAnim = new Animation("run", 9);
 walkAnim = new Animation("walk", 8);
 homeAnim = new Animation("home", 8);
 
 //song.skip( 230000 );
 
}

boolean isDrawingSmallDot = false;
boolean isEnd = false;
int pVal = 241000;
int maxRowCount = start_col_num;
int pInterval = 400;
int rowInterval = 10;

int touchX = 0;
int touchX2 = 0;
int adder = 1;
int adder2 = 1;

boolean drawSmallDots()
{
  if(maxRowCount > 200)
    return true;
    
  if(song.position() >= pVal)
  {
   createColorMatrix(maxRowCount,255);
   
   background(0);
   drawColorMatrix(2); 
   
   maxRowCount += rowInterval;
   pVal += pInterval;
   
   isEnd = true;
   
   return true; 
  }
  else
  {
   return false; 
  }
}

void draw()
{  
  if(drawSmallDots())
  {
   return; 
  }

  if(isEnd)
  {
   return; 
  }
  
  background(0);
  
  float p = song.position();
  float sLength = song.length();
  float aniX = p/sLength*(img.width - 130);
  float posY = img.height-80;
  //println(p);
  if(239700 < p)
  {
    walkAnim.display(aniX,posY); 
  }
  else if(127400 < p)
  {
    runAnim.display(aniX,posY);
  }
  else if(80700 < p)
  {
    walkAnim.display(aniX,posY);
  }
  else if(47400 < p)
  {
    runAnim.display(aniX,posY);
  }
  else
  {
    walkAnim.display(aniX,posY);
  }
  
  homeAnim.display(img.width-110,img.height-110);
  
  int additionalRadius = 0;
  fft.forward( song.mix ); 
  float freqSum = 0;
  for (int i = 50; i < 150; i++) {
    freqSum += fft.getBand(i);
  }
  if(freqSum > 300)
  {
    additionalRadius = (int)freqSum/300;
  }
  
  Coord coord = coordinateIndexAtMousePosition(mouseX, mouseY);
  Dot touchedDot = (Dot)dotArr.get(coord.y).get(coord.x);
  if(adder == 1 && touchX == colDotCount-1)
  {
    adder = -1;
  }
  else if(adder == -1 && touchX == 0)
  {
    adder = 1; 
  }
  touchX += adder;
  
  stroke(0,0,0,0);
  if(touchedDot != null && prevX != coord.x)
  {
       touchedDot.touchDot();
       touchedDot.drawDot(additionalRadius);
    
       prevX = coord.x;
  }  
  
  
  Dot touchedDot2 = (Dot)dotArr.get(rowCount-1).get((int)random(0,maxRowCount-1));
  if(adder2 == 1 && touchX2 == colDotCount-1)
  {
    adder2 = -1;
  }
  else if(adder2 == -1 && touchX2 == 0)
  {
    adder2 = 1; 
  }
  touchX2 += adder2;
 
  if(touchedDot != null)
  {
      if(Math.abs(song.left.get(0)*10) > 2)
      {
         touchedDot2.touchDot();
         touchedDot2.drawDot(additionalRadius);  
      }
  }
  
  stroke(0,0,0,0);
  
  drawColorMatrix(additionalRadius);  
  
  if(keyPressed)
  {
   switch(key) {
    case 'f': // fast-forware
      song.skip(2000); // fast-forward 500 milliseconds
      break;
    case 'r': // rewind
      song.skip(-2000); // rewind 500 milliseconds
      break;
    } 
  }
}

void createColorMatrix(int col_num, int alpha)
{  
  colPixelNum = img.width/col_num;
  rowPixelNum = colPixelNum;
  
  dotArr = new ArrayList<ArrayList>();
  dotArrSize = 0;
  rowArrSize = 0;

  img.loadPixels();
  for (int y = 0; y < height; y+=rowPixelNum ) {
    ArrayList<Dot> rowArr = new ArrayList<Dot>();
    rowArrSize = 0;
    for (int x = 0; x < img.width; x+=colPixelNum ) {
      float avgR = calculateAverageColor(x,y,0);
      float avgG = calculateAverageColor(x,y,1);
      float avgB = calculateAverageColor(x,y,2);

      Dot dot = new Dot(x,y,colPixelNum-2,avgR,avgG,avgB, alpha);
      rowArr.add(dot);
      rowArrSize++;
    }
    dotArr.add(rowArr);
    dotArrSize++;
  }
  //println(dotArrSize+" "+rowArrSize);
}

void drawColorMatrix(int ar) 
{  
  //for(int i=0 ; i<dotArr.size() ; i++)
  for(int i=0 ; i<dotArrSize ; i++)
  {
    ArrayList rowArr = dotArr.get(i);
    for(int j=0 ; j<rowArrSize ; j++)
    {
      Dot dot = (Dot)rowArr.get(j);
      dot.drawDot(ar);
    }  
  } 
}

float calculateAverageColor(int x, int y, int c)
{
  int avg = 0;
  for(int j=0 ; j<colPixelNum ; j++)
  {
    for(int i=0 ; i<colPixelNum ; i++)
    {
      int loc = (x+i)+(y+j)*img.width;
      if(loc >= img.width*img.height) return 0;
      
      if(c==0)
      {
       avg += red(img.pixels[loc]); 
      }
      else if(c==1)
      {
       avg += green(img.pixels[loc]); 
      }
      else
      {
       avg += blue(img.pixels[loc]); 
      }
    }
  }
  avg /= colPixelNum*colPixelNum;
  
  return avg;
}

void drawDot(int x, int y, int radius, float r, float g, float b)
{
  fill(r,g,b);
  ellipse(x,y,radius,radius); 
}

Coord coordinateIndexAtMousePosition(int xPos, int yPos)
{
  Coord coord = new Coord();

  coord.x = xPos/colPixelNum;
  coord.y = yPos/colPixelNum;

  return coord; 
}

Dot dotAtIndex(int x, int y)
{
  return (Dot)dotArr.get(y).get(x);
}


