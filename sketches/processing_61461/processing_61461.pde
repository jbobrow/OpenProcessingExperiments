
String[] lines;
int x, y, num, scalar, textY;
PFont font;

void setup() {
  //size(screenWidth, screenHeight);
  size(600, 600);
  lines = loadStrings("Halobacteriales.txt");
  x = 202;
  y = height-2;
  num = 0;
  scalar = 2;
  textY = 12;
  noStroke();
  noCursor();
  colorMode(HSB, 255);
  font = loadFont("Serif-48.vlw");
  //textAlign(CENTER);

  background(25);

  textFont(font, 16);
  //  println(lines);
  for (int i=0; i<lines.length; i++) {
    if (i%2!=0) {
      println(lines[i].length());
    }
  }
}

void draw() {
  makeLines(num);
  //rect(x, y, 2, 2);
}
int place = 0;
void makeLines(int index) {

  String name = lines[index].substring(lines[index].indexOf(">")+1, lines[index].length());
  String sequence = lines[index+1];
fill(255, 50);
  println(name);
  //for (int i=0; i<sequence.length(); i++) {
  String piece = sequence.substring(place, place+1);
  //println("STRING + " + piece);
  makeRect(piece, sequence.length(), name);
  
  rect(x, y, scalar, scalar);
  //delay(30);
  //}
  //exit();
  place++;
  if (place>sequence.length()-1) {
    place=0; 
    //x = width/2; 
    //y = width/2; 
    //background(25); 
    num+=2;
    textY+=16;
    if (textY>height-20) {textY = 12;}
  }
  if (num>=lines.length) {num=0;}
}

void makeRect(String st, int n, String name) {
  //int wide = width%n;
  //for (int i=0; i<n; i++) {
    if (place == 0) {
      float h;
      h = random(255);
      fill(h, 255, 255);
      stroke(h, 255, 255, 50);
      text(name, 0, textY);
    }
  if (st.equals("A")) {
    x-=scalar;
    println("A");
  }
  if (st.equals("C")) {
    y-=scalar;
    println("C");
  }
  if (st.equals("G")) {
    x+=scalar;
    println("G");
  }
  if (st.equals("U")) {
    y+=scalar;
    println("U");
  }
  
  if (x<200) {x=width-scalar;}
  if (x>width) {x=200+scalar;}
  
  if (y>height) {y = scalar;}
  if (y<0) {y = height-scalar;}
  //rect(wide, 0, (i*wide)+wide, height);
}
/**
void keyPressed() {
  if (key == ' ') {
    saveFrame("###.png");
  }
}
**/

