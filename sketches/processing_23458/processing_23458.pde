
int x = 100;
int y = 90;
int eyeSize = 40;
int earSize = 60;

void setup() {
  size(200,150);
  background(255);
  smooth();
}

void draw() {

  noStroke();
  fill(241,13,87);
  //ear
  if(mouseX < width/2) {
    earSize = int(random(0,255));
    ellipse(x+15,y-30,earSize,earSize);
    ellipse(x-15,y-30,earSize,earSize);
  }
  else {
    fill(0);
    earSize = int(random(0,255));
    ellipse(x+15,y-30,30,30);
    ellipse(x-15,y-30,30,30);
  }
  //face
  fill(255,214,169);
  ellipse(100,80,70,60);
  fill(162,91,20);
  //eye
  eyeSize = int(random(5,20));
  ellipse(x-12,y-20,20,eyeSize);
  ellipse(x+10,y-20,20,eyeSize);
  //ellipse(100,90,2,2);
  point(100,90);
  stroke(0);
  line(115,100,85,100);
  println("Bear is not happy");
}


