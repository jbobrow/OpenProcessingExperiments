
//set window, bg & anti-alias
void setup(){
size (800,600);
background(255);
smooth();
}

void draw(){
 //set static iamge
 noLoop(); 
 //grid sets by variables
int grid=10;
int hor=width/grid;
int vert=height/grid;
  
//grid
for ( int h = 50; h < height; h=h+hor)
{
   for (int w = 0; w < width; w=w+vert)
   {
     //ellipses
      for (int i=0;i<=10;i=i+1)
        {
          //stroke & color
          noStroke();
          fill (random(0,225),0,50,150);
          //change to curtain or flood by taking the random out
          ellipse(random(w+10),h-10,random(10,50),random(10,50));
        for (int r= 0; r<10; r=r+1){
  }  
       }
   }
 }
 //rotations
 translate(-width/6.7,height/1.9);
 rotate(-PI/2);
 //grid loops
 for ( int h = 0; h < height; h=h+hor)
{
   for (int w = 0; w < width; w=w+vert)
   {
     //ellipses
      for (int i=0;i<=10;i=i+1)
        {
          //color & stroke
          noStroke();
          fill (50,0,random(0,225),150);
          //change to curtain or flood by taking the random out
          ellipse(random(w+10),h-10,random(10,50),random(10,50));
          for (int r= 0; r<10; r=r+1){
  }  
       }
   }
 }
 // position variables
float x1;
float x2;
float y1;
float y2;

//grid parameters & resets
int step;
x1 = 100;
x2 = width-100;
y1 = 100;
y2 = height-100;

//number of repetitions in width and height
step = 7;
//color parameters
fill(255, 200);
noStroke();
//white dots for the stars (49)
//space of grid- no of columns+rows (tx&ty)
float stepSize = 10.0/ step;
for ( float tx = 0; tx<= 10;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
//spacing of the loop (reset of coordinates variables)
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          //stroke & color
          strokeWeight(0);
          stroke(0);
          ellipse (x-75,y+75,25,25); 
      }
}

saveFrame("line-####.png");
}

