
float colors;
float colors2;
float colors3;

void setup () {

  size(800, 500);
  smooth();
  noLoop();
}


void draw() {

  background(255);



  float health = int(random(0, 360));

  robot(-100, 0, radians(health));
  robot(0, 0, radians(health));
  robot(180, 0, radians(health) );
  robot(370, 0, radians(health));
  robot(500, 0, radians(health));

  frameRate(10);
}

void robot(int x, int y, float health) {
  pushMatrix();
  translate(x, y);
  noStroke();
  //legs

  float colors = random(255);
  float colors2 = random(255);
  float colors3 = random(255);


  fill(colors, colors2, colors3);
  float legsD = random (100, 150);
  float legsDe = random (110, 160);
  rect(150, 320, 20, legsD);
  rect(230, 320, 20, legsDe);
  //body
  fill(colors, colors2, colors3);
  rect(120, 150, 160, 170);
  fill(colors, colors2, colors3);

  ellipse(200, 150, 160, 20);
  //health
  fill(#67FA79);

  arc(200, 230, 50, 50, 0, health);
  fill(255);
  ellipse(200, 230, 30, 30);
  fill( colors, colors2, colors3);
  ellipse(200, 320, 160, 20);
  //head
  float headX = random(190, 210);
  ellipse(headX, 100, 100, 100);
  fill(255);
  ellipse(headX, 80, 40, 40);
  fill(0);
  ellipse(headX, 75, 30, 30);
  fill(colors, colors2, colors3);
  fill(0);
  rect(headX, 20, 1, 30);

  fill(#ED3030);
  ellipse(headX, 20, 20, 20);

  popMatrix();
}

void mousePressed()
{
  redraw();
}


