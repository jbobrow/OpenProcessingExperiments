
//3255389, Sam Yao Ling Li, ARCH1391 - Module 2
//The part of the code that creates/moves the dots was written
//Jim Bumgardner(KrazyDad) the original code can be found at
//http://openprocessing.org/visuals/?visualID=3378 and is called
//Tiny Rose.

int w=400,j=w/2; //assign the values of w,j,n
float n=1;

void setup() {
size(600,400);
frameRate(25);  //framerate just means how many frames per second
}               //the sketch will move.

void draw(){   //main body of the code that draws and move the dots
smooth();      //this is the part I took from the source
for(int i=1;i<999;++i)  //j+cos,j+sin controls where it moves
{float t=i*.01,r=j*sin((n+mouseX*100/w)*t);
ellipse(j+cos(t)*r,j+sin(t)*r,8,8);}n += .001;

if (mousePressed == true) { // This [art of the code is mine.
    filter(BLUR, 2.5); filter(17); // what this part does is when
  } else {  // the mouse is pressed it applies a blur filter to 
    filter(11);filter(17);}  // the window else, it keeps its
  }  // the orginal filters.



