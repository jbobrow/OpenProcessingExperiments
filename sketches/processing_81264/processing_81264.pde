
/* @pjs preload="sketch06.jpg"; */

float[][] pArray;
PImage img;
float f;
int w;
int h;
int s=1;

void setup() {
  size(500,340,P2D);
  img = loadImage("sketch06.jpg");
  w = img.width; 
  h = img.height;
  pArray = new float[w][h];
  noStroke();
}
void draw() {
  background(25);
  for (int y=h-1;y-->0;f+=0.1) {
    float mx=400,my=250 ,wi=width;
    for (int x=w-1;x-->0;pArray[x][y]=sin((x+f)/(0.1+mx/wi*100.0))*10) {
      //Offsets the y position of the pixel by the sin.
      int x2 = x*s;
      int y2 = (y+(int)pArray[x][y])*s;
      
     
        y2 -= 10;
        fill(img.get(x,y));
        rect(x2,y2,s,s);
        if (get(x2,y2-s) != img.get(x,y)) rect(x2,y2-s,s,s);
      
      
    }
  }
  fill(255);
}


