
float score = 0;
int life = 3;
PImage tomato;
//PImage tomato2;
PImage catcher1;
PImage bg;
PImage heart;
PImage meat;
int numObjects = 3;
FallingObjects[] objects = new FallingObjects[numObjects];
float velocity = 7;
Catcher c1 = new Catcher();
boolean gameStart = false;
boolean endGame = false;
FallingObjects2 pear;
int nextLevel = 20;

void setup() {
  frameRate(30);
  ellipseMode(CENTER);
  tomato = loadImage("tomatesinvAA.gif");
  //tomato2 = loadImage("tomatesinvCC.gif");
  catcher1 = loadImage("hippo.gif");
  bg = loadImage("forestsm.png");
  heart = loadImage("heart.gif");
  meat = loadImage("meat.gif");

  size(600, 600);
  for (int i = 0; i < objects.length; i++) {
    objects[i] = new FallingObjects();
    //f1 = new FallingObjects();
  }
  pear = new FallingObjects2();

  if (gameStart) {
    //background(255);
    stroke(0);
    fill(0);
    //strokeWeight(5);
    textSize(50);
    noCursor();
  }
}    

void draw() {
  fill(0);
  image(bg, 0, 0);
  if (gameStart) {
    stroke(10);
    //fill(random(255), random(255), random(255));
    fill(0);
    textSize(60);
    text((int)(score), 50, 70);
    image(heart, 500, 20);
    textSize(45);
    text(life, 525, 67);
    increaseDifficulty();
    //c1.x = mouseX;
    c1.render();
    for (int i = 0; i < objects.length; i++) {
      objects[i].fall();
    } 
    if (score > 15) {    
      pear.fall();
    }
  }
  else {
    startupScreen();
  }
  println(velocity);
}

class Catcher {
  //float x;
  float y;
  private float radius = 20;

  Catcher() {
    //x = mouseX;
    y = 575;
  }

  void render() {
    fill(200);
    //x = mouseX;
    //ellipse(x, y, radius * 2, radius * 2);
    image(catcher1, mouseX-30, y-55);
  }    
  float getRadius() {
    return radius;
  }
}    

class FallingObjects {

  float x, y;
  private float radius = 15;

  FallingObjects() {
    x = random(width);
    y = random(-height);
  }

  void fall() {
    y = y + velocity;
    image(tomato, x-17, y-17);  

    //ellipse(r, y, radius * 2, radius * 2);     


    if (collision(x, y, radius)) {
      score++;
      x = random(width);
      y = random(-height);
    }
    else if (y>=height-25) {
      life--;
      if (life==0) {
        life = 3;
        score = 0;
        velocity = 7;
        x = random(width);
        y = random(-height);
        endGame = true;
      }  
      x = random(width);
      y = random(-height);
    }
  }
}

void increaseDifficulty() {
  if (score>= nextLevel) {
    velocity += 1;
    nextLevel += 15;
  }
}
class FallingObjects2 {

  float x, y;
  private float radius = 15;

  FallingObjects2() {
    x = random(width);
    y = random(-height);
  }
  void fall() {
    y = y + 10;
    image(meat, x-17, y-17);  

    //ellipse(r, y, radius * 2, radius * 2);     

    if (collision(x, y, radius)) {
      score = score + 3;
      x = random(width);
      y = random(-height);
    }
    else if (y>=height-25) {  
      x = random(width);
      y = random(-height);
    }
  }
}
boolean collision(float o, float p, float r) {
  float d = dist(mouseX, 550, o, p);
  if (d <= c1.getRadius() + r) {
    return true;
  }
  else {
    return false;
  }
}        

void startupScreen() {
  size(600, 600);
  fill(81, 147, 111);
  rect(150, 450, 300, 80, 7);
  textSize(60);
  fill(random(255), random(255), random(255));
  text("START", 210, 510);
  text("HUNGRY", 180, 150);
  text("HIPPO", 220, 260); 
  textSize(30);
  text("2", 450, 115);
  mousePressed();
}

void endScreen() {
}


void mousePressed() {
  if (mouseX >= 150 && mouseX <= 450 && mouseY >= 450 && mouseY <= 530) {
    fill(31, 221, 110);
    rect(150, 450, 300, 80, 7);
    textSize(60);
    fill(random(255), random(255), random(255));
    text("START", 215, 515);
    if (mousePressed == true) {
      gameStart = true;
    }
  }
}  



