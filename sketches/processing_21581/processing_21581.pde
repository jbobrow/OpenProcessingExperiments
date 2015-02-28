

int num = 6;
Rectangle[] myRectangle = new Rectangle[num];
color[] myColors = new color[3];

void setup(){
  size(300,300);
 
 myColors[0] = color(255,0,0,50);
  myColors[1] = color(0,255,0,50);
  myColors[2] = color(0,0,255,50);

for(int i=0; i<myRectangle.length; i++){  
  myRectangle[i] = new Rectangle();
  }
 noStroke();
  smooth();
}
  
  void draw(){
    background(255);
  
   for(int i=0; i < myRectangle.length; i++) { 
    myRectangle[i].update();
    myRectangle[i].draw();
   }
  }
  
  class Rectangle {
    float x = random(20, width-20);
    float y = random(20, height-20);
    float rectSize1 = random(100);
    color col = myColors[floor(random(0,3))];
   
  // Rectangle(float x_, float y_, float rectSize1_){
  //   x = x_;
    // y = y_;
     //rectSize1 = rectSize1_;
 Rectangle(){  
 }
   
   void update(){   
     }
       
   void draw(){
     rectMode(CENTER);
     fill(col);
     rect(x, y, rectSize1, rectSize1);
   
    if(rectSize1 < width){
     rectSize1++;
     }
    else{
       rectSize1 = 1;
    } 
   }
  }


