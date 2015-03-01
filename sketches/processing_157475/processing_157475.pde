
void setup(){

  size(600, 600);
    background(0,0,0);
}

void draw(){
 if(mousePressed){ 
  stroke(random(255), random(255), random(255));
  line(mouseX, mouseY, 200, 400);
 } 
}

