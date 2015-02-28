
PImage myType;
int x,y,prevX,prevY;

void setup(){
  colorMode(HSB,360,100,100,100);
  size(600,400);
  smooth();
  myType = loadImage("puppy.jpg");
  background(0,0,100);
  strokeWeight(.5);
  for(int i = 0; i < 1000000;i++){
    x = int(random(width));
    y = int(random(height));
   
   color cp = myType.get(x,y);
   color cpP = myType.get(prevX,prevY);
   
   float b = brightness(cp);
   float bP = brightness(cpP);
   
   float h = hue(cp);
   
   if(h < 2  && h > 50){
     line(x,y,prevX,prevY);
     
   }
   
    if(b == 0 && bP == 0 && dist(x,y,prevX,prevY) < 75){
        line(x,y,prevX,prevY);
     } 
     prevX = x;
     prevY = y;
  }
  
}

void draw(){

}

