
BubbleBath[] bubbles = new BubbleBath[100];
MoreBubbles[] littlebubbles = new MoreBubbles[10];
Straw st1, st2, st3, st4;
Apple a1, a2, a3; 

Gui gui;
Beetles[] beetle;
Snakes[] snake;
Frogs[] frog;
DogBones [] dbone;
Carrots [] carrot;


PShape a;//banana
PShape b;//mushroom
PShape bo; //bones
PShape e; //gameoverscreen
PShape f; //winscreen
PShape fr; //frogs
PShape str; //strawberry
PShape ap; //apples
PShape sn; // snakes
PShape bu; //bunnies
PShape bi; //bird
PShape cu; //cucumber
PShape gr; //grapes
PShape be; //beetle
PShape ca; //carrot 

PImage startscreen;
PImage img; //background to game
Animation animation1, animation2, animation3, animation4, animation5;

float xpos = 100; //character
float ypos = 100;
float bx; //map
float by;
float speed = 4; 


int boradius = 200; //bones
float bonesspeed = 0.5;

int savedTime;
int timer1 = 3000;

float x = 255;
float y = 255;

float banX = 300; //banana
float banY = 300;
float mX = 200; // mushroom
float mY = 200;
float frX = 300; //frog
float frY = 300;
float boX = 400; //bones
float boY = 400;
float buX = 400; //bunny
float buY = 440;
float snX = 100; //snakes
float snY = 400;
float apX = 100; //apples
float apY = 300;
float strX = 200; //strawberry
float strY = 330;
float beX = 100; //beetle
float beY = 100;
float biX = 200; //bird
float biY = 100;
float cuX = 100; //cucumber
float cuY = 400;
float grX = 100; //grapes
float grY = 200;
float caX = 100; //carrot
float caY = 200;


int health = 5;
int goodfood = 0;


float enemyEasing = .015;

float characterspeed = 6; 

int level = 0;


//MATH BATH TIME
float px = 110; //plus bubble
float py = 210;
float mx = 10; //mult bubble
float my = 100;
float ex = 300; // equals bubble
float ey = 110;
float angle = 0.0;
float offset = 50;
float scal = 2.0;
float spd = 0.05;
int correct = 0;
int fsX = 300; //next level
int fsY = 400;
int plX = 180; //play  again
int plY = 220;
int nextX = 180;//next Question
int nextY = 220;

int winX;//winscreen
int winY;
int goX; //gameoverscreen
int goY;
int ssX; //start screen Image
int ssY;
int nsX = 100; //next level
int nsY = 520; 



