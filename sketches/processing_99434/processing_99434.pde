
class Bot {
  private float x = 0;
  private float r = 0;
  private float y = 0;
  private float coeff = 0.5 + 0.01*kills;

  Bot() {
    x = (int)random(800);
    y = (int)random(800);
  }

  public void calcposn(int y, int x) {
    r = atan2(y-this.y, x - this.x);
    this.x += coeff*cos(r);
    this.y += coeff*sin(r);
    //    if (x < mouseX) {
    //      x++;
    //    }
    //    if (y > mouseY) {
    //      y--;
    //    }
    //    if (y < mouseY) {
    //      y++;
    //    }
    //    if (x > mouseX ) {
    //      x--;
  }
  void display() {
    stroke(255, 0, 0);
    noFill();
    ellipseMode(CENTER);
    ellipse(x, y, 20, 20);
  }
  int getX() {
    return (int) x;
  }

  int getY() {
    return (int) y;
  }
}
class Botshooter {
  private int health = 10;
  private float x = 0;
  private float r = 0;
  private float y = 0;
  private int radius2 = 20;
  protected int heighta1 = 0;
  protected int widtha1 = 0;
  private boolean opmode = false;

  Botshooter(int x, int y) {
    this.health = 10;
    this.x = x;
    this.y = y;
    this.heighta1 = y*2;
    this.widtha1 = x*2;
  }
  void mousePressed() {
    firebullet(this.getX(), this.getY(), mouseX, mouseY);
  }
  void keyPressed() {
    //println(5);
    if (key == 'a' || key == 'A') {
      // println(5);
      x-=20;
    }
    if (key == 'd' || key == 'D') {
      x+=20;
    }
    if (key == 'w' || key == 'W') {
      y-=20;
    }
    if (key == 's' || key == 'S') {
      y+=20;
    }
    if (key == 'z' || key == 'Z') {
      opmode = !opmode;
    }
  }

  void display() {//int y, int x) {
    if (opmode == true) {
      stroke((int)random(255), (int)random(255), (int)random(255));
    }
    else {
      stroke(0, 255, 0);
    }
    noFill();
    rectMode(CENTER);
    fixposn();
    rect(x, y, radius2, radius2);
  }

  int getX() {
    return (int) x;
  }

  int getY() {
    return (int) y;
  }

  void fixposn() {
    if (this.x > widtha1) {
      this.x %= widtha1;
    }
    if (this.y > heighta1) {
      this.y %= heighta1;
    }
    if (this.y < 0) {
      y = heighta1;
    }
    if (this.x < 0) {
      x = widtha1;
    }
  }
  int getRadius(){
    return radius2;
  }
  void firebullet(int x, int y, int x1, int y1) {
    if (bulletlist.size() < 1) {
      bulletlist.add(new Bullet(x, y, x1, y1));
    }
  }
  void damaged(){
    health--;
  }
  int getHealth(){
    return health;
  }
}
class Bullet {
  private float x = 0;
  private float y = 0;
  private float x1 = 0;
  private float y1 = 0;
  private float radius1 = 10;
  private boolean selfdestruct = false;

  Bullet(float x, float y, float x1, float y1) {
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.y1 = y1;
  }

  public void calcposn() {
    this.x += 0.75*(x1 - x)/70;
    this.y += 0.75*(y1 - y)/70;
    if (x1 + 10 >= x && x1 - 10 <= x && y1 + 10 >= y && y1 - 10 <= y) {
      if (radius1 >= 50) {
        selfdestruct = true;
      }
      else {
        radius1++;
      }
    }
  }
  void display() {
    stroke((int)random(255), (int)random(255), (int)random(255));
    noFill();
    ellipseMode(CENTER);
    ellipse(x, y, radius1, radius1);
  }
  boolean getSelfdestruct() {
    return selfdestruct;
  }
  void explode() {
    radius1++;
    if (radius1 == 30) {
    }
  }
  int getX() {
    return (int) x;
  }
  float getRadius() {
    return radius1;
  }
  int getY() {
    return (int) y;
  }
}
//fields
int time = 0;
int framespersecond = 200;
int timeconstant = framespersecond*3;
ArrayList <Bot> botbot;
ArrayList <Bullet> bulletlist;
Botshooter bs;
int kills = 0;

//methods
void setup() {
  size(800, 800);
  background(0);
  frameRate(framespersecond);
  //println(5);
  botbot = new ArrayList <Bot>();
  botbot.add(new Bot());
  bs = new Botshooter(width/2, height/2);
  bulletlist = new ArrayList <Bullet> ();
}

void draw() {
  background(0);
  fill(255);
  textSize(32);
  if(bs.getHealth() <= 0){
    textSize(84);
    text("THE GAME IS OVER", 20, 400);
  }else{
    text("Kills:" + kills, (width - 50)/2, 30);
    text("Health:" + bs.getHealth(), (width - 120)/2, 760);
    bs.display();// height, width);
    if (time < timeconstant) {
      time++;
    }
    else {
      time = 0;
      botbot.add(new Bot());
    } 
    for (int j = 0; j < botbot.size(); j++) {
      (botbot.get(j)).calcposn(bs.getY(), bs.getX());
      (botbot.get(j)).display();
    }  
    for (int k = 0; k < bulletlist.size(); k++) {
      (bulletlist.get(k)).calcposn();
      (bulletlist.get(k)).display();
      if ((bulletlist.get(k)).getX() > width || (bulletlist.get(k)).getY() > height || (bulletlist.get(k)).getX() <= 0 || (bulletlist.get(k)).getY() < 0) {
        bulletlist.remove(k);
        k--;
      }
      if (bulletlist.get(k).getSelfdestruct() == true) {
        bulletlist.remove(k);
        k--;
      }
    }
    for (int i = 0; i < botbot.size(); i++) {
      for (int j = 0; j < bulletlist.size(); j++) {
        if (bulletlist.get(j).getX() + bulletlist.get(j).getRadius() > botbot.get(i).getX() && bulletlist.get(j).getX() - bulletlist.get(j).getRadius() < botbot.get(i).getX() && bulletlist.get(j).getY() + bulletlist.get(j).getRadius() > botbot.get(i).getY() && bulletlist.get(j).getY() - bulletlist.get(j).getRadius() < botbot.get(i).getY()) {
          botbot.remove(i);
          kills++;
          i--;
        }
      }
    }
    for (int i = 0; i < botbot.size(); i++) {
    if (bs.getX() + bs.getRadius()/2 > botbot.get(i).getX() && bs.getX() - bs.getRadius()/2 < botbot.get(i).getX() && bs.getY() + bs.getRadius()/2 > botbot.get(i).getY() && bs.getY() + bs.getRadius()/2 > botbot.get(i).getY()) {
        botbot.remove(i);
        i--;
        bs.damaged();
      }
    }
  }
}


  void mousePressed() {
    bs.mousePressed();
  }

  void keyPressed() {
    bs.keyPressed();
  }



