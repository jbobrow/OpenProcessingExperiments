
//ax^3+bx^2+cx+d

float a1 = 0;
float b1 = 1;
float c1 = 4;
float d1 = 0;

float a2 = 0;
float b2 = 1;
float c2 = 0;
float d2 = -4;

float Scale = 50; 
float pixel = 1/Scale;

void setup(){
  //scale(10);
  size(600,600);
}
void draw(){
  background(255);
  translate(width/2,height/2);
  strokeWeight(3);
  stroke(0);
  line(0,-height/2,0,height/2);
  line(-width/2,0,width/2,0);
  strokeWeight(2);
  stroke(100);
  for(int i=-width/2; i<=width/2; i+=Scale){
    line(i,-height/2,i,height/2);
    line(-width/2,i,width/2,i);
  }
  strokeWeight(1);
  stroke(230);
  for(float i=-width/2; i<=width/2; i+=Scale/5){
    line(i,-height/2,i,height/2);
    line(-width/2,i,width/2,i);
  }
  strokeWeight(2);
  
  for(float x=-width/2; x<width/2; x+=pixel){
    stroke(200,50,0);
    point(x*Scale,-Scale*(a1*pow(x,3)+b1*pow(x,2)+c1*x+d1));
    stroke(50,0,200);
    point(x*Scale,-Scale*(a2*pow(x,3)+b2*pow(x,2)+c2*x+d2));
  }
}
