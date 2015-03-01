
float counter = 0;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  background(255);

  colorMode(HSB, 360, 100, 100);

  float counter_mouse = map(mouseX, 0, width, 0.01, 0.2);
  float zoom = map(sin(counter), -1, 1, 0.1, 1.0);
  //float groesseA = map(sin(counter),-1,1,130,200);
  //float groesseT = map(sin(counter),-1,1,95,200);
  //float groesseTS = map(sin(counter),-1,1,30,200);

  fill(360, 100, 100);
  noStroke();
  translate(width/2, height/2);
  scale(zoom);

  pushMatrix();
  ellipse(-100, -100, 200, 200);
  //arc(groesseA, 0, groesseA, groesseA,PI,2*PI,OPEN);

  ellipse(100, -100, 200, 200);
  //arc(-groesseA,0,groesseA, groesseA,PI,2*PI,OPEN);

  //triangle(-groesseT, -100, 0, groesseTS, groesseT, -100);
  rectMode(CENTER);
  rect(0, 0, 50, 200);
  triangle(-183, -45, 0, 180, 183, -45);
  popMatrix();

  counter += counter_mouse;
}

