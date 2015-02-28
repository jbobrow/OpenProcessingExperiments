
void setup(){
  size(900,900);
  background(225,195,133);
}

void draw(){
  if(mousePressed){
    fill(0);
  }
  else{
    fill(252,195,49);
  }
  ellipse(mouseX,mouseY,89,34);
    //line(mouseX,mouseY,89,34);
 
  float vel=0;
    vel=dist(mouseX,mouseY,pmouseX,pmouseY);
    stroke(20,25);
    fill(195,62,111);
    ellipse(mouseX,mouseY,vel,vel);
    fill(236,214,0);
    triangle(mouseX, mouseY, 58, 20, 86, 75);

  }
