
import ddf.minim.*;
int lives = 5;  
int score = 0; 
int f = 0;
int time = 0;
int songtimer = 0;
float b = 0;
float speed = 0.5;
Boolean startGame = false;
Boolean overButton = false;
Boolean isReverse = false;
PImage img = loadImage("Stars.jpg");
PImage star = loadImage("GameStar.png");
PImage meteor = loadImage("Meteor.png");
PImage ufo = loadImage("UFO.png");
PImage rocket = loadImage("rocket.png");
ArrayList<Star> Star = new ArrayList<Star>();
AudioPlayer song;
Minim minim;

void setup() {
  size(500, 500);
  minim = new Minim(this);
  song = minim.loadFile("Stars.mp3");
  song.play();
}

void draw() {
  if ( frameCount % 60 == 0 ) {
    songtimer++;
  }

  if (songtimer % 205 == 0 && songtimer != 0) {
    song.rewind();
    song.play();
    songtimer = 0;
  }
  smooth();
  //Title Screen
  if (startGame != true) {
    background(0);
    update(mouseX, mouseY);
    if (overButton == true) {
      fill(244);
      rect(200, 370, 100, 50);
      fill(25, 25, 79);
      text("LETS GO!", 220, 400);
    } 
    else {
      fill(255, 165, 0);
      rect(200, 370, 100, 50);
      fill(25, 25, 79);
      text("Start?", 231, 400);
    }
    textAlign(CENTER);
    textSize(40);
    fill(255, 215, 0);
    text("StarFall Game", width/2, 50);
    textAlign(LEFT);
    textSize(15);
    fill(200, 205, 100);
    text("How to play :", 30, 90);
    fill(200, 0, 220);
    text("Collect the ", 135, 91);
    fill(255, 255, 0);
    text("STARS", 216, 91);
    fill(200, 0, 220);
    text("Dodge the ", 135, 121);
    fill(255, 0, 0);
    text("METEORS", 215, 121);
    fill(0, 255, 0);
    fill(200, 245, 220);
    text("You have 5 lives", 135, 150);  
    fill(100, 200, 120);
    text("You lose a life when collecting a \nor letting a          touch the bottom", 135, 180);
    fill(255);
    text("Collect the UFO for a random effect", 135, 230); 
    textSize(10);
    text("NOTE: the effect can be good or bad\nno penalty for letting the UFO hit the side", 135, 250); 
    fill(255, 250, 0);
    textSize(15);
    text("Click Start to Begin", 185, 350); 
    fill(255, 0, 0);
    text("METEOR", 370, 181); 
    fill(255, 225, 0);
    text("STAR", 220, 203);
  } 
  //where the game plays
  else if (lives > 0) {
    noCursor();
    background(0);
    image(img, 0, 0);
    fill(255);
    textSize(20);
    text("Lives " + lives, 1, 490);
    f++;
    if (f % 900 == 0 ) {
      speed += .1;
      Star.add(new UFO(b));
    }
    if (f % 50 ==0) {
      for (int a = 0; a < 1; a++) {
        Star.add(new Star(b));
      }
    }
    if (f % 60 ==0) {
      for (int a = 0; a < 1; a++) {
        Star.add(new Meteor(b));
      }
    }

    for (int a = 0; a < Star.size(); a++) {
      Star s1 = Star.get(a);
      s1.fall(); 
      if (isReverse ==false) {
        if (s1.Star_collision(s1.getX(), s1.getY(), 10, mouseX, mouseY, 5.0) == true) {
          s1.isScore();
          Star.remove(s1);
        }
      }  
      else {
        if (s1.Star_collision(s1.getX(), s1.getY(), 10, width-mouseX, height-mouseY, 5.0) == true) {
          s1.isScore();
          Star.remove(s1);
        }
      }
      if (s1.hasFallen() == true) {
        s1.isGood();
        Star.remove(s1);
      }
    }
    if (isReverse == true) {
      fill(0, 0, 255);
      stroke(0, 0, 255);
      image(rocket, width-mouseX, height-mouseY, 20, 20);
      time++;
    } 
    else {
      fill(0, 0, 255);
      stroke(0, 0, 255);
      image(rocket, mouseX, mouseY, 20, 20);
    }
    if (time == 600) {
      isReverse = false;
      time = 0;
    }
  }
  //Gameover Screen
  if (lives == 0) {
    cursor();
    background(0);
    fill(255, 0, 0);
    textSize(40);
    text("GAMEOVER", 143, 200);
    textSize(15);
    fill(255);
    text("Final Score: " + score, 200, 240);

    update(mouseX, mouseY);
    if (overButton == true) {
      fill(244);
      rect(200, 370, 100, 50);
      fill(25, 25, 79);
      text("Lets Go!", 221, 400);
    } 
    else {
      fill(255, 165, 0);
      rect(200, 370, 100, 50);
      fill(25, 25, 79);
      text("Retry?", 230, 400);
    }
  }
}
//check for if mouse has been clicked
void mousePressed() {
  if (startGame == false || lives == 0) {
    if (overButton) {
      startGame = true;
      lives = 5;  
      score = 0; 
      f = 0; 
      speed = 0.5;
      ArrayList<Star> temp = new ArrayList<Star>();
      Star = temp;
    }
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

public class Star { 
  float x, y;
  public Star(float y1) {
    x = random(20, width - 20);
    y = y1;
  }
  //Makes the Star fall at a constant rate
  public void fall() {
    y += speed;
    image(star, x, y, 15, 15);
  }
  //gets the y coordinate of the falling Star
  public float getY() {
    return y;
  }
  //gets the x coordinate of the falling Star
  public float getX() {
    return x;
  }
  //Checks if mouse touchs a Star
  boolean Star_collision(float x1, float y1, float radius1, float x2, float y2, float radius2) {
    if (dist(x1, y1, x2, y2) < radius1 + radius2) {
      return true;
    }
    return false;
  }
  //checks if a Star has touched the bottom of the screen
  boolean hasFallen() {
    if (y >= 500) {
      return true;
    } 
    return false;
  }
  //checks if the object collected is good or not
  //adds a point if good
  //loses a life if bad
  void isScore() {
    score++;
  }
  //checks if the object has touched the bottom
  //adds a point if good
  //loses a life if bad
  void isGood() {
    lives--;
  }
}
public class Meteor extends Star {

  public Meteor(float y ) {
    super(y);
  }
  void isScore() {
    lives--;
  }
  void isGood() {
    score++;
  }
  public void fall() {
    y = y + speed;
    image(meteor, x, y, 20, 20);
  }
}
public class UFO extends Star {

  public UFO(float x) {
    super(x);
  }

  void isScore() {
    randomEffect();
  }
  void isGood() {
  }  
  void randomEffect() {
    int r = (int)random(500);
    if (f >= 101 && f <=200) {
      lives++;
    }
    else if (f > 200 && f <=300) {
      lives--;
    } 
    else if ( f >= 0 && f < 101) {
      isReverse = true;
    }
    else if (f % 2 == 0) {
      speed += .2;
    }
    else {
      speed -= .2;
    }
  }

  void fall() {
    y += .2 + speed;
    image(ufo, y, x, 20, 20);
  }
  public float getY() {
    return x;
  }
  public float getX() {
    return y;
  }
}


