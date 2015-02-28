
PImage background;
PGraphics ast;
PVector startLoc = new PVector(250, 250);
float radius = 25;
boolean clicked;
Asteroid a;
ArrayList<Asteroid> alist;
PImage spaceship;
int actualTime;
int start = 0;
int timeOnScreen;
boolean isColliding;
float asteroidRadius = 10;
boolean gameState;

void setup() {
  
  size(500, 500);
  alist = new ArrayList<Asteroid>();
  gameState = false;
  isColliding = false;
  background = loadImage("outer-space-stars.jpeg");
  spaceship = loadImage("p-trans.gif");
  a = new Asteroid();
  imageMode(CENTER);
  clicked = false;
  actualTime = 0;
} //end of setup


void draw() {  
  actualTime = millis();
  timeOnScreen = actualTime - start;
  
  if (gameState == false) {
    image(background, width/2, height/2, 500, 500);
    textSize(24);
    fill(255);
    text("Dodge The Asteroids!", 125, 40);
    fill(125);
    //println(mouseX+","+mouseY);

    if (clicked) {  
      timeOnScreen = actualTime - start;    
      noCursor();
      int seconds = (int)(timeOnScreen/1000);
      int hunds = timeOnScreen%1000/10;
      fill(255);
      text(seconds+"."+hunds, 400, 50); 

      for (int i = alist.size()-1; i>=0 ; i--) {        
        if (dist(mouseX, mouseY, alist.get(i).loc.x, alist.get(i).loc.y) <= asteroidRadius+20) {
          
          cursor(HAND);
          gameState = true;
          background(0);
          textSize(24);
          fill(255);
          text("Press r to restart", 175, 200);
          fill(255, 0, 0);
          textSize(14);
          text("You lived for this many seconds : " + seconds+"."+hunds, 150, 50);  
          //noLoop();
        }
      } 
      fill(255, 0, 0);
      image(spaceship, mouseX, mouseY, 75, 75);
      fill(100, 100, 100);
      a.display();
    }

    else {
      image(spaceship, 250, 250, 70, 70);
      //ellipse(startLoc.x, startLoc.y, radius*2, radius*2);
    }
    if (alist.size() < 500) {
      alist.add(new Asteroid());
    }
    for (Asteroid b : alist) {
      b.display();
    }
  }
} //end of draw

void keyPressed() {

  if (gameState == true) {
    if (key == 'r') { 
      gameState = false;
      setup();
      start = actualTime;
      //draw();

      // println(gameState);
    }
  }
}

void mouseClicked() {
  if (clickOnStart(startLoc)) {
    clicked = true;
    start = timeOnScreen;
    
  } 
  else {
    clicked = false;
  }
}

boolean clickOnStart(PVector start) {
  PVector loc = new PVector(mouseX, mouseY);
  float diff = loc.dist(start);
  if (diff <= radius) {
    return true;
  }
  return false;
}
/*void isGameOn() {
 if (clicked) {
 ast = createGraphics(75, 75);
 ast.beginDraw();
 }
 }*/

class Asteroid {

  PVector loc = new PVector(random(-500, width+500), random(-500, height+500));
  float tempX = loc.x;
  float tempY = loc.y;

  public Asteroid() { 

    if (loc.x >= 0 && loc.x <= width && loc.y >= height) { // going up   300,600
      loc.y = random(height, height+100000000);
    }  
    else if (loc.x >= width && loc.y >= 0 && loc.y <= height) { // going left   600,300
      loc.x = random(width, width+100000000);
    } 
    else if (loc.x >= width && loc.y <= 0) { // going southwest  600,-10
      loc.x = random(width, width+100000000);
      loc.y = random(-height, 0);
    } 
    else if (loc.x >= width && loc.y >= height) { //going northwest  600,600
      loc.x = random(-width, 0);
      loc.y = random(height, height+100000000);
    } 
    else if (loc.x >= 0 && loc.x <= width && loc.y <= 0) { // going down  300, -10
      loc.y = random(-height, 0);
    } 
    else if (loc.x >= 0 && loc.x <= width && loc.y >= 0 && loc.y <= height) { // in the middle of screen  300,300
      loc.x = random(-height, 0);
    }
    else if (loc.x <= 0 && loc.y >= 0 && loc.y <= height) { // going right
      loc.x = random(-width, 0);
    } 
    else if ( loc.x<=0 && loc.y <= 0) { //going southeast
      loc.x=random(-width, 0);
      loc.y=random(-height, 0);
    } 
    else if ( loc.x <=0 && loc.y <= height) { //going northeast
      loc.x = random(width, width+100000000);
      loc.y= random(height, height+100000000);
    }
  }
  /*
  void checkCollision() { 
   if (dist(mouseX, mouseY, loc.x, loc.y) <= asteroidRadius) {
   isColliding = true;
   }
   */


  void display() {
    if (clicked) {
      fill(random(255), random(255), random(255));
      ellipse(loc.x, loc.y, asteroidRadius*2, asteroidRadius*2);
      move();
    }
  }

  void move() { //x ------ y |||||

    if (tempX >= 0 && tempX <= width && tempY >= height) { //going up 
      loc.y-=random(0.1, 5);
    } 
    else if (tempX >= width && tempY >= 0 && tempY <= height ) { //going left
      loc.x-=random(0.1, 5);
    } 
    else if (tempX >= width && tempY <= 0) { //going southwest
      loc.x-=random(0.1, 5);
      loc.y+=random(0.1, 5);
    } 
    else if (tempX >= width && tempY >= height) { //going northwest
      loc.x-=random(0.1, 5);
      loc.y-=random(0.1, 5);
    } 
    else if (tempX >= 0 && tempX <= width && tempY <= 0) { // going down
      loc.y+=random(0.1, 5);
    } 
    else if (tempX <= 0 && tempY >= 0 && tempY <= height) { //going right
      loc.x+=random(0.1, 5);
    } 
    else if (tempX<=0 && tempY <= 0) { //going southeast
      loc.x+=random(0.1, 5);
      loc.y+=random(0.1, 5);
    } 
    else if ( tempX <=0 && tempY <= height) { //going northeast
      loc.x+=random(0.1, 5);
      loc.y-=random(0.1, 5);
    }
  }
}//end of asteroid class