void setup() {
  size(500, 600);
  textFont(createFont("File", 50));
  PShape beetleShape = loadShape("beetle.svg");
  PShape frogShape = loadShape("frog.svg");
  PShape snakeShape = loadShape("snake.svg");
  PShape dboneShape = loadShape("bone.svg");
  PShape carrotShape = loadShape("carrot.svg");

  beetle = new Beetles[5];
  for (int i = 0; i < beetle.length; i ++) {
    float x = random(width);
    float y = random(height);
    beetle[i] = new Beetles(beetleShape, x, y);
  }
  frog = new Frogs[5];
  for (int i = 0; i < frog.length; i ++) {
    float x = random(width);
    float y = random(height);
    frog[i] = new Frogs(frogShape, x, y);
  }
  snake = new Snakes[5];
  for (int i = 0; i < snake.length; i ++) {
    float x = random(width);
    float y = random(height);
    snake[i] = new Snakes(snakeShape, x, y);
  }
  dbone = new DogBones[5];
  for (int i = 0; i < dbone.length; i ++) {
    float x = random(width);
    float y = random(height);
    dbone[i] = new DogBones(dboneShape, x, y);
  }
  carrot = new Carrots[5];
  for (int i = 0; i < carrot.length; i ++) {
    float x = random(width);
    float y = random(height);
    carrot[i] = new Carrots(carrotShape, x, y);
  }

  noStroke();
  gui = new Gui();
  startscreen = loadImage("MGstartscreenbox.png");
  savedTime = millis();
  a = loadShape("banana.svg");
  b = loadShape("mushroom.svg");
  bo = loadShape("bone.svg");

  e = loadShape("MGgameover.svg");
  f = loadShape("MGwin.svg");
  fr = loadShape("frog.svg");
  bu = loadShape("bunny.svg");
  ap = loadShape("apple.svg");
  sn = loadShape("snake.svg");
  str = loadShape("strawberry.svg");
  be = loadShape("beetle.svg");
  bi = loadShape("bird.svg");
  gr = loadShape("grapes.svg");
  cu = loadShape("cuc.svg");
  ca = loadShape("carrot.svg");



  img = loadImage("MGbg15.png");
  animation1 = new Animation("up", 2);
  animation2 = new Animation("left", 2);
  animation3 = new Animation("right", 2);
  animation4 = new Animation("down", 4);
  animation5 = new Animation("restFrame", 2);

  //MATH BATH SETUP
  for (int i = 0; i< littlebubbles.length; i++) { 
    float x = random(width);
    float y = random(height);
    int s = 200;
    int r = 30;
    littlebubbles[i] = new MoreBubbles(x, y, r, s);
  }

  for (int i = 0; i< bubbles.length; i++) { // random floating bubbles
    float x = random(width);
    float y = random(height);
    int r = i + 1;
    bubbles[i] = new BubbleBath(x, y, r);
  }
  st1 = new Straw("strawberry.svg", width - 450, 50);
  st2 = new Straw("strawberry.svg", width - 400, 50);
  st3 = new Straw("strawberry.svg", width - 350, 50);
  st4 = new Straw("strawberry.svg", width - 300, 50);
  a1 = new Apple("apple.svg", width - 450, 300);
  a2 = new Apple("apple.svg", width - 400, 300);
  a3 = new Apple("apple.svg", width - 350, 300);
}

void draw() {
  smooth();
  background(255);
  levelUp();
  println(level);
}

void banana() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    banX = random(500);
    banY = random(500);
    savedTime = millis();
  }
  shape(a, banX, banY, 40, 40);
}

void mushroom() {
  int passedTime = millis() -savedTime;
  if (passedTime > timer1) {
    mX = random(500);
    mY = random(500);
    savedTime = millis();
  }
  shape(b, mX, mY, 30, 30);
} 

void bunny() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    buX = random(500);
    buY = random(500);
    savedTime = millis();
  }
  shape(bu, buX, buY, 40, 40);
}
void strawberry() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    strX = random(500);
    strY = random(500);
    savedTime = millis();
  }
  shape(str, strX, strY, 50, 50);
}

void applest() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    apX = random(500);
    apY = random(500);
    savedTime = millis();
  }
  shape(ap, apX, apY, 50, 50);
}


void bird() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    biX = random(500);
    biY = random(500);
    savedTime = millis();
  }
  shape(bi, biX, biY, 60, 60);
}

void cuc() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    cuX = random(500);
    cuY = random(500);
    savedTime = millis();
  }
  shape(cu, cuX, cuY, 60, 60);
}

void grapes() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    grX = random(500);
    grY = random(500);
    savedTime = millis();
  }
  shape(gr, grX, grY, 60, 60);
}



void character() {
  if (keyPressed) {
    if (keyCode == UP) {
      animation1.display(xpos, ypos);
      if (by <= -3) {
        by += speed;
      }
      else {
        by = by;
        ypos -= speed;
      }
    } 
    else if (keyCode == LEFT) {
      animation2.display(xpos, ypos);
      if (bx <= -3) {
        bx += speed;
      }
      else {
        bx = bx;
        xpos -= speed;
      }
    }
    else if (keyCode == RIGHT) {
      animation3.display(xpos, ypos);
      if (bx >= -255) {
        bx -= speed;
      }
      else {
        bx = bx;
        xpos += speed;
      }
    }
    else if (keyCode == DOWN) {
      animation4.display(xpos, ypos);
      if (by >= -173) {
        by -= speed;
      }
      else {
        by = by;
        ypos += speed;
      }
    }
  }
  else {
    animation5.display(xpos, ypos);
  }
}



