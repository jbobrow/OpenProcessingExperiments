
float x = 0;
float dir = 25;
float y = 0;
float ydir = 0;
float sizer=55;
PImage img;
float r,g,b;//color control 
float speed=2.5; 


 
void setup(){
  background(255);
  img=loadImage("gumball2.jpg");
  size(612,792);
  
  smooth();
  
  r=random(50);
  g=random(75);
  b=random(255);
  
}
 
void draw(){
  noStroke();
  image(img,0,0);

  
  
 x = x + dir;
 
 if(dist(mouseX,mouseY,x,y)<sizer){
  dir = random(-20,20);

}
 
if(x >= width){
  dir = random(-15);
  r = 200;
  g = 250;
  b = 255;
  
}
   
if(x <= 1){
  dir = random(15);
  r =100 ;
  g =150 ;
  b =200 ;
}
 
 
y= y + ydir;
   
if(y >= height){
  ydir =random(-1);
 
}
   
if(y <= 0){
  ydir = random(1);
  
}

fill(r,g,b); 
ellipse(x, y, sizer,sizer);

  
print("direction = ");
print(dir);
print("   position = ");
println(x);
   
 
}




