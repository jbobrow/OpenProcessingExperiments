
//Tian Jason Tian
//Assignment 3: Collage
//Whimsical Founding of the World

PImage grain_grad;
PImage the_great_wave;
PImage sand_dunes;
PImage tornado;
PImage statues;
PImage statuesque;
PImage round_box;
boolean moused = false;

void setup() {
  size(900,700);
  background(200);
  grain_grad = loadImage("grain gradient.png");
  the_great_wave = loadImage("the great wave.png"); 
  sand_dunes = loadImage("sand dunes.png");
  tornado = loadImage("tornado.png");
  statues = loadImage("statues.png");
  statuesque = loadImage("Statuesque.png");
  round_box = loadImage("round box.png");
}

void draw() {
  fill(200);
  rect(0,0,900,700);
  image(grain_grad,0,0);
  image(round_box,100,30);
  image(the_great_wave,100,30);
  pushMatrix();
  rotate(0.4);
  translate(210,-200);
  image(round_box,300,0);
  image(sand_dunes,300,0);
  popMatrix();
  image(round_box,290,380);
  image(tornado,300,400);
  image(statues,0,0);
  image(statuesque,0,0);
}

void mouseMoved() {
  fill(100,100,100,0);
  stroke(200);
  strokeWeight(3);
  ellipse(mouseX,mouseY,80,80);
  filter(OPAQUE);
}


