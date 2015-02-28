
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/78654*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img;
PImage img2;
PImage img3;
float cometX  = -50;
float cometY = 325;

 
void setup() 
{
  size(1000,500);
  img = loadImage("earth.png");
  img2 = loadImage("comet.png");
  img3 = loadImage("comet.png");
}
 
void draw() 
{
  background(0);
 if (mouseX<251) {
  image(img2,mouseX-150,mouseY-25,200,50);
}

  image(img,cometX,cometY,250,200);

   
  if (mouseX>250) 
  {
    image(img3,mouseX-50,mouseY-25,200,50);
  }
   
   
  if (mouseX-cometX<150 && 325-mouseY<1) 
  {
    cometX = cometX-50;
  }

   
  if (cometX<-100) 
  {
    cometX = -100;
  }

  if (cometX < 180 && cometY > 400) 
  {
    fill(255,0,0);
    rect(0,0,1000,500);
  }
}

