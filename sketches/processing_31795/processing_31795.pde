

float x = 1;
float y = 1;
int num = 100;
float color_a =num;
float color_b =num;
float count = 50;

 
void setup(){  
  size(500,500);  
  background(255);
  stroke(num);
  smooth();
}

void draw(){

while (x<500){
count = count+num/10;
    x = x+20;
    y = y+20;
fill (color_a,color_b,0,num/10);
ellipse(x, y, count*2.3, count*2.3); 

}}