void eat() {
  float distBan = dist(xpos, ypos, banX, banY); //bananas
  float distMush = dist(xpos, ypos, mX, mY); //mushrooms
  float distBun = dist(xpos, ypos, buX, buY); //bunny
  float distAp = dist(xpos, ypos, apX, apY); //apples
  float distSt = dist(xpos, ypos, strX, strY); //strawberry
  float distCu = dist(xpos, ypos, cuX, cuY); //cuc
  float distBi = dist(xpos, ypos, biX, biY); //bird
  float distGr = dist(xpos, ypos, grX, grY); //grapes
  float distCa = dist(xpos, ypos, caX, caY); //grapes



  if (distBan < 50) {
    banX = random(500);
    banY = random(500);
    gui.goodfood += 1;
    
  }

  if (distMush < 20) {
    mX = random(500);
    mY = random(500);
    gui.health -= 1;
    
  }

  if (distSt < 50) {
    strX = random(500);
    strY = random(500);
    gui.goodfood += 1;
    
  }
  if (distAp < 50) {
    apX = random(500);
    apY = random(500);
    gui.goodfood += 1;
    
  }

  if (distBun < 50) {
    buX = random(500);
    buY = random(500);
    gui.health -= 1;
    
  }
  if (distGr < 30) {
    grX = random(500);
    grY = random(500);
    gui.health -= 1;
    
  }
  if (distCu < 50) {
    cuX = random(500);
    cuY = random(500);
    gui.goodfood += 1;
    
  }
  if (distCa < 50) {
    caX = random(500);
    caY = random(500);
    gui.goodfood += 1;
    
  }

  if (distBi < 50) {
    biX = random(500);
    biY = random(500);
    gui.health -= 1;
   
  }
  if (gui.health <= 0) {
    level = -1;
  }
}




void firstlevel() {
  noCursor();
  image(img, bx, by);
  banana();
  mushroom();
  character();
  eat();
  for (int i = 0; i < dbone.length; i ++) {
    dbone[i].display();
    dbone[i].eat();
  }
  for (int i = 0; i < frog.length; i ++) {
    frog[i].update();
    frog[i].display();
    frog[i].eat();
  }
  gui.levelGui();
}


void secondlevel() {
  noCursor();
  image(img, bx, by);
  bunny();
  applest();
  strawberry();
  character();
  eat();
  for (int i = 0; i < dbone.length; i ++) {
    dbone[i].display();
    dbone[i].eat();
  }
  for (int i = 0; i < snake.length; i ++) {
    snake[i].update();
    snake[i].display();
    snake[i].eat();
  }
  gui.levelGui();
}

void thirdlevel() {
  noCursor();
  image(img, bx, by);
  cuc();
  bird();
  grapes();
  character();
  eat();
  for (int i = 0; i < beetle.length; i ++) {
    beetle[i].update();
    beetle[i].display();
    beetle[i].eat();
  }
  for (int i = 0; i < carrot.length; i ++) {
    carrot[i].display();
    carrot[i].eat();
  }
  gui.levelGui();
} 



void levelUp() {

  if (level == 0) {
    gui.startMenu();
  }
  if (level == 1) {
    firstlevel();
  }
  if (level == -1) {
    gui.gameOver();
  }

  if (level == 2) {
    secondlevel();
  }

  if (level == 3) {
    thirdlevel();
  }

  if (gui.goodfood == 6) {
    level = 2;
  }
  if (gui.goodfood == 11) {
    level = 3;
  }
  if (gui.goodfood >= 20) {
    gui.win();
  }
  if (level == 5) {
    MathBathLevelOne();
  }

  if (level == 6) {
    MathBathLevelTwo();
  }
  if (correct == 2) {
    level = 7;
  }
  
  if (level == 7) {
    winMathBath();
    
  }
}

