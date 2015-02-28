
//Dynamic Projection
//Created By Stephen Wang
//ARCH1391 Digital Computation Studio-Module 2

//Horizontal and vertical constantly weaving diagonally across the screen to draw opera house

//Code Referencing:
//Created by Stephen Wang
//Credit to Daniel Shiffman for his online learning tut
//http://www.processing.org/learning/basics/pointillism.html

//Credit to Sinopart for weaving code by sport4minus
//http://www.openprocessing.org/visuals/?visualID=3511

PImage b;

int w,h,x,y; //Code Credit to Sinopart for weaving code by sport4minus
float c;

void setup(){
  b= loadImage ("sydney.jpg");
  w=600;
  h=450;
  size(w,h);
  smooth(); 
  background(random(1,255),random(2,255),random(3,255),40); 
  strokeWeight(3);
}

void draw(){
  
 //code modified based on Pointillism by Daniel Shiffman.
 //http://www.processing.org/learning/basics/pointillism.html
 
 //for loop pixelate the picture for graduate weaving effect
 for (int i=0; i<200; i++){
  float pointilize = map(X, 0, width, 1, 1);
  int X=int(random(b.width));
  int Y=int(random(b.height));
    if(i<100 ){
      color pixels = b.get(X,Y);
      fill (pixels,200); 
      rect(X,Y,pointilize, pointilize);
    }
    //supposed to cover the pixelated picture with normal pictue 
    //-after weaving, but didn't came out properly
    
    //else if(i>=100){ 
    //image(b, 100, 100, b.width, b.height);
  
 }
 
 //code modified based on Sinopart for weaving code by sport4minus
 //horizontal and vertical weaving
  y=(int)map(sin(c),-1,1,0,h); 
  x=(int)map(sin(c),-1,1,0,w);
  copy(x,y,w,1,-100,y,w+200,1);
  stroke(random(0,255),random(0,255),random(0,255),20); 
  line(w-x,0,w-x,h);
  line(0,h-y, w, h-y);//Code made by Stephen Wang 
  c+=0.01; 

  
} 

