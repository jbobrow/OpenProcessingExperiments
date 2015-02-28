
/* @pjs preload = "apple.png"; */ 
float x;
float y;
float easing = 0.20;

void setup() {
  size(450, 450); 
  noStroke();  
}

//suraido no kouka
void draw() { 
  background(0);
 

  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
   
   //line hukusei
  for(int x = 245; x <= 450; x+=2){
  stroke(70,225,100,255);
   line(50,0,x,y); 
  }
  for(int x = 0; x <= 205; x+=2){
  stroke(70,225,100,255);
   line(400,0,x,y); 
  } 
      
 //oshitara...
 if (mousePressed) {
    for(int x = 245; x <= 450; x+=3){
  stroke(255,200,70,200);
   line(50,0,x,y); 
  }
  
  for(int x = 0; x <= 205; x+=2){
  stroke(255,200,70,200);
   line(400,0,x,y); 
    }   
  } else {
    stroke(0);
  }
  //gazou
 PImage img;   
  img = loadImage("apple.png");
  tint(0,0,0,255);
image(img,172,200,100,120);

tint(0,0,0,127); 
image(img,250,310,120,140);

tint(0,0,0,127); 
image(img,75,310,120,140); 

//oshitara...
if (mousePressed) {
  img = loadImage("apple.png");
  tint(255,50,0,255);
image(img,120,130,200,220);
} else {
    stroke(0);
  }
}






