
/* @pjs preload="setinstone.jpg"; */


PImage img;
 
float x;
float y;
 
int r;  //red
int g;  //green
int b;  //blue
 
boolean colorchange;
 
void setup(){
   
  size(500,719);
   background(255);
  r= 255;
  g= 213;
  b= 21;
  colorchange=false;
   
  img = loadImage("setinstone.jpg");
   
  imageMode(CENTER);
  image(img,width/2,height/2);
}
 
 
void draw(){
   
    noStroke();
  fill(0);
  x=mouseX;
  y=mouseY;
  fill(r,g,b,5);
     
  if(mousePressed){
    ellipse(x,y,100,100);
    if(colorchange == false){
    r--;
    g--;
    b--;
    if(b <=0);
  }else if (colorchange == true) {
     r++;
     g++;
     b++;
  }
 if(b<=0 || b >= 255){
   colorchange = !colorchange; //flipswitch. if colorchange used to be true, it's now false.
    
 }
  }
  ellipse(x,y,100,100);
  }



