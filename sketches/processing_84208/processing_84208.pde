
void setup() {
  size(800, 600);
  //  myCircle = new Circle(width / 2, height / 2, 10);
  //  myCircle.isPlayer = true;
  halfSpeed = speed / 2;
  font = loadFont("ComicSansMS.vlw");
  textFont(font, 12);
  //  for ( int i = 0; i < 10; i++)
  //  {
  //    circles.add(new Circle((int)random(0, width), (int)random(0, height), (int)random(5, 40 + speed / 2)));
  //    circles.get(i).setIncrements(random(-2, 2) + speed / 5.0, random(-2, 2) + speed / 5.0);
  //  }
  //  sortArray(circles);
  //  biggest = ordered.get(0);
}

Circle myCircle;
int lives = 5;
boolean invuln = true;
int invulnTimer = 50;
PFont font;
Weapon w;
ArrayList<Circle> circles = new ArrayList<Circle>();
ArrayList<Circle> ordered;
boolean win = false;
boolean slow = true;
Circle biggest;
boolean clicked = false;
int screen = 0;
int speed = 0;
int spd = 0;
int halfSpeed = 0;
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
Button b = new Button("", 0, 0, 0, 0, 0);

void sortArray(ArrayList<Circle> c) {
  ordered = new ArrayList<Circle>();
  if ( c.size() > 0 ) {
    ordered.add(c.get(0));
  }
  for ( int i = 1; i < c.size(); i++) {
    for ( int j = 0; j < ordered.size(); j++) {
      if ( c.get(i).r > ordered.get(j).r) {
        ordered.add(j, c.get(i));
        break;
      }
      if ( ordered.size() - 1 == j) {
        ordered.add(c.get(i));
        break;
      }
    }
  }
}
void addNewCircle(int i)
{
  circles.set(i, new Circle((int)random(0, width), (int)random(0, height), (int)random(10, 40 + speed / 2)));
  circles.get(i).setIncrements(random(-2, 2) + speed / 5.0, random(-2, 2) + speed / 5.0);
  sortArray(circles);
}
void draw() {
  switch(screen) {
  case 0: 
    doStart();
    break;
  case 1: 
    doGame();
    break;
  case 2:
    doLose();
    break;
  case 3: 
    doWin();
    break;
  }
  clicked = false;
}
void doStart() {
  background(255);
  b.setButton("Start", 1, width / 2 - 20, height / 2 - 10, 40, 30);
}
void doGame() {
  if ( lives > 0) {
    invulnTimer--;
    if ( invulnTimer < 0) {
      invulnTimer = 50 - speed;
      invuln = false;
    }
    if ( myCircle.r < biggest.r) {
      background(255);
    }
    else {
      background(205, 201, 201);
    }
    biggest = ordered.get(0);
    for (int i = 0; i < circles.size(); i++)
    {
      Circle c = circles.get(i);
      if ( c.needAI(myCircle))
      {
        c.doAI(myCircle);
        fill(255, 0, 0);
      }
      if ( c.isBiggest(ordered) )
      {
        c.doBiggest(ordered);
        fill(0, 0, 255);
      }
      c.draw();
      noFill();
      if ( myCircle.isColliding(c) )
      {
        if ( myCircle.r > c.r )
        {
          myCircle.eat(c, 2 - speed / 20.0);
          if ( c.r == biggest.r ) {
            win = true;
            screen = 3;
          }
          addNewCircle(i);
        }
        else if ( !invuln )
        {
          lives--;
          invuln = true;
        }
      }
      for ( int j = 0; j < circles.size(); j++)
      {
        Circle check = circles.get(j);
        if (c.isColliding(check))
        {
          if ( c.r > check.r)
          {
            c.eat( check, .5 + speed / 20.0);
            addNewCircle(j);
          }
        }
      }
    }
    spd = myCircle.r / 10;
    if ( spd < 3) {
      spd = 3;
    }
    if (spd > 8) {
      spd = 8;
    }
    if (left) {
      myCircle.x -= spd;
    }
    if (right) {
      myCircle.x += spd;
    }
    if (up) {
      myCircle.y -= spd;
    }
    if (down) {
      myCircle.y += spd;
    }
    fill( 0, 255, 0);
    if ( invuln && (invulnTimer + 4 / 5 ) % 2 == 1)
    {
      fill( 255, 255, 0);
    }
    myCircle.draw();
    fill(0);
    text("Lives: " + lives, width / 2 - 10, 10);
    noFill();
  }
  else {
    screen = 2;
  }
}
void mouseClicked() {
  clicked = true;
  //  if ( screen == 1) {
  //    for ( Circle c : circles) {
  //      c.r -= c.r / 2;
  //    }
  //  }
}
void mousePressed() {
  if ( screen == 1) {
    w.activated = true;
  }
}
void mouseReleased() {
  if ( screen == 1) {
    w.activated = false;
  }
}
void keyPressed() {
  //  if ( key == ' ' && slow && screen == 1) {
  //    speed -= halfSpeed;
  //    slow = false;
  //  }
  if ( key == CODED ) {
    if ( keyCode == LEFT ) {
      left = true;
    }
    if ( keyCode == RIGHT ) {
      right = true;
    }
    if ( keyCode == UP ) {
      up = true;
    }
    if ( keyCode == DOWN ) {
      down = true;
    }
  }
  if ( key == 'a' ) {
    left = true;
  }
  if ( key == 'd' ) {
    right = true;
  }
  if ( key == 'w' ) {
    up = true;
  }
  if ( key == 's' ) {
    down = true;
  }
}
void keyReleased() {
  //  if ( key == ' ' && screen == 1) {
  //    speed += halfSpeed;
  //    slow = true;
  //  }
  if ( key == CODED ) {
    if ( keyCode == LEFT ) {
      left = false;
    }
    if ( keyCode == RIGHT ) {
      right = false;
    }
    if ( keyCode == UP ) {
      up = false;
    }
    if ( keyCode == DOWN ) {
      down = false;
    }
  }
  if ( key == 'a' ) {
    left = false;
  }
  if ( key == 'd' ) {
    right = false;
  }
  if ( key == 'w' ) {
    up = false;
  }
  if ( key == 's' ) {
    down = false;
  }
}
void reset() {
  invuln = true;
  myCircle = new Circle(width / 2, height / 2, 15);
  w = new Weapon(1, true, myCircle);
  myCircle.isPlayer = true;
  myCircle.w = w;
  if ( win ) {
    lives++;
    speed++;
  }
  else {
    lives = 5;
    speed = 0;
  }
  halfSpeed = speed / 2;
  circles = new ArrayList<Circle>();
  for ( int i = 0; i < 20; i++)
  {
    circles.add(new Circle((int)random(0, width), (int)random(0, height), (int)random(10, 40 + speed / 2)));
    circles.get(i).setIncrements(random(-2, 2) + speed / 4.0, random(-2, 2) + speed / 4.0);
  }
  sortArray(circles);
  biggest = ordered.get(0);
  win = false;
}
void doLose() {
  background(0);
  fill(255);
  String rank;
  if ( speed < 12 ) {
    rank = "Scrub";
  }
  else {
    rank = "better than Jason";
  }
  text("You Lose", width / 2 - 40, height / 2 - 10);
  text("You are rank " + rank, width / 2 - 40, height / 2 + 5);
  b.setButton("Retry", 1, 0, 0, 55, 30);
}
void doWin() {
  background(150);
  fill(255);
  text("You Win!", width / 2 - 40, height / 2 - 10);
  text("You Gain a Life", width / 2 - 40, height / 2 - 25);
  text("You beat Level " + speed, width / 2 - 40, height / 2 + 5);
  b.setButton("Continue", 1, 0, 0, 55, 30);
}

