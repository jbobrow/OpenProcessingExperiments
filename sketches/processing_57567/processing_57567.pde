
Cool cool1;

PImage ying;
PImage yang;

void setup(){
 cool1 = new Cool(10,10);
  size(600,600);
    background(39,156,255);
     ying = loadImage("ying.png");
    yang = loadImage("yang.png");
    imageMode(CENTER);
  
}
void draw(){
 cool1.update(mouseX,mouseY);
 cool1.display();
}
class Cool{
  int x,y;
  float counter;
  boolean over;
  boolean pressed;
  Cool(int _x,int _y){
    x= _x;
    y= _y;
    over = false;
    pressed = false;
  }
  void update(int mX,int mY){
    if(dist(mX,mY,100,200)  <100 ){
   over= true;
  } else {
    over = false;
   }
  }
  
void display(){
   if(over){
        image(yang,100,200);
   } else{
        image(ying,100,200);  
  }
}
void press(){
   if (over){
   filter(INVERT);
  pressed = true;
 }
}
void release(){
pressed = false;
}
}
  void mousePressed(){
    cool1.press();
   }

 
  



