
//EMS kaleidoscope
//variables
int angle = 46;
int circleSize = int(random(100, 500));
int count = 0;
PFont font;
PFont fontBig;
float rotateDeg = 0;

//setup
void setup() {
  size (800, 800);
  background(255);
  rectMode(CENTER);
  font = loadFont("STKaiti-20.vlw");
  fontBig = loadFont("STKaiti-90.vlw");
}

//START DRAW LOOP
void draw () {
  smooth();
  background(255);
  noStroke();

  //background text
  for (int j=0; j<41; j++) {
    for (int k=0; k<10; k++) {
      roundtext(k, j);
    }
  }

  //rectangular stripe
  fill(0);
  rect(400, 400, 800, 10);

  //grey circle spin
  for (int i=0; i<18; i++) {
    slice (i);
  }

  //red circle spin
  for (int m=1; m<8; m++) {
    redWindmill (m);
  }

  translate(width/2, height/2);  

  //SPIN text
  if (mousePressed == true){
    for (int count=1; count<12; count++) {
      fill(0, 0, 0, 100);
      rotate (radians(36+rotateDeg));
  spinText (count);
    }
  }
    else{
      pushStyle();
      fill(0);
spinText (count);
  popStyle();
}

  //spinning triangle
  for (int q=1; q<10; q++) {
    spinTri (q);
  }

  //EVERYTHING THAT ROTATES COMES AFTER THIS

  //red arcs
  for (int p=1; p<5; p++) {
    arcSlice(p);
  }

  //spinning rectangle
  pushStyle();
  rotate(rotateDeg);
  noStroke();
  fill (0, 0, 0, 25);
  rect(0, 0, 350, 350);

  rotateDeg+=0.07;
  popStyle();
}

//END DRAW LOOP







//BEGIN FUNCTIONS
//background text
void roundtext (int k, int j) {
  textFont(font);
  fill(0, 0, 0, 50);
  text("round and", (k*90), (j*20));
}

//slice of cake function
void slice (int i) {
  noStroke();
  fill(185, 185, 185, 25);
  arc(width/2, height/2, random(400, 500), random(400, 500), radians(i+45), map(mouseY, 100, 700, 0, i*radians(angle)));
}

//red windmill function
void redWindmill (int m) {
  fill(200, 0, 0, 30);
  arc(width/2, height/2, 300, 300, map(mouseY, 300, 400, 0, radians(360/m)), map(mouseY, 400, 700, radians(360/m), 0));
}

//arc slices function
void arcSlice (int p) {
  pushStyle();
  stroke(random(100, 255), 0, 0, random(0, 100));
  strokeCap(PROJECT);
  strokeWeight(random(30, 200));
  rotate(rotateDeg/p);
  noFill();
  arc(0, 0, 600, 600, radians(p*180), radians(p*200));
  rotateDeg+=.00001;
  popStyle();
}

//spinning triangles
void spinTri (int q) {
  fill (0, 0, 0);
  rotate (radians(45));
  triangle (200, 0, 300, 25, 250, 50);
}

//spin text
void spinText(int count) {
  textFont(fontBig);
  text("SPIN", 10, 0);
}

