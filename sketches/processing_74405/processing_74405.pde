
//ITGM 315
//Assignment 4 part 1 by Olsen D.C.
 
// olsen's initial local origin
int localX = 260;
int localY = 440;
 
//
float eyesR;
float eyesG;
float eyesB;
 
//to make mouse moves relative
int relX = 0;
int relY = 0;

int jX = 0;
int jY = 0;
  // olsen's colors
  int r1 = 209;    int g1 =  167;    int b1 =  27;  //skin
  int r2 =  70;    int g2 =  185;    int b2 = 234;  //shirt
  int r3 = 108;    int g3 =   25;    int b3 =  84;  //tie
  int r4 =   0;    int g4 =   37;    int b4 = 100;  //legs
  int r5 =  70;    int g5 =  185;    int b5 = 230;  //Body with change to color

 
// mousePressed() is called once every time a mouse button is pressed
void mousePressed() {
  relX = mouseX;
  relY = mouseY;
}


//
// setup() is called once at the beginning to initialize
//
void setup() {
  size( 500, 500 );                  // size of the window
  smooth();                          // antialiasing
 background (mouseX,40,mouseY);      // background changes color based on cursor
 frameRate (40);                     //fps40
}
 
class Olsen{
  Olsen(int x, int y){
  rectMode (CORNERS);
  ellipseMode (CORNERS);
  //draw ears
  fill (r1,g1,b1);
  ellipse ( x-40, y-170, x-25, y-150 );
  ellipse ( x+25, y-170, x+40, y-150 );
  //draw face
  rect ( x-30, y-190, x+30, y-130 );
  //draw mouth
  fill(r1,g1,b1);
  ellipse ( x-10, y-160 , x+10, y-140 );
  //draw mouth corrector
  fill (r1,g1,b1);
  stroke (r1,g1,b1);
  rect( x-10, y-165, x+10, y-150 );
  //draw hair
  fill (0);
  stroke (0);
  triangle ( x-30, y-190, x+30, y-220, x+30, y-190 );
  //draw eyes
  fill(eyesR,eyesG,eyesB);
  ellipse(x-25, y-170, x-15, y-150 );
  ellipse(x+15, y-170, x+25, y-150 );
  //draw neck
  fill(r1,g1,b1);
  rect (x-10, y-130, x+10, y-120 );
  //draw body
  fill(r2,g2,b2);
  rect(x-20, y-120, x+20, y-50 );
  //draw tie
  fill(r3,g3,b3);
  triangle( x-10, y-120, x, y-110, x+10, y-120 );
  triangle(x-10, y-60, x, y-110, x+10, y-60 );
  //draw hands
  line(x-20, y-120, (x-50)-1.2*(pmouseX-mouseX), (y-90)-1.2*(pmouseY-mouseY) );
  line(x+20, y-120, (x+50)-1.2*(pmouseX-mouseX), (y-90)-1.2*(pmouseY-mouseY) );
  //draw legs
  fill(r4,g4,b4);
  rect(x-10, y-50, x, y-10 );
  rect(x, y-50, x+10, y-10 );
  //draw shoes
  fill(0);
  rect(x-20, y-10, x, y );
  rect(x, y-10, x+20, y );
}
}
 
 
void draw(){
  int stepX = 100;
  background(mouseX,40,mouseY);
  Olsen olsen[]= new Olsen[3];
  for(int i = 0;i<3;i++,stepX+=150){
    olsen[i]=new Olsen(localX+stepX,localY);
  }
if (mousePressed) {
// moveing the local origin for left-click drag
  if ( mouseButton == LEFT )  {
    localX = mouseX;
    localY = mouseY;
  }
  }
 

 
}
