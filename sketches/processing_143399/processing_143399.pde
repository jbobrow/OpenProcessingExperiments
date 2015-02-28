
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: LEE Hea Rin <<------ Write your full name here!
// ID: 201420102 Lee Hea Rin <<--------- Write your ID here!

float angle;
int x=500;
int y=5;
int b=5;
float xW=30;
float direction =1;

void setup(){
  size(600,600);
  background(255);
  
// noLoop();
}

void draw(){
  background(0);
  stroke(0);
noFill();



for (int i = 0; i < width; i = i + b) {
  for (int j = 0; j < height; j = j +b) {
    fill(random(255), random(150), random(255), 50);
    strokeWeight(xW/20);
     rect(i,j,10,10);
     translate(width/2,height/2);
 
fill(random(255), random(150), random(255), 50);
rotate(-x/1);
scale(1.0);

rect (500+x,80,y,y);
 
  while (i < 350){
    
 rect (mouseX/2,mouseY/2,i, i);
 i = i + 1;
 }
 

     x=2+mouseX;
y=2+mouseY/2;
  }
}
   xW = xW + direction;
if (xW>100){
  direction = direction * -1;
}
 
xW = xW + direction;
if (xW<50){
  direction = direction * -1;
}

}

