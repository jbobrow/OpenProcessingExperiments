
import processing.serial.*; // Call library

Serial port;  // Create an new object from the Serial class
int val;      // Data from Arduino is stored here temporarily before it is overwritten by next data

//new
float sinLUT[];
float cosLUT[];
float radius;
// set table precision to 0.5 degrees
float SC_PRECISION = 0.5f;
// caculate reciprocal for conversions
float SC_INV_PREC = 1/SC_PRECISION;
// compute required table length
int SC_PERIOD = (int) (360f * SC_INV_PREC);

//end new

PFont font; 

final int TOTAL_NUM = 120;  // Constrain the maximum number of bubbles

// initialize class and variables
Drop[] drops = new Drop[TOTAL_NUM];
int p = 0;
int ColorTemp = 0;
int sizex = 800;
int sizey = 600;
int temp;

void setup()
{
 // port = new Serial(this, Serial.list()[13], 9600);
  
  size(sizex, sizey);
  ellipseMode(CENTER);
  textAlign(CENTER);
  noStroke();
  frameRate(32);
 // font = loadFont("LucidaGrande-9.vlw");
  
  //new
   initSinCos();
   //end new
 
}

void draw()
{
   background(125);
  for( int j = height; j > 0; j--) { 
    stroke(156, 84+j/10*random(.8,1.2), 110);
    //line(x1, y1, x2, y2)
    line(0, j, width, j);
   // println("j = " + j);
  }
 
   /*
  // serial communication with arduino board  
  while (port.available() >= 3) {
    if (port.read() == 0xff) { //read 1 byte header (255) from Arduino
      val = (port.read() << 8) | (port.read());  //read upper byte, read lower byte, assemble 16-bit val
      //println(val);  //print value from the sensor, 0 < val < 1023
    }
  }  
  */
  // (with probability 1/10), check the total number of bubbles, if the drops[i] is empty, then make new bubble  
  if(random(6) < 1) {
    temp = 0;
    while(temp == 0){
      if(drops[p] == null) {
        drops[p] = new Drop(random(sizex), sizex+100, 0, ColorTemp);
        temp = 1;
      }
      if(p<TOTAL_NUM-1) {p++;}
      else {p = 0;temp = 1;}
    }
  }
  
  // Print out all of the drops if they have ben constructed.
  // 0 < bubble size < 240
  for(int i=0; i<TOTAL_NUM; i++) {
    if(drops[i] != null && drops[i].isVisible())
    {
     // if(val>200 && drops[i].size > 40) {drops[i].drawMe2(200); }
     // else if(val>100 && drops[i].size > 80) {drops[i].drawMe2(100); }
     // else if(val>40 && drops[i].size > 160) {drops[i].drawMe2(40); }
      if(-2.5*drops[i].dist + drops[i].y + drops[i].size/2 < 0) {drops[i]=null;}
      else {drops[i].drawMe();}
    }
    else
    {
      drops[i] = null;
    }
  }
}

// init sin/cos tables with values should be called from setup()
void initSinCos() {
 
  sinLUT = new float[SC_PERIOD];
  cosLUT = new float[SC_PERIOD];
 
  for (int i = 0; i < SC_PERIOD; i++) {
 
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SC_PRECISION);
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SC_PRECISION);
 
  }
}


/*
  Class: Drop
  When constructed, they will slightly spin around their coordinated of origin,
  slowly speeding up, growing, and fading out.
*/
class Drop
{
  float x, y, dist, theta, alpha, size, r, g, b;
  int ColorTemp;
  float bubbleSize = random(20,200); 
  float strokeWidth =  random(1.2, 16);
  int fillColor = 255;
  int darkFill = 80;
  Drop(float x, float y, float dist, int ColorTemp)
  {
   
    this.x = x;
    this.y = y;
    this.dist = dist;
    this.theta = random(2);
    this.alpha = random(140, 255);
    this.size = 12;
    this.r = 100;
    this.b = random(50)+200;
    this.g = 200;
    this.ColorTemp = ColorTemp;
  }

  // size and transparency changes
  void drawMe()
  {
   
    //float bubbleSize = setSize();
    float mY = 120 + (6 * sin(theta)+x/2);//18 * sin(theta) + x;
    //println("mY " + mY);
    float mX = 0-(-2.5*dist);
    stroke(100);
    strokeWeight(0.5);
    smooth();
    fill(fillColor, alpha);
  
    //ellipse(mX, mY,  bubbleSize,  bubbleSize );
    // modulate the current radius
  radius=50+50*sinLUT[millis()%SC_PERIOD];
 
  // draw a circle made of points (every 5 degrees) 
  for(int i=0; i<360; i+=5) {
 
    // convert degrees into array index:
    // the modulo operator (%) ensures periodicity 
    int theta=(int)((i*SC_INV_PREC) % SC_PERIOD);
 
    // draw the circle around mouse pos
   stroke(fillColor, alpha);
    line(mX, mY, mX+bubbleSize*cosLUT[theta]/2,mY+bubbleSize*sinLUT[theta]/2);
  }
    
    //fill(100);
    int intsize = floor(size);
   // text(intsize,mX,mY+3);

    // Increment all of the variables every time the drop is drawn.
    dist += 1;
   // size += random(.4,.6);
    theta += 0.1;
    alpha -= 0.1;
    //noLoop();
    strokeWeight(bubbleSize/12);
     stroke(#7d7761, 200);
     noFill();
    //bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
    bezier(mX, mY, mX-mX/2, mY/2+mY, size*random(1.6,6), size, height-mX, height);
   
   
  //  text(intsize,mX,mY+3);

    // Increment all of the variables every time the drop is drawn.
    dist += 1;
    size += random(-.4,.1);
    theta += 0.1;
    alpha -= val;
  }
  
 
  boolean isVisible()
  {
  return (alpha > 0);
  }
}

float distance(float x1, float y1, float x2, float y2)
{
  return sqrt(sq(x1-x2) + sq(y1-y2));
}




