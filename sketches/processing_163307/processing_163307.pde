
/* @pjs preload="Groundhog_Day.png";  */

float y= -10.0;
float x= -10.0;
float X= 0;
float Y= 0;

void setup(){
  size (800, 800);
}

void draw(){
    frameRate (200);
    PImage img= loadImage ("Groundhog_Day.png");
    PImage img2= loadImage ("Scanned 4-2.png");
    
    background (250);
    
    image (img, X,Y); 
    scale (0.25);
    image (img2, 800-X,800-Y);
    
    X+=x;
    Y+=y;
    if(Y>=1000 || Y<=0){
        y *= -1 ;
  }
    if(X>=1000 || X<=0){
        x *= -1 ;
  }
}

