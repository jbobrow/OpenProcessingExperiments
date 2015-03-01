
PImage img;
int a=0;
int moveX=0;

void setup() {
  size(510,510);
  frameRate(10);
 
  String url= "http://i.imgur.com/Y2Z0hVQ.png";
   img = loadImage(url, "png");
}



void draw() {
background(5,5,5);
  
   pushMatrix();
   translate(255,255);
   rotate(a*(millis()/12));
  image(img, -255, -255);
popMatrix();
  }
  
  
    void mousePressed(){ 
    
    a+=10;
  } 
  
  void mouseReleased(){ 
    
    a-=10;
  } 
  

  
