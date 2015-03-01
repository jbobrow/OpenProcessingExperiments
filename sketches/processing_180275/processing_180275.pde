
float a=255;
float b=225;
float c=1;
float d=50;
float e=250;

void setup(){
size(500,500);
background(255,255,255);

}
void draw(){
  strokeWeight(c);
  stroke(d,0,0);
  d=d+5;
rect(225,a,50,50);
a=a+5;
c=c+0.3;
rect(a,225,50,50);
a=a+5;
rect(b,225,50,50);
b=b-5;
rect(225,b,50,50);
b=b-5;

}