class Button {
  String word;
  int xCor;
  int yCor;
  int bWidth;
  int bHeight;
  int bScreen;
  Button(String txt, int screenNum, int x, int y, int w, int h) {
    word = txt;
    xCor = x;
    yCor = y;
    bWidth = w;
    bHeight = h;
    bScreen = screenNum;
  }
  void setButton(String txt, int screenNum, int x, int y, int w, int h) {
    word = txt;
    xCor = x;
    yCor = y;
    bWidth = w;
    bHeight = h;
    bScreen = screenNum;
    this.draw();
  }
  void draw() {
    if (isMouseOverButton(xCor, yCor, bWidth, bHeight)) {
      fill(200);
      rect( xCor, yCor, bWidth, bHeight);
      //image( mouseOverButton, xCor, yCor, bWidth, bHeight);
      if (clicked) {
        act();
      }
    } 
    else {
      fill(155);
      rect( xCor, yCor, bWidth, bHeight);
      //image ( button, xCor, yCor, bWidth, bHeight);
    }
    fill(255);
    text(word, xCor + 5, yCor + 15);
  }
  void act() {
    screen = bScreen;
    if( bScreen == 1) {
      reset();
    }
  }
  boolean isMouseOverButton( int x, int y, int w, int h) {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}

class Circle {
  int x;
  int y;
  int r;
  float xInc = 0;
  float yInc = 0;
  int runDistance = 200;
  boolean isPlayer = false;
  Weapon w = null;
  ArrayList<Circle> ordered = new ArrayList<Circle>();
  Circle(int xCor, int yCor, int rad) {
    x = xCor;
    y = yCor;
    r = rad;
  }
  void draw() {
    if (isPlayer) {
      w.draw();
    }
    ellipse(x, y, r, r);
    x += (int)xInc;
    y += (int)yInc;
    if (x > width)
    {
      x -= width;
    }
    if (x < 0)
    {
      x += width;
    }
    if (y > height)
    {
      y -= height;
    }
    if (y < 0)
    {
      y += height;
    }
  }
  void setIncrements( float x, float y) {
    xInc = x;
    yInc = y;
  }
  void setSpeed( int s) {
    speed = s;
  }
  boolean isColliding( Circle c ) {
    double distance = Math.sqrt((x - c.x)*(x - c.x) + (y - c.y)*(y - c.y));
    return distance <= (c.r + r) / 2;
  }
  void eat( Circle  c, double fraction) {
    double area = r * r * Math.PI + c.r * c.r * Math.PI * fraction;
    r = (int)(Math.sqrt(area / Math.PI));
  }
  boolean isBiggest(ArrayList<Circle> circles) {
    int i;
    for ( i = 0; i < circles.size(); i++) {
      if (r < circles.get(i).r)
      {
        break;
      }
    }
    if ( i == circles.size())
    {
      return true;
    }
    return false;
  }
  String toString() {
    return "(" + x + ", " + y + ")" + " radius: " + r;
  }
  boolean needAI(Circle c) {
    return r < c.r && runDistance + c.r > Math.sqrt((x - c.x)*(x - c.x) + (y - c.y)*(y - c.y));
  }
  void doAI(Circle c) {
    float rAngle = atan2((c.y - y), (c.x - x));
    rAngle += Math.PI / 4 + random((float)0, (float)Math.PI);
    if ( rAngle > Math.PI)
    {
      rAngle -= Math.PI * 2;
    }
    rAngle += Math.PI * 2;
    if ( speed / 3.0 > spd) {
      float tempSpeed = spd - 0.5;
      xInc = cos(rAngle) * tempSpeed;
      yInc = sin(rAngle) * tempSpeed;
    }
    else {
      xInc = cos(rAngle) * speed / 3.0;
      yInc = sin(rAngle) * speed / 3.0;
    }
  }
  void doBiggest( ArrayList<Circle> temp ) {
    int count = 0;
    while (temp.get (count).r >= r) {
      count++;
    }
    float rAngle = atan2((temp.get(count).y - y), (temp.get(count).x - x));
    xInc = cos(rAngle) * speed / 2.0;
    yInc = sin(rAngle) * speed / 2.0;
  }
}

class Weapon {
  int atk;
  boolean isMelee;
  boolean activated = false;
  float x1, y1, x2, y2;
  Circle c;
  Weapon(int attack, boolean melee, Circle cir) {
    c = cir;
    atk = attack;
    isMelee = melee;
  }
  void draw() {
    if (activated) {
      if (isMelee) {
        float xDif = mouseX - c.x;
        float yDif = mouseY - c.y;
        float len = (float)Math.sqrt(xDif * xDif + yDif * yDif);
        x1 = xDif / len * c.r / 2 + c.x;
        y1 = yDif / len * c.r / 2 + c.y;
        x2 = xDif / len * (30 + c.r) + c.x;
        y2 = yDif / len * (30 + c.r) + c.y;
        line((int)x1, (int)y1, (int)x2, (int)y2);
      }
      for ( int i = 0; i < circles.size(); i++) {
        Circle cir = circles.get(i);
        if ( touches(cir))
        {
          cir.r -= atk;
          sortArray(circles);
          biggest = ordered.get(0);
          if ( cir.r <= 3) {
            i--;
            circles.remove(cir);
            circles.add(new Circle((int)random(0, width), (int)random(0, height), (int)random(10, 40 + speed / 2)));
          }
        }
      }
    }
  }
  boolean touches(Circle cir) {
    PVector star = new PVector(x1, y1);
    PVector segv = new PVector(x2, y2);
    segv.sub(star);
    PVector circ = new PVector(cir.x, cir.y);
    PVector tCir = new PVector(circ.x, circ.y);
    tCir.sub(star);
    float temp = segv.mag();
    segv.div(temp);
    float magnitude = tCir.dot(segv);
    PVector closest;
    if ( magnitude < 0) {
      closest = star;
    }
    else if ( magnitude > temp) {
      closest = new PVector(x2, y2);
    }
    else {
      segv.mult(magnitude);
      star.add(segv);
      closest = star;
    }
    circ.sub(closest);
    if ( circ.mag() < cir.r / 2) {
      return true;
    } 
    return false;
  }
}



