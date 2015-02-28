
void setup() {
  size(360,360);
background(0);
noStroke();
fill(125);
triangle(150,130,210,130,180,180);
triangle(230,150,230,210,180,180);
triangle(180,180,130,150,130,210);
triangle(180,180,150,230,210,230);
//fill(47,34,242,180);
}

void draw() {
  stroke(random(250),random(250),random(250));
  line(180,180,mouseX,mouseY);
  //rect(mouseX,mouseY,30,30);
}

void mousePressed() {
  background(0);
  noStroke();
fill(125);
triangle(150,130,210,130,180,180);
triangle(230,150,230,210,180,180);
triangle(180,180,130,150,130,210);
triangle(180,180,150,230,210,230);
stroke(255);
//fill(47,34,242,180);
}
  




