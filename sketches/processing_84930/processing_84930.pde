
void setup() {
  size(600,600);
  background(255,255,255);

}

void draw() {
  background(255 - mouseX/2.25,255 - mouseX/2.25,255 - mouseX/2.25);
  stroke(0 + mouseY/2.25,0 + mouseY/2.25,0 + mouseY/2.25);
  strokeWeight(10);
  line(0,50,600,50);
  line(0,150,600,150);  
  line(0,300,600,300);
  line(0,400,600,400);
  line(0,550,600,550);
  line(100,0,100,600);
  line(200,0,200,600);
  line(300,0,300,600);
  line(450,0,450,600);
  fill(200 - mouseX/2.25,10 + mouseY/2.25,10 + mouseY/2.25);
  rect(100,400,100,100);
  fill(200 - mouseX/2.25,200 - mouseX/2.25,10 + mouseY/2.25);
  rect(450,150,200,300);
  fill(10 + mouseY/2.25,10 + mouseY/2.25,200 - mouseX/2.25);
  rect(0,50,200,100);

}