//MATH BATH TIME
void eye( int x, int y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(255); //backofeye
  ellipse(120, 120, 130, 110);
  fill(0); // pupil
  ellipse(120, 120, 100, 100);
  fill(#46390F); // brown eye
  ellipse(120, 120, 85, 85);
  fill(0); // black outline
  ellipse(120, 120, 25, 25);
  fill(255); // reflection
  ellipse(130, 104, 11, 20);
  popMatrix();
}

void face( int x, int y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(#90753F); //brown face
  ellipse(80, 100, 500, 500);
  fill(#342A16); //  left ear
  ellipse(-130, -20, 200, 100);
  fill(#342A16); // right ear
  ellipse(300, -20, 200, 100);
  fill(#342A16); //  left ear bottom
  ellipse(-198, 5, 80, 110);
  fill(#342A16); // right ear bottom
  ellipse(365, 0, 80, 110);
  fill(#342A16);
  ellipse(90, 250, 230, 330);
  popMatrix();
}

void bubbleB( int x, int y, int p, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  stroke(p); //pink value
  stroke(#FF93F1);
  strokeWeight(2);
  fill(#FFD8FA);
  ellipse( 0, 0, 50, 50);
  noStroke();
  popMatrix();
}

void MathBathLevelOne() {
  int level = 5;

  background(#D9D8FF);
  fill(#FFD8FA); //number bubbles
  strokeWeight(2);
  stroke(#FF93F1);
  for (int i = 0; i < littlebubbles.length; i++) {
    littlebubbles[i].move();
    littlebubbles[i].display();
  }

  fill(#FFD8FA); //pink bubbles floating
  stroke(#FF93F1);
  strokeWeight(2);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].move();
    bubbles[i].display();
  }

  randomSeed(0); //bubbles across the bottome

  for ( int i = 200; i < width + 200; i += 100) {
    int pink = int(random(0, 200));
    float scalar = random(0.25, 1.0);
    bubbleB(i, 590, pink, scalar);
  }
  for ( int i = 200; i < width + 200; i += 100) {
    int pink = int(random(0, 200));
    float scalar = random(0.25, 1.0);
    bubbleB(i, 590, pink, scalar);
  }

  face(210, 340);
  faceEyeRotation();

  noStroke(); // if pressed circle
  if (mousePressed == true) { // random yellow circle
    stroke(0);
  }

  st1.display(); //display strawberries
  st2.display();
  st3.display();
  st4.display();
  equalBubble(); //equal sign

  answerbubbleQ1(); //answer bubble

  fill(#EDFF00); //yellow sponge
  stroke(#F8FCBA);
  strokeWeight(10);
  strokeJoin(ROUND);
  rect(mouseX, mouseY, 75, 75);
  textSize(20);
  fill(0);
  text("HOW MANY ARE THERE?(press a number)", mouseX + 10, mouseY + 10);

  fill(0);
  textSize(20);
  text("IT'S MATH BATH TIME:!", 50, 10);

  mathbathgui();
}

void MathBathLevelTwo() {
  int level = 6;
  background(#D9D8FF);
  fill(#FFD8FA); //number bubbles
  strokeWeight(2);
  stroke(#FF93F1);
  for (int i = 0; i < littlebubbles.length; i++) {
    littlebubbles[i].move();
    littlebubbles[i].display();
  }

  fill(#FFD8FA); //pink bubbles floating
  stroke(#FF93F1);
  strokeWeight(2);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].move();
    bubbles[i].display();
  }

  randomSeed(0); //bubbles across the bottome

  for ( int i = 200; i < width + 200; i += 100) {
    int pink = int(random(0, 200));
    float scalar = random(0.25, 1.0);
    bubbleB(i, 590, pink, scalar);
  }

  face(210, 340);
  faceEyeRotation();

  noStroke(); // if pressed circle
  if (mousePressed == true) { // random yellow circle
    stroke(0);
  }

  st1.display();
  st2.display();
  st3.display();
  st4.display();
  a1.display();
  a2.display();
  a3.display();

  answerbubbleQ2();

  plusBubble();
  //multBubble();
  equalBubble();

  fill(#EDFF00); //yellow sponge
  stroke(#F8FCBA);
  strokeWeight(10);
  strokeJoin(ROUND);
  rect(mouseX, mouseY, 75, 75);
  textSize(20);
  fill(0);
  text("HOW MANY ARE THERE?(press a number)", mouseX + 10, mouseY + 10);

  fill(0);
  textSize(20);
  text("IT'S MATH BATH TIME:!", 50, 10);

  mathbathgui();
}



void mathbathgui() {
  textSize(20);
  fill(#8B199B);
  text("Correct = " + correct, 300, 10);
}

void plusBubble() { 
  fill(255);
  ellipse(px, py, 75, 75);
  textSize(75);
  fill(0);
  text("+", px-35, py-50);
}

void multBubble() {
  fill(255);
  ellipse(mx, my, 100, 100);
  textSize(75);
  fill(0);
  text("X", mx, my);
}

void equalBubble() { 
  fill(255);
  ellipse(ex, ey, 75, 75);
  textSize(75);
  fill(0);
  text("=", ex-35, ey-50);
}

void winMathBath() {
  background(#2C6F23);
  face(210, 340);
  faceEyeRotation();
  fill(0);
  textSize(100);
  text("YOU WIN!", 20, 50);
  textSize(40);
  text("PLAY AGAIN", plX, plY);
  float nextpStart = dist(mouseX, mouseY, plX, plY);
  if (mousePressed && nextpStart <= 100) {
    correct = 0;
    gui.goodfood = 0;
    gui.health = 5;
    level = 1;
  }
}

void faceEyeRotation() {
  float x = offset + cos(angle) * scal + 50; // begin left eye rotation
  float y = offset + sin(angle) * scal + 400;  
  fill(255); //backofeye
  ellipse(x, y, 130, 110);
  fill(0); // pupil
  ellipse(x, y, 100, 100);
  fill(#46390F); // brown eye
  ellipse(x, y, 85, 85);
  fill(0); // black outline
  ellipse(x, y, 25, 25);
  fill(255); // reflection
  ellipse(x+ 12, y-10, 11, 20);
  angle += spd;

  float x1 = offset + cos(angle) * scal + 330; //right eye rotation
  float y1 = offset + sin(angle) * scal + 400;
  fill(255); //backofeye
  ellipse(x1 + 100, y1, 130, 110);
  fill(0); // pupil
  ellipse(x1 + 100, y1, 100, 100);
  fill(#46390F); // brown eye
  ellipse(x1 + 100, y1, 85, 85);
  fill(0); // black outline
  ellipse(x1 + 100, y1, 25, 25);
  fill(255); // reflection
  ellipse(x1 + 112, y1 - 10, 11, 20);
  angle += spd;
  //  eye(120, 330);
  //  eye(430, 330);
  fill(0); // black nose
  arc(300, 500, 110, 110, PI, TWO_PI);
  stroke(0);
  strokeWeight(5);
  line(300, 500, 300, 570); //nose line
  fill(#342A16); //mouth
  ellipse(300, 600, 90, 90); //mouth
}


void answerbubbleQ1() {

  fill(255);
  ellipse(400, 100, 100, 100); // circle(pressed)
  fill(0);
  textSize(60);
  text(key, 380, 75);
  if (key == '4') {
    stroke(128);
    fill(255);
    ellipse(400, 100, 100, 100);
    textSize(18);
    fill(0);
    text("CORRECT!", 360, 90); //correct!
    correct = 1;
    textSize(30);
    fill(#FCBFD7);
    text("NEXT QUESTION?", 180, 260);
    text("CLICK HERE", nextX, nextY);
    float next = dist(mouseX, mouseY, nextX, nextY);
    if (mousePressed && next <= 100) {
      level = 6;
       }
    } 
    
}

void answerbubbleQ2() {
  fill(255);
  ellipse(400, 100, 100, 100); // circle(pressed)
  fill(0);
  textSize(60);
  text(key, 380, 75);
  if (key == '7') {
    stroke(128);
    fill(255);
    ellipse(400, 100, 100, 100);
    textSize(18);
    fill(0);
    text("CORRECT!", 370, 100); //correct! 
    correct = 2;
    
  }
}







class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, 50, 50);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
class Apple {
  PShape a;
  float axpos;
  float aypos;
  
  
  Apple(String svgName, float tempX, float tempY) {
    a = loadShape("apple.svg");
    axpos = tempX;
    aypos = tempY;
  }
  
  void display() {
    shape(a, axpos, aypos, 100, 100);

}
}
class Beetles { 
  float bxpos;
  float bypos;
  float angle;
  PShape beetleShape;
  float yoffset = 0.0;

  //Set initial values in constructor
  Beetles (PShape shape, float tempX, float tempY) {
    beetleShape = shape;
    bxpos = tempX;
    bypos = tempY;
    angle = random(0, TWO_PI);
  }
  // Update the fields
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  //Draw to the screen
  void display() {
    shape(beetleShape, bxpos, bypos + yoffset);
  }

  void eat () {
    float distBeetles = dist(xpos, ypos, bxpos, bypos); //beetle array
    if (distBeetles < 50) {
      bxpos = random(500);
      bypos = random(500);
      gui.health -= 1;
    }
  }
}


class BubbleBath {
  float x;
  float y;
  int diameter;
  float speed = 0.5;
  
  BubbleBath(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter= tempDiameter;
  }
  
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
  
  
}

class Carrots { 
  float cxpos;
  float cypos;
 
  PShape carrotShape;
  
  int cradius = 200; //bones
  float cspeed = 0.5;

  //Set initial values in constructor
  Carrots (PShape shape, float tempX, float tempY) {
    carrotShape = shape;
    cxpos = tempX;
    cypos = tempY;
    
  }
  

  //Draw to the screen
  void display() {
    cxpos += cspeed;
  if (cxpos >width + cradius) {
      cxpos = -cradius;
    }
  shape(carrotShape, cxpos, cradius, 40, 40);
  }

  void eat () {
    float distC = dist(xpos, ypos, cxpos, cradius); //beetle array
    if (distC < 50) {
      cxpos = random(500);
      cradius = int(random(500));
      gui.goodfood += 1;
      
    }
  }
}
class DogBones { 
  float dbxpos;
  float dbypos;
 
  PShape dboneShape;
  
  int dbradius = 200; //bones
  float dbspeed = 0.5;

  //Set initial values in constructor
  DogBones (PShape shape, float tempX, float tempY) {
    dboneShape = shape;
    dbxpos = tempX;
    dbypos = tempY;
    
  }
  

  //Draw to the screen
  void display() {
    dbxpos += dbspeed;
  if (dbxpos >width + dbradius) {
      dbxpos = -dbradius;
    }
  shape(dboneShape, dbxpos, dbradius, 50, 50);
  }

  void eat () {
    float distDB = dist(xpos, ypos, dbxpos, dbradius); //beetle array
    if (distDB < 50) {
      dbxpos = random(500);
      dbradius = int(random(500));
      gui.goodfood += 1;
      
    }
  }
}
class Frogs { 
  float frxpos;
  float frypos;
  float angle;
  PShape frogShape;
  float yoffset = 0.0;

  //Set initial values in constructor
  Frogs (PShape shape, float tempX, float tempY) {
    frogShape = shape;
    frxpos = tempX;
    frypos = tempY;
    angle = random(0, TWO_PI);
  }
  // Update the fields
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  //Draw to the screen
  void display() {
    shape(frogShape, frxpos, frypos + yoffset);
  }

  void eat () {
    float distFrog = dist(xpos, ypos, frxpos, frypos); //beetle array
    if (distFrog < 50) {
      frxpos = random(500);
      frypos = random(500);
      gui.health -= 1;
      
    }
  }
}
class Gui {
  float sX = 195; //press start
  float sY = 520;
  float tryX = 200; //try again
  float tryY = 375;
  int goodfood = 0;
  int health = 5;
  int levelValue;
  int ssX; //start screen Image
  int ssY;

  

  Gui() {
  }

  void startMenu() {
    cursor();
    
    image(startscreen, ssX, ssY);
    textSize(18);
    text("Click Start", 30, 560);
    text("Press ◀▲▼▶ on the keyboard to move Monkey", 30, 580);
    fill(0);
    textSize(50);
    strokeWeight(2);
    textSize(30);
    text("START", sX, sY);
    float pStart = dist(mouseX, mouseY, sX, sY);
    if (mousePressed && pStart <= 100) {
      gui.health = 5;
      gui.goodfood = 0;
      level = 1;
      gui.levelValue = 1;
    }
  }
 
  void levelGui() {
    textSize(20);
    textAlign(LEFT, TOP);
    fill(#C6343E);
    text("DANGER = " + health, 30, 30);
    fill(#57DE77);
    text("GOODFOOD= " + goodfood, 30, 60);
    
    if (health <= 0) {
      level = -1;
    }
  }


  void win() {
  cursor();
  
  level = 11;
  shape(f, winX, winY, 500, 600);
  fill(0);
  textSize(30);
  text("YOU WIN!", 50, 25);
  textSize(18);
  text("Thanks for the bee costume!", 50, 100);
  textSize(20);
  text("LET'S TAKE A MATH BATH", 100, 500);
  fill(0);
  text("CLICK HERE", nsX, nsY);
  float nextpStart = dist(mouseX, mouseY, nsX, nsY);
  if (mousePressed && nextpStart <= 100) {
    goodfood = 0;
    correct = 0;
    level = 5;
  }
  
}

  void gameOver() {
    cursor();
    
    shape(e, goX, goY, 500, 600);
    fill(0);
    textSize(30);
    text("GAME OVER", 100, 25);
    textSize(40);
    text("OUCH!", 200, 250);
    textSize(25);
    text("My tummy hurts!", 200, 300);
    textSize(40);
    text("TRY AGAIN", tryX, tryY);
    float tryAgain = dist(mouseX, mouseY, tryX, tryY);
    if (mousePressed && tryAgain <= 100) {
      gui.health = 5;
      gui.goodfood = 0;
      gui.levelValue = 1;
      level = 1;
    }
  }
}

class MoreBubbles {
  float x;
  float y;
  int diameter;
  float speed = 0.5;
  
  MoreBubbles(float tempX, float tempY, int tempDiameter, float tempSpeed) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speed = tempSpeed;
  }
  
  void move() {
    x += 0;
    y += -1.2;
  }
  
  void display() {
    ellipse(x+10, y, diameter, diameter);
    
  }
  
  
}
class Snakes { 
  float snxpos;
  float snypos;
  float angle;
  PShape snakeShape;
  float yoffset = 0.0;

  //Set initial values in constructor
  Snakes (PShape shape, float tempX, float tempY) {
    snakeShape = shape;
    snxpos = tempX;
    snypos = tempY;
    angle = random(0, TWO_PI);
  }
  // Update the fields
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  //Draw to the screen
  void display() {
    shape(snakeShape, snxpos, snypos + yoffset);
  }

  void eat () {
    float distSn = dist(xpos, ypos, snxpos, snypos); //beetle array
    if (distSn < 50) {
      snxpos = random(500);
      snypos = random(500);
      gui.health -= 1;
      
    }
  }
}
class Straw {
  PShape s;
  float sxpos;
  float sypos;
  
  
  Straw(String svgName, float tempX, float tempY) {
    s = loadShape("strawberry.svg");
    sxpos = tempX;
    sypos = tempY;
  }
  
  void display() {
    shape(s, sxpos, sypos, 100, 100);

}
}


