

void setup(){
size (1500,500);
background(33,32,32);
}
 
 
 void draw() {
 
  line(mouseX, 200, pmouseX, 300);
  stroke(0,150+random(0,50),200+random(0,55),255+random(-155,0));
  
  }
