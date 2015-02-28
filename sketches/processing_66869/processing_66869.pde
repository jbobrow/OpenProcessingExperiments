
PFont font;

void setup() {
  size(340, 250);
  background(255);
  smooth();

  font = loadFont("font.vlw");
  textFont(font);
  textAlign(CENTER);
  
  rectMode(CENTER);
}

int c = 1;
float s;

void draw() {
  translate(width/2,height/2);
  
  fill(255, 80);
  noStroke();
  rect(0,0,width,height);

  disp();
}

void disp() {
  fill(0);
  textSize(s);
  
  if (c % 3 == 0 && c % 5 == 0) {
    text("FizzBuzz", 0, 20);
  }
  else if (c % 3 == 0) {
    text("Fizz", 0, 20);
  }
  else if (c % 5 == 0) {
    text("Buzz", 0, 20);
  }
  else {
    text(c, 0, 20);
  }
  s += 0.75;
  if (s > 70) {
    s = 0;
    c++;
    if(c > 1000){
      c = 1;
    }
  }
}


