
///inspired by  Daniel Shiffman


Facade myFacade;                                        // object
 
 
 
float s = 0.2;                                      // global speed of xy
 
float[] xspeed = {s*2, };             // speed of each x and y 
float[] yspeed = {
  0,s*8,s*7,s*6,s*5,s*4,s*3,s*2,s*1  };
 
float[] x = {
  0,50,150,350,250,50,150,350,250}; // position of each x and y 
float[] y = {
  0,150,50,50,150,350,250,250,350}; 
 
int[] xdirection = {
  0,1,1,1,1,1,1,1,1};    // direction of each x and y 
int[] ydirection = {
  0,1,1,1,1,1,1,1,1};
 
int size = 350;
PImage img;
 
void setup()
{
 size(800,919);
  frameRate (40);
  smooth ();
  stroke (50);
  img = loadImage("facade.jpg");
 myFacade = new Facade();                           
}
 
void draw(){
  background(img);
 
  float[] xspeed = {
    0,s*1,s*2,s*3,s*4,s*5,s*6,s*7,s*8        };          // speed of each x and y 
  float[] yspeed = {
    0,s*8,s*7,s*6,s*5,s*4,s*3,s*2,s*1        };
 
 
  for (int i = 1; i < 9; i++) // motion for all x's, i as a counter                     
  {
    x[ i] = x[ i] + (xspeed[ i] * xdirection[ i]); // motion for all x's,
    y[ i] = y[ i] + (yspeed[ i] * ydirection[ i]); // motion for all y's, 
    if (x[ i] > size || x[ i] < 0) {               // boundaries for x's
      xdirection[ i] *= -1;
    }
    if (y[ i] > size || y[ i] < 0) {               // boundaries for y's
      ydirection[ i] *= -1;
    }
  }
 
 

 
//the lines that hold the facade
 
  float x2 = ((x[ 1]+x[ 2]+x[ 3]+x[ 4])*.25);                
  float x1 = ((x[ 5]+x[ 6]+x[ 7]+x[ 8])*.25);
  float y2 = ((y[ 1]+y[ 2]+y[ 3]+y[ 4])*.25);
  float y1 = ((y[ 5]+y[ 6]+y[ 7]+y[ 8])*.25);
 

 
  stroke(1);                           
  line(x2,y2,550,615);
  line(x1,y1,200,650);
   line(x2,y2,600,20);
  line(x1,y1,200,650);
 
 
  myFacade.panel();

}
 
class Facade
{

 //the facade 
  void panel() { 
    fill(120,80);
    stroke(50,50,50,100);
    quad(4*x[ 1],4*y[ 1],x[ 4],y[ 4],2*x[ 8],y[ 8],x[ 5],2*y[ 5]);                 
quad(x[ 3],y[ 3],x[ 7],y[ 7],2*x[8],y[ 8],x[ 4],y[ 4]); 
    quad(4*x[ 1],4*y[ 1],2*x[ 2],2*y[ 2],2*x[ 3],2*y[ 3],x[ 4],y[ 4]); 
 quad(x[ 5],y[ 5],2*x[ 6],y[ 6],2*x[ 7],y[ 7],x[ 8],y[ 8]); 
  quad(x[ 2],y[ 2],2*x[ 3],2*y[ 3],x[ 7],y[ 7],2*x[ 6],y[ 6]); 
  quad(x[ 1],y[ 1],2*x[ 2],2*y[ 2],2*x[ 6],y[ 6],x[ 5],2*y[ 5]); 
 
  } 
 
}


