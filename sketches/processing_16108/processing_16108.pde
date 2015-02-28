
PImage hong;
PFont font;
float i=0;
void setup()  {
  size(400,400);
  hong=loadImage("hong.PNG");
  size(hong.width, hong.height);
  image(hong,0,0);
//  colorMode(RGB,random(255),random(255),random(255),100);
  noStroke();
  smooth();
}
 
void draw()  {
 
  for(int a=0; a<width; a=a+8){
   for(int b=0;b<height;b=b+8){
//    color c=hong.get(a,b);
    float c = brightness(hong.get(a,b));
    fill(c);
    ellipse(a,b,c/15,c/15);
   }
//    background(255);
// textFont(font,50);
// fill(0);
   
  }
   scale(2);
   
    text("H",0,-abs(sin(i))*185+300);
    text("O",10*2,-abs(sin(i))*175+300);
    text("N",20*2,-abs(sin(i))*160+300);
    text("G",30*2,-abs(sin(i))*170+300);
     i=i+0.01;
}
 
void hongDraw(){
   
  image(hong,0,0);
   
}


