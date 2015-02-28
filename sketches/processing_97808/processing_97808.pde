

void setup ()
{
 size (1000,1000);
 smooth();// makes lines of circle smooth
 frameRate(30);
}  

void draw()
{
  //my red, green and blue variabeles
  int rCol = int (random(255));// red colour-interger to hold random number between 0 and 255
  int gCol = int (random(255));// greeen colour
  int bCol = int (random(255));// blue colour  
  
  //my position variables
  float x = (width/2)+random(10)-5;
  float y = (height/2)+random(10)-5;
  
  
  background(255, 100, 100);// background colour light red
  fill(rCol, gCol, bCol); // random circle colour fill
  ellipse(x, y, mouseX, mouseY);//draws the circle
 

}
 



