
ArrayList<Segment> Segments = new ArrayList<Segment>();
ArrayList<Rat> rat = new ArrayList<Rat>();
int row = 30, col = 30;
Rat r1 = new Rat();
int score = 0;

void setup() {
  size(780, 780);
  frameRate(8);
  Segment head = new Segment(width/2, height/2);
  Segments.add(head);
  rat.add(r1);
}

void draw() {
  drawGrid();
  Segment head = Segments.get(0);
  head.move();
  for (Segment s : Segments) {
    s.render();
  }
  //move();
  eat();
  for (Rat r: rat) {
    r.drawRat();
  }
  checkGameOver();
    textAlign(CENTER, BOTTOM);
    fill(0);
    textSize(70);
    fill(random(255), random(255), random(255));
    text("Score = " + score, 390, 730 );
   
  if(score == 20) {
   noLoop(); 
   textAlign(CENTER);
    fill(0);
    textSize(100);
    fill(random(255), random(255), random(255));
    text("You win!!!!" , 390, 390 );
  }
  
 
}

void drawGrid() {
  background(0);

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
    score++;
    
    //int x = (int)Segments.get(Segments.size()-1).lastLoc.x;
    //int y = (int)Segments.get(Segments.size()-1).lastLoc.y;
    int x = (int)Segments.get(0).lastLoc.x;
    int y = (int)Segments.get(0).lastLoc.y;
    Segments.add(new Segment(x, y));
    
  }
}

void checkGameOver() {
  Segment head = Segments.get(0);
  int x = (int) head.loc.x;
  int y = (int) head.loc.y;
  if (x > width || x < 0 || y > height || y < 0 ) {
    noLoop();
    textAlign(CENTER);
    textSize(120);
    fill(random(255), random(255), random(255));
    text("Game Over!", width/2, height/2);
    textSize(70);
    text("You Lose! ", 400, 650);
  }
  for (int i = 1 ; i < Segments.size() -1 ; i++ ) {
    if((x == Segments.get(i).loc.x && y == Segments.get(i).loc.y) || (x == Segments.get(i).lastLoc.x && y == Segments.get(i).lastLoc.y )) {
    textSize(120);
    fill(random(255), random(255), random(255));
    text("Game Over", width/2, height/2);
    textSize(70);
    text("You Lose! ", 400, 650);
    noLoop();
    }
  }
}

class Segment {
  PVector loc, lastLoc;

  public Segment(int x, int y) {
    loc = new PVector(x, y);
    lastLoc = new PVector(loc.x,loc.y);
  }

  void move() {
    fill(0, 200, 0);
    lastLoc.x = loc.x;
    lastLoc.y = loc.y;
    rect(loc.x, loc.y, 30, 30);
    if (keyCode == UP) {
      loc.y -= 30;
    } 
    else if (keyCode == DOWN) {
      loc.y += 30;
    } 
    else if (keyCode == LEFT) {
      loc.x -= 30;
    } 
    else if ( keyCode == RIGHT) {
      loc.x += 30;
    }
  }
  void render() {
    fill(0, 200, 0);
    for(int i = 0 ; i < Segments.size() - 1; i++) {
      Segment s = Segments.get(i);
      s.show();
    } 
  }
  
  void show() {
    fill(0,200,0);
    rect(lastLoc.x, lastLoc.y, 30, 30);  
  }
}

class Rat {
  PVector loc;

  public Rat() {
    loc = new PVector((int)random(750 / 30) * 30, (int)random(750 / 30) * 30);
  }

  void drawRat() {
    fill(random(255), random(255), random(255));
    rect(loc.x, loc.y, 30, 30);
  }
}
