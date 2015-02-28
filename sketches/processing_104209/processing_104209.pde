
//Global Variables here
void Smiley(int x,int y) {
  strokeWeight(5);

  ellipseMode(CENTER);
  fill(255, 255, 0);
  ellipse(x, y, 300, 300);

  //eyes
  fill(255, 255, 255);
  ellipse(x-50, y-50, 50, 50);
  ellipse(x+50, y-50, 50, 50);
  fill(0, 0, 0);
  ellipse(x-50, y-50, 30, 30);
  ellipse(x+50, y-50, 30, 30);
  //mouth
  fill(255, 255, 255);
  arc(x, y+20, 150, 150, 0, PI);
  line(x-75, y+20, x+75, y+20);
  line(x-65, y+50, x+65, y+50);
  if(mousePressed){
  fill(0, 0, 0);
  arc(x, y+50, 130, 80, 0, PI);
  }
  else{
  }
}

void setup() {
  size(1270,950);
}

void draw() {
  background(0, 0, 0);
  Smiley(mouseX, mouseY);
}
