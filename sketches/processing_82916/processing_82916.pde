

void setup(){
size(400,400);
background(#ffffff);
fill(0);
noStroke();
}

void draw(){

rect(mouseX,mouseY,1,1);
rect(mouseX+random(100),mouseY,1,1);
rect(mouseX,mouseY+random(100),1,1);
rect(mouseX,mouseY+random(-100),1,1);
rect(mouseX+random(-100),mouseY,1,1);

}

void mousePressed(){
  background(#ffffff);
} 


