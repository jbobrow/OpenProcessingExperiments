
void setup(){
  size(200,200);
}

void draw(){
  background(255);
  stroke(0);
  line(100,0,100,200);
  
  if(mouseX < width/2){
    rectMode(CENTER);
    fill(0);
    rect(width/2,height/2,50,50);
  } else { 
    ellipseMode(CENTER);
    fill(0);
    ellipse(width/2,height/2,50,50);
  }
}

