
float a=0;

void setup(){
size(1200,600);
background(0); 
smooth();
noStroke();
}


void draw (){

  
while(a<=width){
  colorMode(HSB);
  fill(0,255,255,30);
  
  rectMode(CENTER);
  rect(a, 300, random(0,100),random(0,500));

  a = a+random(0,10);

}}
