
// Sam Legros, Final Project, RTA 222

PImage[] playerFrames = new PImage[9];
PImage fastCarRight;
PImage fastCarLeft;
PImage slowCarRight;
PImage slowCarLeft;
PImage bikeRight;
PImage bikeLeft;

PImage title;
PImage titleMan;
PImage titleCar1;
PImage titleCar2;
PImage titleCar3;
PImage street;

PImage ending;

Player dude;

ArrayList<Car> cars = new ArrayList(); 
ArrayList<Car2> cars2 = new ArrayList();
ArrayList<Car3> cars3 = new ArrayList();
ArrayList<Car4> cars4 = new ArrayList();
ArrayList<Car5> cars5 = new ArrayList();
ArrayList<Car6> cars6 = new ArrayList();

boolean test = false;

int INTRO = 1; 
int RUN_GAME = 2; 
int GAME_OVER = 3; 

int gameState = INTRO;   

PFont titleFont; 
PFont subtitleFont;

int score; 

void setup() {
  size(800, 600);
  imageMode(CENTER);
  noCursor();

  ending = loadImage("ending.png");
  subtitleFont = createFont("PressStartK", 48);

  for (int i=0; i < playerFrames.length; i++) {
    String filename = "player-" + i + ".png";
    playerFrames[i] = loadImage(filename);
    println("Loading " + filename);
  }

  String filename = "fastcarright.png";
  fastCarRight = loadImage(filename);
  println("Loading " + filename);

  String filename2 = "fastcarleft.png";
  fastCarLeft = loadImage(filename2);
  println("Loading " + filename2);

  String filename3 = "slowcarright.png";
  slowCarRight = loadImage(filename3);
  println("Loading " + filename3);

  String filename4 = "slowcarleft.png";
  slowCarLeft = loadImage(filename4);
  println("Loading " + filename4);

  String filename5 = "bikeright.png";
  bikeRight = loadImage(filename5);
  println("Loading " + filename5);

  String filename6 = "bikeleft.png";
  bikeLeft = loadImage(filename6);
  println("Loading " + filename6);

  dude = new Player();
}

/////////////////////////////////////////////////////////////////////
void draw() {
  if (gameState == INTRO) intro();
  if (gameState == RUN_GAME) run_game(); 
  if (gameState == GAME_OVER) game_over();
}

//////////////////////////////////////////////////////////////////////
void mousePressed() {
  if (gameState == GAME_OVER || gameState == INTRO) {
    gameState = RUN_GAME;
    score = 0; 
    cars.clear();
    cars2.clear();
    cars3.clear();
    cars4.clear();
    cars5.clear();
    cars6.clear();
  }
}

//////////////////////////////////////////////////////////////////////
void intro() {
  background(255); 
  fill(255);
  textAlign(CENTER);

  title = loadImage("title.png");
  image(title, width/2, height/4);

  textFont(subtitleFont); 
  fill(0);
  textSize(18);
  text("CLICK ANYWHERE TO START", width/2, height/2);

  textSize(15);
  fill(150);
  text("SAM LEGROS\n2014", width/2, height-50);

  textSize(10);
  fill(150);
  text("crap, crap, crap...", width-120, height-240);

  noStroke();
  fill(64);
  rect(0, height-200, width, 100);

  street = loadImage("street.png");
  image(street, width/2, height-150);

  titleMan = loadImage("man.png");
  image(titleMan, width-150, height-180);

  titleCar1 = loadImage("fastcarright.png");
  image(titleCar1, width-460, height-140);

  titleCar2 = loadImage("slowcarright.png");
  image(titleCar2, width-650, height-180);

  titleCar3 = loadImage("bikeright.png");
  image(titleCar3, width-530, height-210);
}

//////////////////////////////////////////////////////////////////////
void game_over() {
  background(255); 
  rectMode(CENTER);

  dude.display(); 
  for (Car z : cars) z.display();
  for (Car2 z : cars2) z.display();
  for (Car3 z : cars3) z.display();
  for (Car4 z : cars4) z.display();
  for (Car5 z : cars5) z.display();
  for (Car6 z : cars6) z.display();

  tint(255, 127);
  image(ending, width/2, height/2);

  drawScore();
}

