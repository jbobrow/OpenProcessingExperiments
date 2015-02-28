
void setup () {
  size (600, 600);
  background(217,142,77);
}

void draw () {
  // background (100,150,200);
  stroke(0);
  strokeWeight(1);
  fill(184,223,82);
  ellipse(300,300,100,100);
  fill(255);
  ellipse(270,300,30,30);
  ellipse(330,300,30,30);
  fill(0);
  ellipse(280,300,15,15);
  ellipse(320,300,15,15);
  fill(224,73,87);
  rect(285,320,30,5);
  rect(275,350,60,110);
  stroke(random(255), random(255), random(255));
  strokeWeight (2);
  point (mouseX, mouseY);
  strokeWeight (4);
  stroke (random(199), random(13), random(64));
  line(mouseX, mouseY, 300,300);
  
}
  
