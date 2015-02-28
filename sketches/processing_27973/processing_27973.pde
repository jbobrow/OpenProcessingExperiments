
void setup(){
  size(600, 600);
  smooth();
  background (255, 255, 255);
}


void draw(){
  noStroke();
  fill(0, 0, 0);
  ellipse(mouseY, mouseY, 300, 300);
  if(mousePressed){
    fill(0);
  }else{
    fill(255, 255, 255, 60);
  }
    triangle(mouseX, mouseY, 0, 0, 100, 100);
    line(mouseX, mouseY, 100, 10);
}

//void draw(){
  //fill(250, 0, 100, 40);
  //noStroke();
  //rect(0, 0, 600, 600);
  
  //background(0);
  
  //stroke(255);
  //fill(0, 200, 160, 60);
  //line(mouseX, mouseY, 300, 10);
  //line(mouseX, mouseY, 300, 590);
//}

