
PImage masker;
float r;
float easedR=0;
float easing = 0.01;
float x=0;
boolean grow=true;
float growScale = 1;
int maxWidth = 200;
int spiralWidth = 600;


void setup()
{
 size(294, 198);
 smooth();
 ellipseMode(CENTER);
 imageMode(CENTER);
 stroke(255);
 strokeWeight(1);
 noFill();
  
 masker = loadImage("mask.png");
}


void draw()
{
 background(237,15,105);

 explode(x);
 image(masker,0,0, width, height);
 
 if (grow == true && x > maxWidth) 
   grow = false;
 else if (grow == false && x < -maxWidth) 
   grow = true;
   
 if (grow)
 {
  x += growScale;
 }
 else
 {
  x -= growScale;
 }
}


void explode(float mx)
{
 //Map the incoming mouseX data to a smaller range
 r = map(mx, 0, spiralWidth, 0, 200);
 //Easing on r. Instead of r, we'll use easedR
 easedR += (r - easedR) * easing;

 translate(width/2, height/2);
 for (int i=0; i<spiralWidth; i+=15)
 {
   pushMatrix();
   float x = easedR * cos(radians(i));
   float y = easedR * sin(radians(i));
   //Try commenting out translate, and put
   //x and y in the ellipse() function. Note the difference.
   translate(x, y);
   //rotate( radians(easedR*i/50.0));
   //rect(0,0, 30,55);
   ellipse(x, y, i/5, i/5);
   popMatrix();
   
   
 }
}

