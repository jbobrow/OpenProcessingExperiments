
//startM
float sX = 240;
float sY = 400;
float eX = 400;
float eY = 510;
PImage neko;
//player
float pX;
float pY;
//GUI
int lifeValue = 50;
//easing for cats
float easing = .02;
//cat x and y
float cX = 10;
float cY = 10;
PImage cha;
PImage GO;
//cutscene
float cXY= 400;

//timer 
int last = 0;
int m = 0;
int last1 = 0;
int m1 = 0;

//cat2
Cat cat1;
Cat cat2;
Cat cat3;
Cat cat4;
Cat cat5;

int level = 0;




void setup() {
  size(800, 600);
  frameRate(60);
  textFont(createFont("Langdon", 50));
  noStroke();
  neko = loadImage("neko.jpg");
  cha = loadImage("cha.jpg");
  GO = loadImage("GO.gif");
  

    //level2
  cat1 = new Cat(20);
  cat2 = new Cat(20);
  cat3 = new Cat(20);
  cat4 = new Cat(20);
  cat5 = new Cat(20);
  
}



void draw() {
  smooth();
  background(255);
  levelUp();
}

void level1() {
  //level 1
  player();
  gui();
  cat();
  Chasing();
  timer();
}

void level2() {
  //level 1
  player();
  gui();
  cat();
  Chasing();
  timer1();


    cat1.move();
  cat2.move();
  cat3.move();
  cat4.move();
  cat5.move();
  cat1.display();
  cat2.display();
  cat3.display();
  cat4.display();
  cat5.display();
}



void startMenu() {
  //startMenu
  image(neko, 0, 0, 800, 600);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(55);
  fill(0, 102, 153);
  text("START", sX, sY);
    textSize(15);
    fill(#FF0505);
  text("(read the describtion below ",sX, sY+30);
    text("before you start the game)",sX, sY+50);
  float pStart = dist(mouseX, mouseY, sX, sY);
  if (mousePressed && pStart <= 80) {
    level = 1;
      lifeValue = 50;
      m = 1;
    
  }
}


void player() {
  pX = mouseX;
  pY = mouseY;
  fill(#FF0808);
  ellipse(pX, pY, 20, 20);
}



void levelUp() {
  //checking for level
  if (level == 0) {
    startMenu();
  }
  if (level == 1) {
    level1();
  }
  if (level == 15) {
    cutscene();
  }
  if (level == 2) {
    level2();
  }
  if (level == -1) {
    gameOver();
  }
}



void gui() {
  //in game info
  textSize(20);
  textAlign(LEFT, TOP);
  fill(0);
  text("LIFE = " + lifeValue, 20, 30);
}




void cat() {
  //movement and creation of enemy characters
  float targetX = pX;
  float targetY = pY;
  cX += (targetX - cX) * easing;
  cY += (targetY - cY) * easing;
  image(cha, cX, cY, 80, 80);
}

void Chasing(){
  //distance between player and cats
    float distC = dist(pX,pY,cX,cY);
    if(distC < 30){
      lifeValue -= 1;
    }
      if(lifeValue <= 0){
    level = -1;
      }
}
void timer1() {
m1 ++;
  if(m1 >= 999999999){
      m1=0;
    lifeValue = 50;
    level = 15;
  }
  textSize(20);
  fill(#050505);
  text("timer=", 25, 100, 255);
  text(m1 / 60, 100, 100);

}
  
  
void timer() {
m ++;
  if(m >= 600){
      m=0;
    lifeValue = 50;
    level = 15;
  }
  textSize(20);
  fill(#050505);
  text("timer=", 25, 100, 255);
  text(m / 60 , 100, 100);

}

void cutscene() {
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(25);
  fill(#050505);
  text("Well...that was boring", 400, 200);
  textSize(30);
  text("Need more challenge?", 400, 230);
  textSize( 65);
  text("here you go!", 400, 270);
  textSize(25);
  text("start level 2 here...", cXY, cXY);
  float pStart = dist(mouseX, mouseY, cXY, cXY);
  if (mousePressed && pStart <= 100) {
    level = 2;
  }
}

void gameOver(){
  //gameOver screen
  image(GO, 300, 300, 200, 200);
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(0);
  text("GAME OVER", 400, 200);
  textSize(40);
  text("SUCKER", 400, 250);
  textSize(30);
  text("Again?", eX, eY);
    fill(#FA0505);
      textSize(50);
  text("click here", eX, eY+50);
  float pStart = dist(mouseX, mouseY, eX, eY + 50);
  if (mousePressed && pStart <= 80) {
    lifeValue = 80;
    level = 0;
  }
}


class Cat {

  float r;   // radius
  float x, y; // location
  float xspeed, yspeed; // speed

    // Constructor
  Cat(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 20, 20);
    yspeed = random( - 20, 20);
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }

  // Draw the ball
  void display() {
    stroke(0);
    fill(0, 50);

    float distC = dist(pX, pY, x, y);
    if (distC < 30) {
      lifeValue -= 4;
    }
    if (lifeValue <= 0) {
      level = -1;
    }
    image(cha, x, y, r*2, r*2);
  }
}



