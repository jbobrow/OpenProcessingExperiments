
PImage car;
PImage backimg;
 
float posY = 250;
float posX = 20;
  
void setup(){
  size(600, 400);
 car = loadImage("car.png");
 backimg = loadImage("adv1.jpg");
}
  
void draw(){
  background(backimg);
  
 
//-------------------------------------------Restrictions for movable image
  if (posY < 100) {
    posY = height-20;
  }
   
    if (posX < 0) {
    posX = 0;
  }
   
      if (posX > 160) {
    posX = 160;
  }
   
  image(car,posX,posY);
}
  
//------------------------------------Keys for movement
  void keyPressed(){
  
if(keyCode==UP ){
posX += 6;
}
if(keyCode==DOWN){
posX -= 6;
}
if(keyCode==LEFT){
posX -= 6;
}
if(keyCode==RIGHT){
posX += 6;
}
  }
  
  
void mousePressed(){
    save("_car.png");
  
}


