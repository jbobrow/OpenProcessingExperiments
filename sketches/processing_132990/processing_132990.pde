
int whichColor = 0;

void setup(){
  size(500, 500);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw(){
  background(255);
  if(whichColor < 20){
    fill(255, 0, 0);
    ellipse(width/2, height/2, width/2, width/2);
  }
  else if(whichColor < 40) {
    fill(0, 255, 0);
    rect(width/2, height/2, width/2, width/2);
  }
  else {
    fill(0, 0, 255);
    triangle(width/2, height/3, width/4, 2*height/3, width*3/4, 2*height/3);
  }
  
  whichColor++;
  if(whichColor > 60) {
    whichColor = 0;
  }
  
}


