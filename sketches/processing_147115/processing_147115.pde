
String[] foo;
int randline;
int roller;
int linelong;
PFont font;
int x;
int y;
int z;
float xper;
float yper;

void setup() {
  size(900,300);
  frameRate(15);
  font = loadFont("AvenirNext-Medium-9.vlw");
  textFont(font, 9);
  foo = loadStrings("Hamlet.txt");
  println(foo[randline]);
  roller = 50;
  background(0);
}

void draw() {
  fill(0,0,0,20);
  randline = int (random(foo.length));
  rect(0,0,width,height);
  stroke(255);
  fill(255);
  text (foo[randline], 10, roller);
  linelong = int(foo[randline].length());
  text (linelong, roller*3, 10);
  text (foo[randline].substring(0,4), roller*3, 20);
  if (foo[randline].startsWith("Ham.")) {
    fill(255,0,255);
    ellipse((roller*3)+2,30,6,6);
    x=x+1;
  }
    else {
     fill(0,255,0);
     y=y+1;
    }
  roller=roller+10;
  z=z+1;
    yper=y*100/z;
    xper=x*100/z;
    fill(255,0,255);
    text ("HAM", 10, 20);
    rect(35,15,xper,5);
    text (int(xper)+"%", xper+40, 20);
    fill(0,255,0);
    text ("NOT", 10, 32);
    rect(35,27,yper,5);
    text (int(yper)+"%", yper+40, 32);
  if (roller > height-10) {
    roller = 50;
  }
  
}


