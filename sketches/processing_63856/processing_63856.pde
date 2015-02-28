
float xpos = 0;
float geschw;
int xdir = 1;
int ydir = 20;
  void setup(){
    size(800, 800);
    background(random(255),random(255),random(255));
    
  }
  void draw(){
  // ellipse(200, 130, 150, 150);
  if(mousePressed){
    fill(133, 40, 75);
    stroke(random(255),random(255),random(255));
  } else{
    fill(255);
    stroke(random(255),random(255),random(255));
  }
  if (mousePressed && (mouseButton == LEFT)) {
    fill(random(255),random(255),random(255));
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
  } else {
    fill(90,40,200);
  }
  rect(25, 25, 50, 50);
  ellipse(xpos, 520, 100, 200);
  if (xpos > width){
    xdir = -10;
    xpos = 0;
  }
  if(xpos < 0) {
    xdir = 10;
  }
  xpos = xpos + xdir;
  println(xpos + " " + xdir);
  int ypos = 0;
  int ydir = 1;
  if(ypos > height) {
    ydir = -10;
    ydir = 0;
  }
  if(ydir < 0) {
    ydir = 100;
  }
  ydir = ypos + ydir;
  println(ypos + " " + ydir);
  if(mousePressed){
    rect(mouseX, mouseY, 55, 55);
  smooth();
  noStroke();
    fill(random(255),random(255),random(255));
  }else{
    noFill();
    stroke(0);
  }
  ellipse(mouseX, mouseY, 30, 30);
  if(mousePressed){
  noFill();
    stroke(176);
  }else{
   geschw = abs(pmouseX -mouseX);

  }
  quad(mouseX, mouseY, geschw*4 + 10, geschw*4 + 10, geschw*4 - 10, geschw*4 - 10, geschw*4 + 50, geschw*4 + 50);


}