//////////////////////////////////////////////////////////////////////
void run_game() {
  noCursor();
  background(64);
  noTint();  

  street = loadImage("street.png");
  image(street, width/2, height/2);

  dude.move();
  dude.display();

  for (Car z : cars) {
    z.move();
    z.display();    
    if ( collision(z, dude) == true) {
      gameState = GAME_OVER;
    }
  }

  for (Car2 z : cars2) {
    z.move();
    z.display();    
    if ( collision2(z, dude) == true) {
      gameState = GAME_OVER;
    }
  }

  for (Car3 z : cars3) {
    z.move();
    z.display();    
    if ( collision3(z, dude) == true) {
      gameState = GAME_OVER;
    }
  }

  for (Car4 z : cars4) {
    z.move();
    z.display();    
    if ( collision4(z, dude) == true) {
      gameState = GAME_OVER;
    }
  }

  for (Car5 z : cars5) {
    z.move();
    z.display();    
    if ( collision5(z, dude) == true) {
      gameState = GAME_OVER;
    }
  }

  for (Car6 z : cars6) {
    z.move();
    z.display();    
    if ( collision6(z, dude) == true) {
      gameState = GAME_OVER;
    }
  }

  drawScore(); 
  score++;

  if (score % 50 == 0) cars.add( new Car() );
  if (score % 75 == 0) cars2.add( new Car2() );
  if (score % 100 == 0) cars3.add( new Car3() );
  if (score % 125 == 0) cars4.add( new Car4() );
  if (score % 150 == 0) cars5.add( new Car5() );
  if (score % 150 == 0) cars6.add( new Car6() );
  if (score % 500 == 0) {
    cars.add( new Car());
    cars2.add( new Car2());
    cars3.add( new Car3());
    cars4.add( new Car4());
    cars5.add( new Car5());
    cars6.add( new Car6());
  }
}

//////////////////////////////////////////////////////////////////////
boolean collision(Car z, Player dude) {
  float d = dist(dude.x, dude.y, z.x, z.y); 
  if ( d < dude.radius + z.radius) {    
    return true;
  }
  return false;
}

boolean collision2(Car2 z, Player dude) {
  float d = dist(dude.x, dude.y, z.x, z.y); 
  if ( d < dude.radius + z.radius) {    
    return true;
  }
  return false;
}

boolean collision3(Car3 z, Player dude) {
  float d = dist(dude.x, dude.y, z.x, z.y); 
  if ( d < dude.radius + z.radius) {    
    return true;
  }
  return false;
}

boolean collision4(Car4 z, Player dude) {
  float d = dist(dude.x, dude.y, z.x, z.y); 
  if ( d < dude.radius + z.radius) {    
    return true;
  }
  return false;
}

boolean collision5(Car5 z, Player dude) {
  float d = dist(dude.x, dude.y, z.x, z.y); 
  if ( d < dude.radius + z.radius) {    
    return true;
  }
  return false;
}

boolean collision6(Car6 z, Player dude) {
  float d = dist(dude.x, dude.y, z.x, z.y); 
  if ( d < dude.radius + z.radius) {    
    return true;
  }
  return false;
}

//////////////////////////////////////////////////////////////////////
void drawScore() {
  textFont(subtitleFont);
  textAlign(LEFT); 
  fill(255); 
  textSize(24);
  text(score, 5, 25);
}

class Car {
  float x;
  float y;  
  float speedX;
  float radius;

  Car() {
    speedX = 7;
    x = -10;
    y = random(50, height/2-30);

    radius = 30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(fastCarRight, 0, 0);   

    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x += speedX;
    x = x++;
  }
}

class Car2 {
  float x;
  float y;  
  float speedX;
  float radius;

  Car2() {
    speedX = 7;
    x = width+10;
    y = random(height/2+30, height-20);

    radius = 30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(fastCarLeft, 0, 0);   

    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x -= speedX;
    x = x--;
  }
}

class Car3 {
  float x;
  float y;  
  float speedX;
  float radius;

  Car3() {
    speedX = 5;
    x = -10;
    y = random(50, height/2-30);

    radius = 30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(slowCarRight, 0, 0);   

    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x += speedX;
    x = x++;
  }
}

class Car4 {
  float x;
  float y;  
  float speedX;
  float radius;

  Car4() {
    speedX = 5;
    x = width+10;
    y = random(height/2+30, height-20);

    radius = 30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(slowCarLeft, 0, 0);   

    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x -= speedX;
    x = x--;
  }
}

class Car5 {
  float x;
  float y;  
  float speedX;
  float radius;

  Car5() {
    speedX = 10;
    x = -10;
    y = random(50, height/2-30);

    radius = 30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(bikeRight, 0, 0);   

    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x += speedX;
    x = x++;
  }
}

class Car6 {
  float x;
  float y;  
  float speedX;
  float radius;

  Car6() {
    speedX = 10;
    x = width+10;
    y = random(height/2+30, height-20);

    radius = 30;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(bikeLeft, 0, 0);   

    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x -= speedX;
    x = x--;
  }
}

class Player {

  float x;
  float y;    
  float radius;
  int frame;
  int flip = 1;

  Player() {
    radius = 40;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    scale(flip, 1); 
    image(playerFrames[frame], 0, 0);

    if (test == true) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }

    popMatrix();
  }

  void move() {
    x = mouseX;
    y = mouseY; 
    if (mouseX > pmouseX) flip = 1;
    if (mouseX < pmouseX) flip = -1;
    if (frameCount % 2 == 0) frame++;
    if (frame >= playerFrames.length) frame = 0;
  }
}


