
/* @pjs preload="0.jpg, 1.jpg, 2.jpg, 3.jpg, 4.jpg, 5.jpg, 6.jpg, 7.jpg, 8.jpg, 9.jpg, 10.jpg, 11.jpg, 12.jpg"; */


String[] imageNames = { "0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg" };
PImage[] images = new PImage[imageNames.length];
PImage ground;
int numberPeople;

PImage imgMask;

PGraphics pm;
int x1, x2, y1, y2, i;

void setup() 
{
  size(840, 470);
  noStroke();
  for (int i=0; i < imageNames.length; i++){
    String imageName = imageNames[i];
    images[i] = loadImage(imageName);
 } 
  
  numberPeople = imageNames.length;
  pm = createGraphics(width,height);

  ground = loadImage("0.jpg");
  image(ground, 0, 0); 
  
//  imgMask = loadImage("mask.jpg");
 
}

void draw() {
  
  float r = random(0, numberPeople); 
  int ir = int(r); 
  PImage img = images[ir];
//  image(img, 0, 0);


  x1 = int(random(0,width));
  x2 = int(random(5,20));
  y1 = int(random(0,height));
  y2 = height - (2*y1);
  
  

  pm.beginDraw();
  pm.fill(0);
  pm.rect(0,0,width,height);
  pm.fill(255);
  pm.rect(x1,y1,x2,y2);
  pm.endDraw();  


  img.mask(pm);
//  img.mask(imgMask);
  image(img,0,0);


  }
