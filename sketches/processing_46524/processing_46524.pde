
PImage img;
 
int smallPoint = 90;
int largePoint;
int top, left;
float[] xx = new float[0];
float[] yy = new float[0];

 
void setup() {
  size(454,389);
  img = loadImage("DSC_0272 copy.JPG");
  //img = loadImage("DSC_0272 copy.JPG");  // an alternative image
  noStroke();
  background(250);
  smooth();
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 5;
}
 
void draw() {
  float pointillize = map(mouseX, 3, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 100);
  rect(left + x, top + y, pointillize, pointillize);
  
xx = append(xx, pmouseX);  
yy = append(yy, pmouseY); 
smooth();
for ( int i = 1; i < xx.length; i++ )
     {
       for ( int a = 1; i < xx.length; i++ )
       {
       if (keyPressed)
       {
         switch(key)
         {
         case 'r':
         stroke(xx[i]+50, 0, 0);
         break;
         case 'g':
         stroke(0,xx[i]+20,0);
         break;
         case 'b':
         stroke(0,0,xx[i]+50);
         break;
         }
        }
        else {
          stroke(255,100);
        }
       strokeWeight(0.25);
       line( xx[i-1], yy[i-1], xx[i], yy[i] );  
       line( xx[a-1], yy[a-1], xx[i], yy[i] );
         
        if (keyPressed)
       {
         switch(key)
         {
       case 'n':
         background(0);
          xx = new float[0];
          yy = new float[0];
         break;
         }
     }
}
     }
   }
void mousePressed ()       
 {
     xx = new float[0];
     yy = new float[0];
}


