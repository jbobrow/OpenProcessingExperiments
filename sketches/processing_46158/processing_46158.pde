
PImage myImage1;
PImage myImage2;

void setup(){
  size(1000,800);
  myImage1 = loadImage("1.jpg");
  myImage2 = loadImage("02.jpg");
}
void draw(){
  tint(255,random(0,255),0,100);
  
  image(myImage2,random(100,700),random(100,600),100,100);
  tint(random(0,255),random(0,255),mouseX,100);
 
  image(myImage1,random(0,1000),random(0,800),100,100);

  
  

  

  
}














