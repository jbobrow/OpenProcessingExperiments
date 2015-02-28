
float rx = 130;
float ry = 100;
float rwidth = 150;
float rheight = 150;

void setup(){
  size (400,400);
}

void draw(){
   background(150, 220, 220);
  noStroke();
  if(
  mouseX >= rx && mouseX <= rx+rwidth &&
  mouseY >= ry && mouseY <= ry+rheight
    ){
    fill(45,65,200);
  }else{
    fill(150, 220, 220);
  }
  
  rect(rx, ry, rwidth, rheight);
}

void keyPressed() {
   saveFrame("rollover.png");
}

