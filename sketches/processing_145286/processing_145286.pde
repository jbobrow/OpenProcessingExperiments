
color fons=color(0, 175, 50);
color verd=color(200, 250, 0);
color verdfosc=color(100, 150, 0);
color varia=color(50);
float x;
float y;
float v=5;
float w=5;

void setup() {
  size(900, 900);
  x=width/2;
  y=height/2;  
  background(fons);
}

void draw() {

  //noCursor();
  fons();
  variacolor();
  dibuix();
  velocitat();
  //velocitatrandom();
  limits();
  //nolimits();
}

void dibuix() {
  noStroke();

  //cos
  if (mousePressed) {
    fill(verdfosc);
    rectMode(CENTER);
    rect(x, y, 150, 150, 0, 0, 20, 20);
  } 
  else {

    fill(verd);
    rectMode(CENTER);
    rect(x, y, 150, 150, 0, 0, 20, 20);
  }
  //potes
  if (mousePressed) {
    rectMode(CORNER);
    rect(x+5, y+25, 40, 75, 40, 40, 40, 40);
    rect(x-45, y+25, 40, 75, 40, 40, 40, 40);
  } 
  else {

    rectMode(CORNER);
    rect(x+5, y+45, 40, 75, 40, 40, 40, 40);
    rect(x-45, y+45, 40, 75, 40, 40, 40, 40);
  }
  //braços
  if (mousePressed) {
    rect(x+75, y-90, 40, 125, 60, 60, 60, 60);
    rect(x-115, y-90, 40, 125, 60, 60, 60, 60);
  }
  else {
    rect(x+85, y-90, 40, 125, 60, 60, 60, 60);
    rect(x-125, y-90, 40, 125, 60, 60, 60, 60);
  }

  //cap
  if (mousePressed) {
    ellipse(x, y-65, 150, 150);
  }
  else {
    ellipse(x, y-75, 150, 150);
    fill(fons);
    rectMode(CENTER);
    rect(x, y-70, 150, 5);
    ellipse(x+35, y-110, 15, 15);
    ellipse(x-35, y-110, 15, 15);
  } 
  
  //antenes
  if (mousePressed) {
    stroke(verdfosc);
    strokeWeight(5);
    line(x+60, y-165, x, y-80);
    line(x-60, y-165, x, y-80);
   
  }
  else {
    stroke(verd);
    strokeWeight(5);
    line(x+60, y-175, x, y-80);
    line(x-60, y-175, x, y-80);
  }
}

void fons() {
  background(fons);
  noFill();
  stroke(0);
  ellipse(width/2, height/2, 400, 400);
  stroke(verdfosc);
  rectMode(CENTER);
  fill(200,200,0);
  rect(width/2,height/2-5,260,50);
  fill(0);
  textSize(20);
  text("Click & turn off the lights!",width/2-122,height/2);
}


void variacolor() {
  if (mousePressed) {
    background(varia);
  }
}

void nolimits() {
  if (x>width) {
    x=0;
  }
  if (x<0) {
    x=width;
  }
  if (y>height) {
    y=0;
  }
  if (y<0) {
    y=height;
  }
}
void velocitat() {
  x=x+v;
  y=y+w;
}

void velocitatrandom() {
  float r=random(100);
  if (r<25) {
    //dreta
    x=x+v;
  } 
  else if (r>50) {
    //esquerra
    x=x-v;
  } 
  else if (r>75) {
    //amunt
    y=y+w;
  } 
  else {
    //aball
    y=y-w;
  }
}


void limits() {
  if (x+125>width||x-125<0) {
    v=-v;
  }
  if (y+115>height||y-175<0) {
    w=-w;
  }
}

void mousePressed() {

  x=mouseX;
  y=mouseY;
  println(millis());
}



