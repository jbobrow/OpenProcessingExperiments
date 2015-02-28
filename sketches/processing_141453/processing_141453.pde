
PImage picture;
float a = 0;
float x;
 
 
void setup() {
  background(0); 
  size (750, 600); 
  x = width; 
  picture = loadImage("WalterWhite.jpg"); 
}
 
void draw() {
image(picture, x, 0);  
x = x - 3; 
 if(mousePressed) {
   tint(80,120); }
    copy(picture, 50,int(random(1,45)),mouseX,mouseY,0,0,width,50);
  copy(picture, 50,int(random(30,40)),mouseX,mouseY,0,0,width,150); 
       int sy = int(map(noise(a), 0, 1, 0, height)); 
  copy(picture, 50,sy,150,50,0,100,width,50); 
   a = a + 0.04;
  copy(picture, 100,sy,mouseX,mouseY,0,400,width,150); 
  
if (keyPressed) {   
  setup();           
}
}


 
