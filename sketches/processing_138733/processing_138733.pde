
//Ball first, second;
int num=700;
Ball[] fountain = new Ball[num];
int k=0;
int i=0;
int j=0;


void setup(){
//  background(20);
  size(900,600);
  smooth();
  background(20);
//  first = new Ball(width/2,height*6/7,10,0,-3,.03,color(random(200)+55),random(150)+95);
}

void draw(){
  background(20);
  if(k<num){
    fountain[k] = new Ball(width/2,height*6/7,10+random(10),random(3)-1.5,-random(7)-2,random(10)/100+.03,color(random(200)+55),random(150)+95);
    k++;
  }
  else{  //inf fountain
    k=0;
    j=num;
  }
  for(i=0;i<j || i<k;i++){
    fountain[i].move();
    fountain[i].display();
  }
//  first.move();
//  first.display();
//  second.move();
//  second.display();
}

class Ball {
  float x,y;
  float diameter;
  float volX, volY;
  float acc;
  boolean alive = true;
  color c;
  float op;
  
  Ball(float initialX, float initialY, float initialDiameter, float initialVolX, float initialVolY, float initialAcc, color initialC, float initialOp){
    x=initialX;
    y=initialY;
    diameter=initialDiameter;
    volX=initialVolX;
    volY=initialVolY;
    acc=initialAcc;
    c=initialC;
    op=initialOp;
  }
  void move(){
    volY+=acc;
    x+=volX;
    y+=volY;
/*    if(x>width){
      volX=-volX;
    }
    */
    if(y>height+diameter){ //checking if off screen to delete
      alive = false;
    }
    
  }
  void display(){
    if(alive){
      noStroke();
      fill(c,op);
      ellipse(x,y,diameter,diameter);
    }
  }
}
