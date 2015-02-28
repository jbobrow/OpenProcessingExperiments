
float screen = 700;
float x = 350, y = 350;
float x2 = 350, y2 = 350;
float direction, direction2;


void setup() {

  size (700, 700);
  noStroke();
  
  background(3,31,32);
}

void draw() {
  float fr = 20;

  frameRate(fr); 


  ellipseMove1();
  ellipseMove2();
}

void ellipseMove1() {
  float ellipseS=25, movement=25;
  float c=0;
 
  for (int i=0;i<10;i++) {
    direction = random(4);
    if (direction>0&&direction;<1) {
      x = x+movement;
    }
    if (direction>1&&direction;<2) {
      x = x-movement;
    }
    if (direction>2&&direction;<3) {
      y = y+movement;
    }
    if (direction>3&&direction;<4) {
      y = y-movement;
    }
    
    if(direction<2){
      c = 2;
    }
    
    else{
      c = 5;
    }
    
    fill(65,205,206,20);
    rect(x, y, ellipseS, ellipseS);
    
    if(x>screen){
      x= screen;
    }
    
    if(x<0){
      x= 0;
    }
    
    if(y>screen){
      y= screen;
    }
    
    if(y<0){
      y= 0;
    }
  }
}

void ellipseMove2() {
  float ellipseS2=12.5, movement2=12.5;
  float c2=0;
 
  for (int i=0;i<10;i++) {
    direction2 = random(4);
    if (direction2>0&&direction2;<1) {
      x2 = x2+movement2;
    }
    if (direction2>1&&direction2;<2) {
      x2 = x2-movement2;
    }
    if (direction2>2&&direction2;<3) {
      y2 = y2+movement2;
    }
    if (direction2>3&&direction2;<4) {
      y2 = y2-movement2;
    }
    
    if(direction2<2){
      c2 = 5;
    }
    
    else{
      c2 = 2;
    }
    
    fill(249,178,174,20);
    rect(x2, y2, ellipseS2, ellipseS2);
    
    if(x2>screen){
      x2= screen;
    }
    
    if(x2<0){
      x2= 0;
    }
    
    if(y2>screen){
      y2= screen;
    }
    
    if(y2<0){
      y2= 0;
    }
  }
}

