
PImage jungle;

void setup() {
  size (600, 300);
}

void draw() {

  println(mouseX+", " + mouseY);

  jungle=loadImage ("jungle.jpg");
  image(jungle, 0, 0 );
  fill(230, 0, 20);
  noStroke();
  ellipse(200, 150, 80, 60); //outer eye left
  ellipse(400, 150, 80, 60); //outer eye right
  stroke(mouseY, mouseX, 200);
  strokeWeight(10);
  noFill();

//left eyebrow
  beginShape();
  vertex (150, 119);
  vertex (159, 119);
  vertex (207, 97);
  vertex (246, 119);
  vertex (246, 119);
  endShape();

//right eyebrow:
  beginShape();
  vertex (350, 119);
  vertex (359, 119);
  vertex (407, 97);
  vertex (446, 119);
  vertex (446, 119);
  endShape();

//here im trying to set up mapping so that the width of the
//left outer eye = width of entire screen, so pupil moves 
//along outer eye proportionally to the mouse across the entire
//sketch window (similar to what you did in class)
 
  float travel1x = map(mouseX, 0, 600, 172, 227);
  float travel1y = map(mouseY,0,300,143,157);
  float travel2x = map(mouseX,0,600,372,427);
  float travel2y = map(mouseY,0,300,135,168);
  fill(mouseY, (mouseX-mouseY), mouseX);
  ellipse(travel1x, travel1y, 15, 15);
  ellipse(travel2x, travel1y, 15, 15);


if (keyPressed) {
  fill(225,86,86);
  stroke(1);
  ellipse(200, 150, 80, 60); //outer eye left
  ellipse(400, 150, 80, 60); //outer eye right
}
}

