
int x, y;
Shapes[] shapes = new Shapes[70];

//color library
color a = color(148, 203, 205);
color b = color(255, 228, 184);
color c = color(247, 152, 156);
color d = color(60, 173, 182);
color e = color(255, 61, 127);
color[] myColors = new color[5];

void setup() {
  size(1000, 700);
  smooth();

  // put colors in array
  myColors[0] = color(148, 203, 205);
  myColors[1] = color(255, 228, 184);
  myColors[2] = color(247, 152, 156);
  myColors[3] = color(60, 173, 182);
  myColors[4] = color(255, 61, 127);

  for (int i = 0; i < shapes.length; i++) {
    int x0 = (i%10)*50;
    int y0 = (floor(i/10))*50;
    int mode = int(random(1, 20));
    shapes[i] = new Shapes(x0, y0, mode);
  }

  frameRate(12);
}

void draw() {

  background(53, 43, 57);
  noStroke();
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].display();
  }

}

class Shapes {

  int x;
  int y;

  int whichColor;
  int whichShape;


  Shapes (int xin, int yin, int mode) {
    x = xin;
    y = yin;
    whichShape = mode;
    whichColor = myColors[floor(random(5))];
  }

  void shuffle() {
    whichShape = int(random(1, 21));
    whichColor = myColors[floor(random(5))];
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(x, y);
    fill(whichColor);
    stroke(whichColor);

    switch(whichShape) {
    case 1:
      triangle1();
      break;
    case 2:
      triangle2();
      break;
    case 3:
      triangle3();
      break;
    case 4:
      triangle4();
      break;
    case 5:
      stripes1();
      break;
    case 6:
      stripes2();
      break;
    case 7:
      stripes3();
      break;
    case 8:
      stripes4();
      break;
    case 9:
      arc1();
      break;
    case 10:
      arc2();
      break;
    case 11:
      arc3();
      break;
    case 12:
      arc4();
      break;
    case 13:
      circles1();
      break;
    case 14:
      circles2();
      break;
    case 15:
      circles3();
      break;
    case 16:
      circles4();
      break;
    case 17:
      lines1();
      break;
    case 18:
      lines2();
      break;
    case 19:
      lines3();
      break;
    case 20:
      lines4();
      break;
    }
    popMatrix();
  }

  void triangle1() {
    pushMatrix();
    translate(x, y);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(0, 100);
    vertex(100, 100);
    endShape(CLOSE);
    popMatrix();
  }

  void triangle2() {
    pushMatrix();
    translate(x, y);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(100, 0);
    vertex(0, 100);
    endShape(CLOSE);
    popMatrix();
  }

  void triangle3() {
    pushMatrix();
    translate(x, y);
    noStroke();
    beginShape();
    vertex(0, 100);
    vertex(100, 100);
    vertex(100, 0);
    endShape(CLOSE);
    popMatrix();
  }

  void triangle4() {
    pushMatrix();
    translate(x, y);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(100, 0);
    vertex(100, 100);
    endShape(CLOSE);
    popMatrix();
  }

  void stripes1() {
    pushMatrix();
    translate(x, y);
    noStroke();
    rect(0, 0, 17, 100);
    rect(33, 0, 17, 100);
    rect(67, 0, 17, 100);
    popMatrix();
  }

  void stripes2() {
    pushMatrix();
    translate(x, y);
    noStroke();
    rect(0, 0, 100, 17);
    rect(0, 33, 100, 17);
    rect(0, 67, 100, 17);
    popMatrix();
  }

  void stripes3() {
    pushMatrix();
    translate(x, y);
    noStroke();
    rect(0, 0, 33, 33);
    rect(67, 0, 33, 33);
    rect(0, 67, 33, 33);
    rect(67, 67, 33, 33);
    popMatrix();
  }

  void stripes4() {
    pushMatrix();
    translate(x, y);
    noStroke();
    beginShape();
    vertex(33, 0);
    vertex(67, 0);
    vertex(67, 33);
    vertex(100, 33);
    vertex(100, 67);
    vertex(67, 67);
    vertex(67, 100);
    vertex(33, 100);
    vertex(33, 67);
    vertex(0, 67);
    vertex(0, 33);
    vertex(33, 33);
    endShape(CLOSE);
    popMatrix();
  }

  void arc1() {
    pushMatrix();
    translate(x, y);
    noStroke();
    arc(0, 0, 200, 200, 0, HALF_PI);
    popMatrix();
  }

  void arc2() {
    pushMatrix();
    translate(x, y);    
    noStroke();
    arc(0, 100, 200, 200, PI+HALF_PI, TWO_PI);
    popMatrix();
  }

  void arc3() {
    pushMatrix();
    translate(x, y);
    noStroke();
    arc(100, 100, 200, 200, PI, TWO_PI-HALF_PI);
    popMatrix();
  }

