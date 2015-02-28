
//set window, bg & anti-alias
void setup(){
size (800,600);
background(255);
smooth();
}

//set drawing
void draw(){
  //set static image
  noLoop();
//grid sets
int grid=10;//no. of rows
int vert=height/grid;

//grid
for ( int h = 0; h < height; h=h+vert)
{

     //ellipses
      for (int i=0;i<=10;i=i+1)
        {
          //no countour
          noStroke();
          //set color to purples
          fill (random(0,225),0,50,150);
          //ellipse setting
          ellipse(width/2,h+32,random(10,50),random(10,50)); 
   }
 }
 saveFrame("line-####.png");
}

