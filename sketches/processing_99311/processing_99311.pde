
float b = 0;
int lives = 5;
int score = 0;
int f = 0;
float speed = 0.7;
Boolean startGame = false;
Boolean overButton = false;
ArrayList<Circle> circle = new ArrayList<Circle>();
void setup() {
  size(500, 500);
  background(255);
  circle.add(new Circle(b));
}

void draw() {
  smooth();
  //Title Screen
  if (startGame != true) {
    background(0);
    update(mouseX, mouseY);
    if (overButton == true) {
      fill(244);
      rect(200, 370, 100, 50);
    } 
    else {
      fill(255, 165, 0);
      rect(200, 370, 100, 50);
    }
    textAlign(CENTER);
    textSize(40);
    fill(255, 215, 0);
    text("The Collecting Game", width/2, 50);
    textAlign(LEFT);
    textSize(15);
    fill(200, 205, 100);
    text("How to play :", 30, 90);
    fill(200, 0, 220);
    text("Collect the ", 135, 91);
    fill(0, 255, 0);
    text("GREEN", 210, 91);
    fill(200, 0, 220);
    text("Dodge the ", 135, 121);
    fill(255, 0, 0);
    text("RED", 210, 121);
    fill(0, 255, 0);
    fill(200, 0, 220);
    text("You have 5 lives", 135, 150);  
    text("You lose a life when collecting the \nor letting the                touch the bottom", 135, 180);
    fill(255, 250, 0);
    text("Click Start to Begin", 185, 250); 
    fill(255, 0, 0);
    text("RED", 360, 181); 
    fill(0, 255, 0);
    text("GREEN", 219, 199);
    fill(25, 25, 79);
    text("Start", 234, 400);
  } 
  //where the game plays
  else if (lives > 0) {
    noCursor();
    background(255);
    fill(0,0,255);
    textSize(20);
    text("Lives " + lives, 1,490);
    f++;
    if (f % 900 == 0 ) {
      speed = speed + .1;
    }
    if (f % 20 ==0) {
      for (int a = 0; a < 1; a++) {
        circle.add(new Circle(b));
      }
    }

    for (int a = 0; a < circle.size(); a++) {
      Circle c1 = circle.get(a);
      c1.fall(); 
      if (c1.circle_collision(c1.getX(), c1.getY(), 10, mouseX, mouseY, 5.0) == true) {
        circle.remove(c1);
        score++;
      }
      if (c1.hasFallen() == true) {
        circle.remove(c1);
      }
    }
    fill(0);
    stroke(0);
    ellipse(mouseX, mouseY, 10, 10);
  }
  //Gameover Screen
  if (lives == 0) {
    cursor();
    background(0);
    fill(255,0,0);
    textSize(40);
    text("GAMEOVER",143,200);
    textSize(15);
    fill(255);
    text("Final Score: " + score,200,240);
    
  }
}
//check for if mouse has been clicked
void mousePressed() {
  if (overButton) {
    startGame = true;
  }
}
//checks the current position of the mouse
void update(int x, int y) {
  if (overRect(200, 370, 100, 50)== true) {
    overButton = true;
  } 
  else {
    overButton = false;
  }
}

//Checks if mouse is over start button
boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

public class Circle { 
  float x, y;
  boolean hasTouch = false;

  public Circle(float y1) {
    x = random(width - 20);
    y = y1;
  }
  //Makes the circle fall at a constant rate
  public void fall() {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    y = y + speed;
    ellipse(x, y, 20, 20);
  }
  //gets the y coordinate of the falling circle
  public float getY() {
    return y;
  }
  //gets the x coordinate of the falling circle
  public float getX() {
    return x;
  }
  //Checks if mouse touchs a circle
  boolean circle_collision(float x1, float y1, float radius1, float x2, float y2, float radius2) {
    if (dist(x1, y1, x2, y2) < radius1 + radius2) {
      return true;
    }
    return false;
  }
  //checks if a circle has touched the bottom of the screen
  boolean hasFallen() {
    if (y >= 500) {
      lives--;
      return true;
    } 
    return false;
  }
}



