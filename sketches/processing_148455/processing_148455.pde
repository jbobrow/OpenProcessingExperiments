
PImage img;
PGraphics ast;
PVector startLoc = new PVector(250, 250);
float radius = 25;
boolean clicked;
Asteroid a;
ArrayList<Asteroid> alist = new ArrayList<Asteroid>();


void setup() {
  size(500, 500);
  img = loadImage("outer-space-stars.jpeg");
  a = new Asteroid();
} //end of setup
void draw() {
  image(img, 0, 0, 500, 500);
  textSize(24);
  fill(255);
  text("Dodge The Asteroids!", 125, 40);
  fill(125);
  println(mouseX+","+mouseY);
  if (clicked) { 
    // if(clickOnStart(startLoc)) 
    fill(100, 100, 100);
    ellipse(mouseX, mouseY, radius*2, radius*2);
    a.display();
  } 
  else {
    ellipse(startLoc.x, startLoc.y, radius*2, radius*2);
  }

  //isGameOn();
  if (alist.size() < 10) {
    alist.add(new Asteroid());
  }
  for (Asteroid b : alist) {
    b.display();
  }
} //end of draw

void mouseClicked() {
  if (clickOnStart(startLoc)) {
    clicked = true;
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
void isGameOn() {
  if (clicked) {
    ast = createGraphics(75, 75);
    ast.beginDraw();
  }
}

class Asteroid {
  PVector loc;
  public Asteroid() { 
    loc = new PVector(random(-200,width+200), random(-200,height+200));
    if (loc.x >= width && loc.y <= 0) { // going southwest
      loc.x = 700;
      loc.y = -200;
    } 
    else if (loc.x >= width && loc.y >= height) { //going northwest
      loc.x = -200;
      loc.y = 700;
    } 
    else if (loc.x >= width && loc.y >= 0 ) { // going left
      loc.x = 700;
    } 
    else if (loc.x >= 0 && loc.x <= 500 && loc.y <= 0) { // going down
      loc.y = -200;
    } 
    else if (loc.x >= 0 && loc.y >= height) { // going up
      loc.y = -700;
    } 
    else if (loc.x <= 0 && loc.y >= 0) { // going right
      loc.x = -200;
    } 
    else if ( loc.x<=0 && loc.y <= 0) { //going southeast
      loc.x=-200;
      loc.y=-200;
    } 
    else if ( loc.x <=0 && loc.y <= height) { //going northeast
      loc.x = 700;
      loc.y=700;
    }
  }
  void display() {
    fill(random(255), random(255), random(255));
    ellipse(loc.x, loc.y, 50, 50);
    move();
    println(loc.x + " display  " + loc.y);
  }
  void move() { //x ------ y |||||
    float tempX = loc.x;
    float tempY = loc.y;


    if (tempX >= width && tempY <= 0) { //going southwest
      loc.x-=1;
      loc.y+=1;
    } 
    else if (tempX >= width && tempY >= height) { //going northwest
      loc.x-=1;
      loc.y-=1;
    } 
    else if (tempX >= width && tempY >= 0 ) { //going left
      loc.x-=1;
    } 
    else if (tempX >= 0 && tempY <= 0 ) { // going down
      loc.y+=1;
    } 
    else if (tempX >= 0 && tempY >= height) { //going up 
      loc.y-=1;
    } 
    else if (tempX <= 0 && tempY >= 0) { //going right
      loc.x+=1;
    } 
    else if ( tempX <=0 && tempY <= 0) { //going southeast
      loc.x+=1;
      loc.y+=1;
    } 
    else if ( tempX <=0 && tempY <= height) { //going northeast
      loc.x+=1;
      loc.y-=1;
    }
    println(tempX + " temp " + tempY);
  }
}//end of asteroid class



