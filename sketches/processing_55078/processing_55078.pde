
int x = 20;
int y = 0;
int counter = 0;

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(x, y, 4, 4); //dot
  stroke(255);
  strokeWeight(0.3);
  line(x, y, x+10, y+10);
  line(x, y, x-10, y+10); //little lines
  stroke(0, random(255), random(100));
  strokeWeight(2);
  line(x, y, width/2, height);
  stroke(0, random(255), random(100));
  strokeWeight(2);
  line(x, y, width/2+width/4, height+height/4);
  line(x, y, width/2-width/4, height+height/4);

  counter ++;


  if (x < width) {
    x+=10;
  }

  if ( x == width) {
    x = 10;
    y+=10;
  }

  if ( y == height) {
    x = 20;
    y = 20;  
    super.stop();
  }
  println(counter);
}






