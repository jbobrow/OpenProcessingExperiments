
ArrayList<Segment> Segments = new ArrayList<Segment>();
ArrayList<Rat> rat = new ArrayList<Rat>();
int row = 30, col = 30;
Rat r1 = new Rat();
int dir = 0;

void setup() {
  size(780, 780);
  frameRate(3);
  Segment head = new Segment(width/2, height/2);
  Segments.add(head);
  rat.add(r1);
  fill(0,200,0); 
}

void draw() {
  drawGrid();
  Segment head = Segments.get(0);
  head.move();
  for (Segment s : Segments) {
    s.render();
  }
  eat();
  for (Rat r: rat) {
    r.drawRat();
  }
  checkGameOver();
  //println("X = " + Segments.get(Segments.size()-1).loc.x + " Y = " + Segments.get(Segments.size()-1).loc.y);
}

void drawGrid() {
  background(255);

  for (int i = 0 ; i < row ; i++) {
    line(0, i * row, width, i * row);
  }

  for (int i = 0 ; i < col ; i++) {
    line(i * col, 0, i * col, height);
  }
}

void eat() {

  if ((Segments.get(0).loc.x == rat.get(0).loc.x) && Segments.get(0).loc.y == rat.get(0).loc.y) {
    rat.remove(0);
    rat.add(new Rat());
    int x = (int)Segments.get(Segments.size()-1).lastLoc.x;
    int y = (int)Segments.get(Segments.size()-1).lastLoc.y;
    Segments.add(new Segment(x, y));
    for (int i = 0 ; i < Segments.size() - 1; i++) {
      Segment front = Segments.get(i);
      Segment back = Segments.get(Segments.size() - 1);
      back.loc.x = front.lastLoc.x;
      back.loc.y = front.lastLoc.y;
    }
  }
}


void checkGameOver() {
  Segment head = Segments.get(0);
  int x = (int) head.loc.x;
  int y = (int) head.loc.y;
  if (x > width || x < 0 || y > height || y < 0 ) {
    fill(128, 0, 128);
    textAlign(CENTER);
    textSize(120);
    text("Game Over!", width/2, height/2);
    noLoop();
  }
}

class Segment {
  PVector loc, lastLoc;

  public Segment(int x, int y) {
    loc = new PVector(x, y);
    lastLoc = new PVector(0, 0);
  }

  void move() {
    fill(0, 200, 0);
    lastLoc.x = loc.x;
    lastLoc.y = loc.y;
    rect(loc.x, loc.y, 30, 30);
    if (keyCode == UP) {
      loc.y -= 30;
      dir = 1;
    } 
    else if (keyCode == DOWN) {
      loc.y += 30;
      dir = 2;
    } 
    else if (keyCode == LEFT) {
      loc.x -= 30;
      dir = 3;
    } 
    else if ( keyCode == RIGHT) {
      loc.x += 30;
      dir = 4;
    }
  }
  void render() {
    fill(0, 200, 0);
    rect(lastLoc.x, lastLoc.y, 30, 30);
  }
}

class Rat {
  PVector loc;

  public Rat() {
    loc = new PVector((int)random(750 / 30) * 30, (int)random(750 / 30) * 30);
  }

  void drawRat() {
    fill(200, 0, 0);
    rect(loc.x, loc.y, 30, 30);
  }
}