  void arc4() {
    pushMatrix();
    translate(x, y);
    noStroke();
    arc(100, 0, 200, 200, HALF_PI, PI);
    popMatrix();
  }

  void circles1() {
    pushMatrix();
    translate(x, y);
    ellipse(30, 30, 15, 15);
    ellipse(70, 30, 15, 15);
    ellipse(30, 70, 15, 15);
    ellipse(70, 70, 15, 15);
    popMatrix();
  }

  void circles2() {
    pushMatrix();
    translate(x, y);
    noStroke();
    rect(0, 0, 100, 100);
    //beginContour();
    fill(53, 43, 57);
    ellipse(30, 30, 15, 15);
    ellipse(70, 30, 15, 15);
    ellipse(30, 70, 15, 15);
    ellipse(70, 70, 15, 15);
    //endContour();
    popMatrix();
  }

  void circles3() {
    pushMatrix();
    translate(x, y);
    ellipse(50, 50, 75, 75);
    popMatrix();
  }

  void circles4() {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(whichColor);
    rect(0, 0, 100, 100);
    fill(53, 43, 57);
    ellipse(50, 50, 75, 75);
    popMatrix();
  }

  void lines1() {
    pushMatrix();
    translate(x, y);
    pushStyle();
    strokeWeight(2);
    line(0, 0, 100, 100);
    line(0, 10, 90, 100);
    line(0, 20, 80, 100);
    line(0, 30, 70, 100);
    line(0, 40, 60, 100);
    line(0, 50, 50, 100);
    line(0, 60, 40, 100);
    line(0, 70, 30, 100);
    line(0, 80, 20, 100);
    line(0, 90, 10, 100);
    line(0, 100, 0, 100);
    popStyle();
    popMatrix();
  }

  void lines2() {
    pushMatrix();
    translate(x, y);
    strokeWeight(2);
    line(0, 100, 100, 0);
    line(0, 90, 90, 0);
    line(0, 80, 80, 0);
    line(0, 70, 70, 0);
    line(0, 60, 60, 0);
    line(0, 50, 50, 0);
    line(0, 40, 40, 0);
    line(0, 30, 30, 0);
    line(0, 20, 20, 0);
    line(0, 10, 10, 0);
    line(0, 0, 0, 0);
    popMatrix();
  }

  void lines3() {
    pushMatrix();
    translate(x, y);
    strokeWeight(2);
    line(0, 100, 100, 0);
    line(10, 100, 100, 10);
    line(20, 100, 100, 20);
    line(30, 100, 100, 30);
    line(40, 100, 100, 40);
    line(50, 100, 100, 50);
    line(60, 100, 100, 60);
    line(70, 100, 100, 70);
    line(80, 100, 100, 80);
    line(90, 100, 100, 90);
    line(100, 100, 100, 100);
    popMatrix();
  }

  void lines4() {
    pushMatrix();
    translate(x, y);
    strokeWeight(2);
    line(0, 0, 100, 100);
    line(10, 0, 100, 90);
    line(20, 0, 100, 80);
    line(30, 0, 100, 70);
    line(40, 0, 100, 60);
    line(50, 0, 100, 50);
    line(60, 0, 100, 40);
    line(70, 0, 100, 30);
    line(80, 0, 100, 20);
    line(90, 0, 100, 10);
    line(100, 0, 100, 0);
    popMatrix();
    noStroke();
  }
}

void mouseMoved() {
  int index = floor(mouseY/100.0)*10+floor(mouseX/100.0);
  shapes[index].shuffle();
}

void keyPressed() {
  if (key == ' ')
    setup();

  if (key == '1')
    for (int i = 0; i < shapes.length; i++) {
      int x0 = (i%10)*50;
      int y0 = (floor(i/10))*50;
      int mode = int(random(1, 5));
      shapes[i] = new Shapes(x0, y0, mode);

    }

  if (key == '2')
    for (int i = 0; i < shapes.length; i++) {
      int x0 = (i%10)*50;
      int y0 = (floor(i/10))*50;
      int mode = int(random(5, 9));
      shapes[i] = new Shapes(x0, y0, mode);
    }

  if (key == '3')
    for (int i = 0; i < shapes.length; i++) {
      int x0 = (i%10)*50;
      int y0 = (floor(i/10))*50;
      int mode = int(random(9, 13));
      shapes[i] = new Shapes(x0, y0, mode);
    }

  if (key == '4')
    for (int i = 0; i < shapes.length; i++) {
      int x0 = (i%10)*50;
      int y0 = (floor(i/10))*50;
      int mode = int(random(13, 17));
      shapes[i] = new Shapes(x0, y0, mode);
    }

  if (key == '5')
    for (int i = 0; i < shapes.length; i++) {
      int x0 = (i%10)*50;
      int y0 = (floor(i/10))*50;
      int mode = int(random(17, 21));
      shapes[i] = new Shapes(x0, y0, mode);
    }
}



