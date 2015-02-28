
void setup(){
size(500,500);
background(131,231,200);

int x = 0;
int g=0;

for(int i=0; i<20; i=i+1){
  fill(255,g,0,50);
  triangle(x, random(100),random(200,300),x+15,x+30,random(300,500));
  x=x+20;
  g=g+15;
}
}

void draw(){
  fill(random(255),random(255),random(255),150);
  translate(random(-10,10),random(-10,10));
  rotate(random(TWO_PI));
  rect (mouseX, mouseY,mouseX/2, mouseY/2);
  
}
  
