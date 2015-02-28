
//declare image & font names
PImage img;
PFont font1;
PFont font2;
PFont font3;



void setup() {
  //load image
  img = loadImage("madonna.jpg");
  size(600,600);
   //load fonts
  font1 = loadFont ("Silkscreen-48.vlw");
  font2 = loadFont ("TwCenMT-BoldItalic-48.vlw");
  font3 = loadFont ("CooperBlackStd-Italic-48.vlw");
  //environment
  background(255);
  textAlign(CENTER);
  smooth(); 
}

//begin with movin around tha madonna shrine proposal
void mouseMoved() {
  fill(0);
  textAlign(CENTER);
  stroke(0,0,255); //WHY WONT THIS STROKE WORK
  textAlign(CENTER);
  textFont(font1);
  textSize(20);
  background(255);
  text("let's make a Madonna shrine!", pmouseX, pmouseY);  
}

//background load madonna when you click
void mousePressed() {
  background(0);
  imageMode(CENTER);
  image(img,300,300);
}

//dragging writes "waitsrsly?"
void mouseDragged() {
  textFont(font1);
  textSize(20);
  fill(255);
  stroke(0);
  text("wait, seriously?", random(width),random(height));
}

//release mouse
void mouseReleased() {
  textFont(font3);
  background(255);
  textSize(40);
  fill(0,255,151);
  String s = "NEVERMIND THAT'D BE PRETTY WEIRD...";
  text(s, 10, 230, 550, 600);
}


//LUV Madonna. one character at a time?
void keyPressed() {
  fill(0);
  textFont(font2);
  text("L.",50,200);
  text("U.",550,200);
  text("V.",300,400);
  text("MADONNA!",300,550);
  }


//call draw so that events 
//are listened for
void draw() {
  
}



