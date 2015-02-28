
PImage img;
int[] als = {10,40,60,80,90,140 };
//int s = second();
int largo = 50;
void setup() {
    img = loadImage("DSC00004_01.jpg");
  smooth();
  size(690,400);
   
  frameRate(2);
   
 
 
}
 
void draw()
{
 image (img, 0,0);
for (int x = largo/2; x < width; x+= width/10-largo/2)
{
       
  for (int y = largo/2; y < height; y+= width/10-largo/2)
  {
    noStroke();   
   fill (255,3,2,als[ int( random (6) ) ] ) ;
 
    ellipse(x,y,largo,largo);  
     
}
  
}
 
}
//http://www.openprocessing.org/visuals/?visualID=9080

