
void setup() {
  smooth();
  size(100,100);
  background(0);
}


void draw() {
  
  background(0);
  fill(255);
  smooth();
  stroke(255);
  rect(25,25,50,60);
  triangle(25,25,45,25,35,5);
  triangle(55,25,75,25,65,5);
  fill(0);
  ellipseMode(CENTER);
  fill(255);
  stroke(0);
  ellipse(50,50,40,40);

  line(30,80,70,80);
  line(60,80,58,72);
  line(58,72,65,72);
  line(65,72,63,80);//mouth/teeth;
  
  stroke(0);
  fill(0);
  ellipse(50,50,mouseX,mouseY);
}

