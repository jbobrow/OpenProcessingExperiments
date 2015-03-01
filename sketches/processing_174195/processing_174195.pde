
// BugHunt
// CMPS 5J
// pa7

//******************* GLOBAL VARIABLES:
int n = 20;            // number of bugs
Bug[] B = new Bug[n];  // bug array
int clickCount = 0;
int deadCount = 0;
float killRate;

//***************** BUG CLASS:
class Bug{
// fields
float x;
float y;
float speed;
color c;
int s;


// constructor
Bug(float x, float y, int s){
//this.x = x;
//this.y = y;
//this.speed = speed;
//this.c = c;
//this.s = s;
this.x=x;
this.y=y;
this.s=s;
this.speed = rand(1,1.5);
this.c = color(rand(0,255), rand(0,255), rand(0,255));

}
// methods
void crawl(){
x = x + speed;
y = y+ speed;
}
void display(){
fill(c);
if (s=1 || s=2) ellipse(x,y,30,20);
else if (s=3 || s=4) ellispe(x,y,20,30);
}
//void squash(){
//}
//void runAway(){
//}
//boolean mouseOn(){
//}
//boolean scared(){
//}
}
//********************


//********************* SET UP FUNCTION:
void setup(){
  size(500,500);
  smooth();
  for(int i=0; i<n; i++){
    B[i] = new Bug(random(20,480),random(20,480),(int)random(1,5));
  }
}

void draw(){
  background(170);
  for(int i=0; i<n; i++){
    B[i].display();
    B[i].crawl();
  }
}

void mousePressed(){
  clickCount++;
  for(int i=0; i<n; i++){
    if( B[i].mouseOn() ){ 
      B[i].squash();
      deadCount++;
    }else if( B[i].scared() ){ 
      B[i].runAway();
    }
  }
  killRate = float(deadCount)/clickCount;
  println("kill rate = "+killRate);
}
  

