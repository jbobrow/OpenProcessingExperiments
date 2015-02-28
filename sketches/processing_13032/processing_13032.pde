
int u = (105);
int v = (135);
int w = (185);
int x = (200);
int y = (215);
int z = (225);

void setup() {
  size(800, 600);
  smooth();
  background (blue(30));
}

void draw() {
  text ();
  building1 ();
  building2 ();
  building3 ();
  building4 ();
  building5 ();
  building6 ();
  building7 ();
  building8 ();
  building9 ();
  building10 ();
  building11 ();
  building12 ();
  building13 ();
}

void text() {
PFont font;
font = loadFont("GillSansMT-Bold-48.vlw"); 
textFont(font); 
text("paint", 15, 30); 
fill(0, 102, 153);
text("your", 15, 60);
fill(0, 102, 153, 51);
text("city", 15, 90);
}

void building1 (){
      if (mousePressed) {
    noStroke();
    fill(random(u),random(u), random(u), 255);
    rect (0,300,30,500);
}
}

void building2 (){
    if (mousePressed) {
    noStroke();
    fill(random(v),random(v), random(v), 255);
    rect (35,280,50,500);
    }
}


void building3 (){
    if (mousePressed) {
    noStroke();
    fill(random(w),random(w), random(w), 255);
    rect (90,200,60,500);
    }
}

void building4 (){
    if (mousePressed) {
    noStroke();
    fill(random(x),random(x), random(x), 255);
    rect (155,400,20,500);
    }
  }

void building5 (){
    if (mousePressed) {
    noStroke();
    fill(random(y),random(y), random(y), 255);
    rect (185,380,105,500);
    rect (195,350,85,500);
    rect (205,330,65,500);
    }
}

void building6 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (400,450,60,500);
    }
}

void building7 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (300,300,60,500);
    }
}

void building8 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (465,300,70,500);
    }
}
void building9 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (365,100,30,500);
    rect (330,100,100,60);
    rect (345,80,70,60);
    rect (375,40,10,60);
    }
}    
void building10 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (540,350,90,500);
    }
}
void building11 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (670,300,45,500);
    }
}
void building12 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (635,200,30,500);
    }
}
void building13 (){
    if (mousePressed) {
    noStroke();
    fill(random(z),random(z), random(z), 255);
    rect (720,400,75,500);
    rect (725,385,65,500);
    }
}




