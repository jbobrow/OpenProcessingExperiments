
float w = 10;
float x = 5;

void setup () {
  size (800, 400);
}

void draw () {
  smooth();

  translate(400, 200);
  rotate(w);

  fill(250, 5);

  w = w-15;
  ellipse(400, 200, w, mouseY);

  fill(0, 1);
  x+=20;
  rect(0, 0, mouseX, x);
  
  if (mousePressed) {stroke(255);}
  else {stroke(0);}
}

void keyPressed () {
 
background(random(200),random(255));

}



