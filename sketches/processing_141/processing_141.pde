
Kite myKite;                                        // Kite object

float s = 0.2;                                      // global speed of xy

float[] xspeed = {
  0,s*1,s*2,s*3,s*4,s*5,s*6,s*7,s*8  };             // speed of each x and y (0 unused)
float[] yspeed = {
  0,s*8,s*7,s*6,s*5,s*4,s*3,s*2,s*1  };

float[] x = {
  0,50,150,350,250,50,150,350,250}; // position of each x and y (0 unused)
float[] y = {
  0,150,50,50,150,350,250,250,350};  

int[] xdirection = {
  0,1,1,1,1,1,1,1,1};                               // direction of each x and y (0 unused)
int[] ydirection = {
  0,1,1,1,1,1,1,1,1};

int size = 350;

PImage bg;

int seethrough = 100;                              // kite is translucent

void setup() 
{
  size (400,400);
  frameRate (50);
  smooth ();
  stroke (50);
  bg = loadImage("centralpark.jpg");
  myKite = new Kite();                            // Kite object
}

void draw() 
{ 

  if (mouseY <= 20) {                                   // kite is always in motion
    s = 0.2;
  }
  else {
    s = mouseY*0.005;                                   // mouse y determines global speed of xy
  }

  float[] xspeed = {
    0,s*1,s*2,s*3,s*4,s*5,s*6,s*7,s*8        };          // speed of each x and y (0 unused)
  float[] yspeed = {
    0,s*8,s*7,s*6,s*5,s*4,s*3,s*2,s*1        };

  background(bg);

  //--------------------------------------------------------------------- kite motion !

  for (int i = 1; i < 9; i++) // motion for all x's, i as a counter                      
  {
    x[ i] = x[ i] + (xspeed[ i] * xdirection[ i]); // motion for all x's, i as a counter
    y[ i] = y[ i] + (yspeed[ i] * ydirection[ i]); // motion for all y's, i as a counter
    if (x[ i] > size || x[ i] < 0) {               // boundaries for x's
      xdirection[ i] *= -1; 
    }
    if (y[ i] > size || y[ i] < 0) {               // boundaries for y's
      ydirection[ i] *= -1; 
    } 
  }

  //-------------------------------------------------------------------- draw shadows below kite !

  myKite.shadow();

  //-------------------------------------------------------------------- draw riggings and shadows !

  float avgx1234 = ((x[ 1]+x[ 2]+x[ 3]+x[ 4])*.25); // sets variables for rigging placement                 
  float avgx5678 = ((x[ 5]+x[ 6]+x[ 7]+x[ 8])*.25);
  float avgy1234 = ((y[ 1]+y[ 2]+y[ 3]+y[ 4])*.25);
  float avgy5678 = ((y[ 5]+y[ 6]+y[ 7]+y[ 8])*.25);

  stroke(50,50,50,100);                              // riggings shadows
  line(avgx1234,(avgy1234*.1)+360,318,384);
  line(avgx5678,(avgy5678*.1)+360,318,384);

  stroke(200,200,200,100);                           // riggings
  line(avgx1234,avgy1234,318,367);
  line(avgx5678,avgy5678,318,367); 

  //-------------------------------------------------------------------- draw kite above shadows and riggings !

  myKite.panel();
 // myKite.panel(255,0,0,x[ 1],y[ 1],x[ 4],y[ 4],x[ 8],y[ 8],x[ 5],y[ 5]); <--- WHY CAN'T I MAKE ARRAY PLACE-HOLDERS EQUAL INTS BELOW?
 // ..... etc.... one for each panel w/ diferrenct parameters....

}

class Kite
{
//  int r, g, b;
//  int x1, x2, x3, x4;
//  int y1, y2, y3, y4;
  Kite(/* r_, g_, b_, x1_, x2_,...*/ ) { // constructor <----HERE IS WHERE I WANT x[ 1 ] to be assigned to x1_
//  x1 = x1_; 
//....  etc...

  }

  void shadow() { // draws shdows
//  fill(r,g,b,seethrough); <---- WOULD LIKE TO JUST CALL THIS FUNCTION FOR EVERY SQUARE
//  quad(x1,(y1*.1)+360,x2,(y2*.1)+360,x3,(y3*.1)+360,x4,(y4*.1)+360);  
    noStroke();
    fill(50,50,50,75);  
    quad(x[ 1],(y[ 1]*.1)+360,x[ 4],(y[ 4]*.1)+360,x[ 8],(y[ 8]*.1)+360,x[ 5],(y[ 5]*.1)+360);
    quad(x[ 3],(y[ 3]*.1)+360,x[ 7],(y[ 7]*.1)+360,x[ 8],(y[ 8]*.1)+360,x[ 4],(y[ 4]*.1)+360);
    quad(x[ 1],(y[ 1]*.1)+360,x[ 2],(y[ 2]*.1)+360,x[ 3],(y[ 3]*.1)+360,x[ 4],(y[ 4]*.1)+360);
    quad(x[ 5],(y[ 5]*.1)+360,x[ 6],(y[ 6]*.1)+360,x[ 7],(y[ 7]*.1)+360,x[ 8],(y[ 8]*.1)+360);
    quad(x[ 2],(y[ 2]*.1)+360,x[ 3],(y[ 3]*.1)+360,x[ 7],(y[ 7]*.1)+360,x[ 6],(y[ 6]*.1)+360);
    quad(x[ 1],(y[ 1]*.1)+360,x[ 2],(y[ 2]*.1)+360,x[ 6],(y[ 6]*.1)+360,x[ 5],(y[ 5]*.1)+360);

  }  

  void panel() { // draws panels
    stroke(50,50,50,100);
    fill(255,0,0,seethrough);
    quad(x[ 1],y[ 1],x[ 4],y[ 4],x[ 8],y[ 8],x[ 5],y[ 5]); // draw quad A                       
    fill(0,255,0,seethrough);
    quad(x[ 3],y[ 3],x[ 7],y[ 7],x[ 8],y[ 8],x[ 4],y[ 4]); // draw quad B
    fill(0,0,255,seethrough);
    quad(x[ 1],y[ 1],x[ 2],y[ 2],x[ 3],y[ 3],x[ 4],y[ 4]); // draw quad C
    fill(255,255,0,seethrough);
    quad(x[ 5],y[ 5],x[ 6],y[ 6],x[ 7],y[ 7],x[ 8],y[ 8]); // draw quad D
    fill(255,0,255,seethrough);
    quad(x[ 2],y[ 2],x[ 3],y[ 3],x[ 7],y[ 7],x[ 6],y[ 6]); // draw quad E
    fill(0,255,255,seethrough);
    quad(x[ 1],y[ 1],x[ 2],y[ 2],x[ 6],y[ 6],x[ 5],y[ 5]); // draw quad F

  }  

}

