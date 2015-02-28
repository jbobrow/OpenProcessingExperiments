
//Lindsay Laven's Mid Term


PImage but;
PImage sex;
float y;
float easing;
float directionX;
float directionY;
float colorValue;
int x = 0;


void setup(){
  size(600,600);
  but = loadImage("but.png");
  sex = loadImage("sex.png");
  noCursor();
  background(127,8,152);
   
   
  x = 0;
  y = 0;
  easing = .07;
  

  colorMode(HSB,360,100,100,100);
 smooth();
  
  x = 433;
  y = 419;
  directionX = 2;
  directionY = 1;
  

  


  fill(3, 3, 3);
    ellipse(433, 419, 10, 10);
    
}

void draw(){
 
  
  image(sex,mouseX,mouseY);
float colorValue = map(x,0,width,0,360);
stroke(colorValue,100,100);
line(x,0,x,height);
x++;


ellipse(x, y, 3, 3);
    x += directionX;
    y += directionY;
    //bottom wall
    if(y > height){
      directionY = -1;
    }
    //top wall
    if(y < 0){
    directionY = 1;
    
}
//right wall
if(x > width){
  directionX = -2;
}
//left wall
if(x < 0){
  directionX = 2;
  image(but,x,y);
 
}
}
    

