
float x=width/3;
float y=height/3;
float xchange=1;
float ychange=1;
float s= 0.0;
float a=0.0;
PImage img;
PImage img2;

void setup() {
  size(600, 350);
  background(0);
  frameRate(360);
  img = loadImage("logo.gif");
  img2 = loadImage("felices_fiestas.gif");
}



void draw()  {
  a = a + 0.04;
  s = cos(a)*2;

  stroke(255, 10);
  imageMode(CENTER);
  image(img, width/2, height/2, width/4-40, height/4);
  image(img2, width/2, height/4,width/3-40, height/4);
  y+=random(3, 5)*ychange;
  x+=random(3, 5)*xchange;
  line(width/2, height/2, x, y);
  scale(s);
    
  if (x<0||x>width) {
    
    xchange*=-1;
    
  }
  if (y<0||y>height) {
    
   ychange*=-1;
  
   
  }
  
    
  
 
}



