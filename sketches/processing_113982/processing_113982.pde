
PImage img;
 
int a= -100;
int b= 600;
int c= 250;
int d= 125;
int e= 375;
void setup() {
  size(500,500);
  frameRate(60);
  noStroke();
  img = loadImage("https://lh4.googleusercontent.com/-xbjeomUtfE4/ThJo4fHUejI/AAAAAAAAAjU/K4FtoZY--YM/w800-h800/trollface-64x64.jpg");
  loop();
}
void mainProgram() {
  background(0);
  a = a + 1;
   
  ellipse(a, 250, 100, 100);
  fill(random(255),random(255),random(255));
  if(a == 250) {
     
    a = a - 1;
  }
  ellipse(b, d, 100, 100);
  b = b - 1;
  if(b == 250) {
    b = b + 1 ;
    d = d + 1;
    e = e - 1;
     
  }
  if(d == 250) {
    image(img,218,218);
  }
  if(e == 250) {
     
    e = e + 1;
    a = a + 1;
    b = b - 1;
     
  }
 
 
  ellipse(b, e, 100, 100);
 
     
}
  
void draw() {
    mainProgram();
   
    
    
    
}
