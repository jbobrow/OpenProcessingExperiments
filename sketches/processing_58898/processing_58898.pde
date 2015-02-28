
Coco coco1;
  
PImage C1;
PImage C2;
  
void setup(){
 coco1 = new Coco(300,300);
  size(600,600);
    background(pmouseX,pmouseY,47);
     C1 = loadImage("C1.jpg");
    C2 = loadImage("C2.jpg");
    imageMode(CENTER);
    
}
void draw(){
 coco1.update(mouseX,mouseY);
 coco1.display();
}
class Coco{
  int x,y;
  float counter;
  boolean over;
  boolean pressed;
  Coco(int _x,int _y){
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
        image(C1,300,300);
   } else{
        background(mouseX,mouseY,pmouseX);
  }
}
void press(){
   if (over){
   filter(BLUR, 29);
  pressed = true;
 }
}
void release(){
pressed = false;
}
}
  void mousePressed(){
    coco1.press();
   }
  


