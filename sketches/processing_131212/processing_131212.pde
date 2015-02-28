
void setup() {
  size(800,800);
  background(225);
  stroke(225);
}


void draw(){
  if (mousePressed){
  
    fill(150,random(50,100),random(50,150),8);
  } else {
    fill(random(50,100),random(100,150),random(100,150),6);
  }
  ellipse(mouseX,mouseY,random(170,200),random(170,200));
 
}


