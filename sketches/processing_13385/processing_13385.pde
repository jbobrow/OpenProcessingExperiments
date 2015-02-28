
int g = 80;
int b = 50;
int r = 220;
 
float c = 5;
float changeColor = 20;
 
float shakeX;
float shakeY;
 
void setup() {
  size(300,300);
  frameRate(20);
  background(0,0,b);
   
  smooth();
  background(80,80,80);
   
}
 
void draw(){
   
  
  fill(r,g,b);
  stroke(r,g,b);
  r+=changeColor;
  g+=changeColor;
  b+=changeColor;
   
   
  if(g == 0 || g >= 10|| r == 0 || g >= 10|| b == 0 || b >= 10){
  changeColor *=-1;
  }
     
    c = c + 1;
    ellipseMode(CENTER);
  
    ellipse(width/2,height/2,c,c);
     
     
    if(c>= height || c==0){
    c = c* -1;
     
 
     
     
}
}

