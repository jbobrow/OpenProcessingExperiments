
int x = 100;

void setup() {
  size(700,700);
  smooth();
  background(255);
  frameRate(100);
}

void draw () {  

  fill(random(0,256),random(0,256),random(0,256),random(0,256));
  noStroke();
  ellipse(mouseX-10,mouseY-10,10,10);
  fill(50,20,20,30);
  noStroke();
  ellipse(mouseX-7,mouseY-7,10,10);
  fill(random(0,256),random(0,256),random(0,256),random(0,256));
  arc(mouseX-7,mouseY-7,mouseX-10,mouseY-10,random(0,256),200);

  triangle(mouseX-7,mouseY-7,mouseX-10,mouseY-10,random(0,100),300);
}


