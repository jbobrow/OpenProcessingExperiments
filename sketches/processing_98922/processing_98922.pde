
String name = "abcdefghijklmnopqrstuvwxyz";
String buffer = "";
float[] a;
int b=0;

void setup() {
  a = new float[name.length()];

  size(600, 600);
  background(255);
  stroke(255);
  strokeWeight(1);
  smooth();
  colorMode(HSB, 100);
}



void draw() {
  noStroke();
  colorMode(RGB, 100);
  fill(100, 100, 100, 0.5);
  colorMode(HSB, 100);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  int y=10;
  for (int i=0;i<name.length();i++) {

    pushMatrix();
    if (name.charAt(i) == ' ') {
      y+=15;
    }
    else {
      float lineColor = map(int(name.charAt(i)), 97, 122, 0, 100)+random(5);
      stroke(lineColor, 70, 90);
      float rotation = radians(a[i]+=(map(int(name.charAt(i)), 97, 122, 0.1, 1)) )+random(0.5);
      rotate(rotation);
      float lengthOfLine = map(int(name.charAt(i)), 97, 122, 2, 30);
      line(0, y, 0, y+=lengthOfLine );
      y+=2;
    }
    popMatrix();
  }
}


void keyPressed() {
  print(key); 

  if (keyCode == 10) {
    println(buffer);
    name=buffer;
    a = new float[name.length()];
    colorMode(RGB, 100);
    background(100);
    colorMode(HSB, 100);
    buffer="";
  }
  else {
    buffer+=key;
  }
}
