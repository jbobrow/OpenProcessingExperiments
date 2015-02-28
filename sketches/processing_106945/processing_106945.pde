
int level;
int current_level;
int score;
int speedY=1;
int levelScoreInterval=10;
float leftMargin=130;

//Background------
float Radius;
float angle;
float alpha;
float r, g, b;
ArrayList points;
//Background------

PImage shipImage; 
Enemy [] EnemyCollection = new Enemy[10];
boolean fire = false;
int fired_count=0;  //count how many being fired

void setup() { 
  size(800, 600);
  frameRate(30);

  //Background------
  background(0);
  resetBK();
  points = new ArrayList();
  //Background------

  shipImage = loadImage("spaceship.png"); 
  PImage enemyImage = loadImage("white.png"); 
  for (int i = 0; i < EnemyCollection.length; i++) {
    float x = random(leftMargin, width);
    float y = random(0, height/3);
    EnemyCollection[i] = new Enemy(enemyImage, x, y);
  }
  imageMode(CENTER);
}

void draw() {
  //start scene
  if (level==0) {
    show_initial_screen();
    if (keyPressed) {
      level=1;
      reinitialize_all();
    }
  } else if (level < 99) { //GAME ON:level n
    show_game_background();
    show_score();

    for (int i = 0; i < EnemyCollection.length; i++) {
      EnemyCollection[i].run();
    }

    image(shipImage, mouseX, 510);

    if (fire) {
      dofire(mouseX);
      fire= false;
    }
    if(score > (level*levelScoreInterval)) {
      level++;
      speedY++;
    }
    if(level != 99) current_level=level;
  } else if (level == 99) {
    show_game_over();
    if (keyPressed) { level=0; keyPressed=false;}
  }
}

//game over
void show_game_over(){
      //println("DEBUG:"+level+" I am here\n");
      fill(0);
      rectMode(CENTER);
      strokeWeight(5);
      rect(width/2, height/2+45, 400, 200);
      textAlign(CENTER);
      fill(255,0,0);
      textSize(32);
      text("GAME OVER", width/2, height/2);
      fill(255);
      textSize(20);
      text("YOU KILLED " + score +"(level="+current_level+")" + " ALIENS", width/2, height/2 + 50);
      text("Press any key to restart", width/2, height/2 + 100);
}

//point background
void show_game_background(){
    background(0);
    for (int i = 0; i < points.size(); i++) {
      Point p = (Point) points.get(i);
      p.display();
    }
    //println(frameRate);
    if (points.size() > 1296) {
      points.remove(0);
    }
    points.add(new Point(Radius, angle, alpha, r, g, b, (Radius*sin(angle) + width/2), (Radius*cos(angle) + height/2)));
    Radius++;
    angle++;
    alpha-=0.35;
    if (alpha<0) { 
      resetBK();
    }
}

//score
void  show_score() {
    fill(255);
    textSize(20);
    text("SCORE : "+score, 60, 40);
    text("LEVEL : "+current_level,55,70);
}

//start scene
void show_initial_screen(){
    background(0);
    PImage startBk;
    startBk = loadImage("bk.png");
    image(startBk, width/2, height/2); 
    textAlign(CENTER);
    textSize(55);
    text("SPACE SHOOTING GAME", width/2, height/2);
    textSize(30);
    text("Press any key to start", width/2, height/2+50);
    textSize(20);
    text("[Move your mouse to move spaceship]", width/2, height/2+100);
    textSize(20);
    text("[Click to shoot aliens]", width/2, height/2+150);
}

void reinitialize_all() {
  for (int i = 0; i < EnemyCollection.length; i++) {
     EnemyCollection[i].reinitialize();
  }
  score=0;
  current_level=level;
  speedY=1;
}

//background
void resetBK() {
  alpha=150;
  Radius=0;
  r=random(255);
  g=random(255);
  b=random(255);
  angle=random(360);
}

//shoot!!!
void dofire(float fireX) {
  boolean strike=false;
  for (int i = 0; i < EnemyCollection.length; i++) {
    if (EnemyCollection[i].amIfired(fireX)) {
      fired_count++; // count how many Enemies being fired 
      //println("HA I fire one now. "+fired_count+"("+i+")\n");
      strike=true;
    }
  }
  if (strike == false) {
    line(fireX, 510, fireX, 0); // no one fired, show the fire line only
  }
}

void mousePressed() {
  fire = true;
}

class Point {

  float Radius;
  float angle; 
  float alpha;
  float r, g, b;
  float x, y;

  Point(float _Radius, float _angle, float _alpha, float _r, float _g, float _b, float _x, float _y) {
    Radius = _Radius;
    angle = _angle;
    alpha = _alpha;
    r = _r;
    g = _g;
    b = _b;
    x = _x;
    y = _y;
  }


  void display() {
    strokeWeight(Radius/10);
    stroke(r, g, b, alpha);
    point(x, y);
  }
}

class Enemy {
  //GLOBAL VARIABLES & DATA
  float x = random(leftMargin, width);
  float y = random(0, height/3);
  PImage EnemyImage; 

  //CONSTRUCTOR
  Enemy(PImage _EnemyImage, float _x, float _y) {
    EnemyImage = _EnemyImage;
    x = _x;
    y = _y;
  }

  //FUNCTIONS
  void run() {
    display();
    move();
  }
  
    boolean amIfired(float fireX) { // if fired, return y
    if((fireX >= x-EnemyImage.width/2) && (fireX <= x+EnemyImage.width/2)) { //I am fired
      stroke(255);
      strokeWeight(3);
      line(fireX, 510, fireX, y); // the fire line to the Enemy
      score++; //score
      relive();
      return true;
    }
    return false;
  }
  
  void relive() { // if am the one fired, call me to re-live
    y=0;
    x=random(leftMargin,width);
    display();
  }

  void move() {
    y+=speedY;
    if(y > height) {  // if any touch the bottom, game over 
//      print(fired_count+" Game over\n");
      level = 99;
    }
  }
  
  void reinitialize() {
    x=random(leftMargin,width);
    y=random(0,height/3);
  }

  void display() {
    image(EnemyImage, x, y);
  }
} 



