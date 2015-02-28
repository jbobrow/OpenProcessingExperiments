
void setup(){
  size(200,200);
}

void draw(){
  background(255);
  stroke(0);
  
  
  if(mouseX < width/3){
    rectMode(CENTER);
    fill(0);
    rect(width/2,height/2,50,50);
  } else if (mouseX < 2*width/3) {
    ellipseMode(CENTER);
    fill(0);
    ellipse(width/2,height/2,50,50);
  } else {
    fill(0);
    triangle(50,150,100,70,150,150);
  }
}

