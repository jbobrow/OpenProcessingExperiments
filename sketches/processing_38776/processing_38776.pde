
void setup() { 
  size(700,700);
  background(#0039FF);
  stroke(#FF0000);
}

void draw(){
   if(mousePressed){

  ellipse(mouseX+random(15),mouseY+random(20), 10+ random(20), 10+ random(20));
 }
}

