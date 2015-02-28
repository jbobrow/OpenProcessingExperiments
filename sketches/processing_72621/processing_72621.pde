
//png image
String[] imageNames = { "image1.png","image2.png","image3.png","image4.png","image5.png","image6.png","image7.png","image8.png","image9.png" };
PImage[] images = new PImage[imageNames.length];
PImage me;
float runningalpha;

void setup() 
{
  size(493, 960);
    me = loadImage("me.jpg");
  background(me);
frameRate(15);    
  smooth();

 
  for (int i=0; i < imageNames.length; i++){
    String imageName = imageNames[i];
    images[i] = loadImage(imageName);
 }
}




void draw() 
{
 
 
  float r = random(0,imageNames.length); 
int ir=int(r);
PImage img=images[ir];
 float d=dist(175,340,mouseX,mouseY);
  runningalpha = 255.0 *(d/height*d/width);
  tint(255, runningalpha);
  image(img, mouseX-50,mouseY-50);
}


