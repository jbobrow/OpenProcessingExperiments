
int r = 69;
int g = 100;
int b = 100;
int a = 0;

float c = 1;
float changeColor = 3;

float shakeX;
float shakeY;

void setup() {
  size(600,600);
  frameRate(400);
  background(0,0,b);
  
  smooth();
  background(0,0,0);
  
}

void draw(){
  
 
  fill(r,g,b);
  stroke(r,g,b);
  r+=changeColor;
  g+=changeColor;
  b+=changeColor;
  
  
  if(g == 0 || g >= 255 || r == 0 || g >= 255|| b == 0 || b >= 255){
  changeColor *=-1;
  }
    
    c = c + 1;
    ellipseMode(CENTER);
 
    ellipse(width/2,height/2,c,c);
    
    
    if(c>= height || c==0){
    c = c* -1;
    

    
    
}
}

