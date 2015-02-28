
//bouncing balls
Ball [] bal1 = new Ball[int(random(1,200))];

float maxD = 50;

void setup(){
 size(700,400);
 smooth();
 
 for(int i=0; i<bal1.length; i++){
  bal1[i] = new Ball(random(5,maxD/2),random(maxD,700-maxD),random(60,400-maxD)); 
 }
}

void draw(){
  background(255);
  for(int i=0;i<bal1.length;i++){
 bal1[i].appear();
 bal1[i].bounce(); 
 bal1[i].move();
  }
}


 class Ball{
   float opacity = random(1,90);
   
   //color
   float red = random(0,255);
   float g = random(0,255);
   float b = random(0,255);
   
 float x;
 float y;
 float xspeed = random(1,4);
 float yspeed = random(1,4);
 float r;
 
 Ball(float tempR, float tempx, float tempy){
   r = tempR;
   x = tempx;
   y = tempy;
 }

 
void appear(){

  fill(red,g,b,opacity);
  noStroke();
 ellipse(x,y,r*2,r*2); 
 

}

void move(){
  x += xspeed;
  y += yspeed; 
}


void bounce(){
if(y>height-r || y<r){
  yspeed *= -1;
 }   

 if(x>width-r || x<r){
  xspeed *= -1;
 } 
}
}
