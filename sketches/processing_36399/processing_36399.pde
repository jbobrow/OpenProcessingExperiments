
void setup() {
  size(300, 300);
}

int x=0;
int y=300;

void draw() {
  //set wing gradient
  stroke(100, 90, 100);
  line(0, height/2, y, height/2);
  line(x, 0, width, height);
  x++;
  y--;


  //static point in time
  if (mousePressed) {
    background(0, 0, 100);
    fill(255, 255, 0);
    noStroke();
    ellipse(width/4, height/4*3, width/2-15, height/2-15);
    stroke(155);
    strokeWeight(2);
    ellipse(width/4, height/2+20, width/2-20, 50);
    fill(0, 255, 0);
    noStroke();
    triangle(width/4, height-5, width/4-70, height-30, width/4+70, height-30);
    stroke(0, 255, 0);
    strokeWeight(3);
    line(width/4, height-5, width/4, height);
  }

  else {

    //define moving butterfly wing with alternate background
    noStroke();
    fill(0, 0, 255);
    triangle(width/2, height/2, width/2, height, width, height);
    triangle(0, 0, width, 0, 0, height);
    triangle(width/2, height/2, width/2, height, 0, height);

    //static butterfly parts
    fill(100, 90, 100);
    triangle(width/2, height/2, width/2, 0, width/4*3, height/4);
    stroke(255);
    line(width/4, height/4, width/2, height/2);
    line(0, height/2, width/2, height/2);
    fill(255);
    ellipse(width/4, height/4, 20, 20);
    ellipse(0, height/2, 20, 20);

    //def flower parts
    fill(255, 255, 0);
    noStroke();
    ellipse(width/4, height/4*3, width/2-15, height/2-15);
    stroke(155);
    strokeWeight(2);
    ellipse(width/4, height/2+20, width/2-20, 50);
    fill(0, 255, 0);
    noStroke();
    triangle(width/4, height-5, width/4-70, height-30, width/4+70, height-30);
    stroke(0, 255, 0);
    strokeWeight(3);
    line(width/4, height-5, width/4, height);
  }
}


