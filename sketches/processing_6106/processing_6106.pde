
/*
Made by SumWon

Instructions:

Move the mouse along the x axis
to increase and decrease the frequency
of the sign wave.

Click anywhere to switch from 2d mode to 3d mode and vice versa.

*/
float[][] pArray;
PImage img;
float f;
int w;
int h;
int s=2;
int mode = 1;
void setup() {
  size(440,150,P2D);
  textFont(createFont("courbd.ttf",12));
  img = loadImage("processing.png");
  w = img.width; 
  h = img.height;
  pArray = new float[w][h];
  noStroke();
}
void draw() {
  background(25);
  for (int y=h-1;y-->0;f+=0.1) {
    float mx=mouseX,my=mouseY,wi=width;
    for (int x=w-1;x-->0;pArray[x][y]=sin((x+f)/(0.1+mx/wi*100.0))*10) {
      //Offsets the y position of the pixel by the sin.
      int x2 = x*s;
      int y2 = (y+(int)pArray[x][y])*s;
      
      if (mode == 1) {
        //Rendering mode 1, 2d.
        y2+=25;
        fill(img.get(x,y));
        rect(x2,y2,s,s);
        if (get(x2,y2-s) != img.get(x,y)) rect(x2,y2-s,s,s);
      }
      else {
        //Rendering mode 2, 3d.
        fill(img.get(x,y));
        
        float z = ((h-y2)/2+80);
        float e=100;
        int bx = width/2+(int)((x - e)*(e/z))-10;
        int by = height/2+(int)((y+y-h - e)*(e/z))/2+60;

        rect(bx,by,s,s);
        if (get(bx-s,by) != img.get(bx,by)) rect(bx-s,by,s,s);
      }
    }
  }
  fill(255);
  if (mode==1) text("Click to switch to 3d mode",10,10);
  else text("Click to switch to 2d mode",10,10);
}

void mousePressed() {
  if (mode == 1) mode = 0;
  else mode = 1;
}


