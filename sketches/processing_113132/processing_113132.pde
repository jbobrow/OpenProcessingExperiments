
void setup(){
  size(480,240);
  smooth();
}

void draw(){

fill(mouseX,mouseY,mouseX/10+mouseY/10,mouseY);
noStroke();
ellipse(mouseX,mouseY,60,60);
  
  

}


