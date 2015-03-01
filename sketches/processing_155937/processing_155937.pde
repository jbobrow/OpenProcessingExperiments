

float eX= width/2;
float eY =height/2;
float diameter =width*.9;

void setup(){
size(500,500);
noStroke();
frameRate(40);
}

void draw(){
  background(0);
  
  eX= eX+1;
  eY= eY+0.2;

fill(255);
println(diameter); 
ellipse (eX,eY,50,50);
 

if(eX > width) {
    eX = 0;
  }
  if(eY > width) {
    eY = 0;
  }
}


