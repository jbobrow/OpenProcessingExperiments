
float x = 0;
float dir = 2;
float y = 0;
float ydir = 1;
float sizer=55;
PImage img;
float r,g,b;//color control 
float speed=2.5; 


// CHALLENGES:
//use random() to change direction amounts
//use += and an if statement to change some otheer variable (i.e. color, size)
   
 
void setup(){
  background(255);
  img=loadImage("gumball2.jpg");
  size(612,792);
  
  smooth();
  
  r=random(200);
  g=random(200);
  b=random(200);
  
}
 
void draw(){
  noStroke();
  image(img,0,0);
 // gum();
  


//void gum();{
  
  
 x = x + dir;
 
 if(dist(mouseX,mouseY,x,y)<size){
  dir = random(-2,2);

}
 
if(x >= width){
  dir = random(-2);
  r = random(255);
  g = random(255);
  b = random(255);
  
}
   
if(x <= 1){
  dir = random(2);
  r = random(255);
  g = random(255);
  b = random(255);
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




