

PImage record;
float angle;
float c = 0;

float xpos;
float ypos;
float drag = 30.0;
PImage needle;

void setup() {
  size(600,400);
  record = loadImage("record.png");

  needle = loadImage("needle.png");
  smooth();
  noStroke();
  fill(255);


//  rectMode(CENTER);
  frameRate(30);
}

void draw() {




  if (c > 6) {
    c = 0;
  } else {
    c = c + 0.2;
  }
  println(c);
  translate(250, 200);
  rotate(c);         
  image(record,  -250,-250);
  

}




 


