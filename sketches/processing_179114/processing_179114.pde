
int x=100;
int y=56;
int radius=120;
int i=50;

void setup(){
 
 background(0);
  size(1600,900);
  ellipseMode(RADIUS);
  }

void draw(){
fadeToBlack(); 
  strokeWeight(20);
   if(mousePressed){
    stroke(255);
   }else{
  stroke(random(255),random(255),random(255),i);
   }
  ellipse(mouseX,mouseY,radius,radius);
  noFill();
}

void fadeToBlack() {
  noStroke();
  fill(0, 10);
  rectMode(CORNER);
 rect(0, 0, width, height);
}



