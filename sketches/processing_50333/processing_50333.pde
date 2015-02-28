
//homework 4
//copyright russell andrews 2012


int trans, dia;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  trans = color(random(255), random(255), random(255));
  dia = 30;
}

void draw(){
  fill(255, 5);
  rect(0, 0, width, height);
  fill(trans);
  float x = random(0, 400);
  float y = random(0, 400);
  ellipse(x, y, dia, dia);
  if (dia > 75){
    dia = 75;
  }
  if (dia < 5){
    dia = 5;
  }
}

void keyPressed(){
  if (key == ' '){
  trans = color(random(255), random(255), random(255));
  }
  if (keyCode == UP){
    dia = dia + 5;
  }
  if (keyCode == DOWN){
    dia = dia - 5;
  }
}

