
float x;
void setup(){
size (500,500);
smooth();
noStroke();
x=0.0;
}
void draw(){
  background(0);
  fill(random(255),random(255),random(255),random(255));
  
 scale(x); 
rect(10,10,200,200);
x=x+0.1;
}
                
                
