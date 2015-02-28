
PImage myType;
int x,y;

void setup(){
  colorMode(HSB,360,100,100,100);
  size(600,400);
  smooth();
  myType = loadImage("puppy.jpg");
  background(0,0,100);
  strokeWeight(.5);
  for(int i = 0; i < 100000;i++){
    x = int(random(width));
    y = int(random(height));
   
   color cp = myType.get(x,y);
   
   float b = brightness(cp);
    if(b < 30){
       float ellSize = random(5,15);
       ellipse(x,y,ellSize,ellSize);
     } 
  }
  
}

void draw(){

}

