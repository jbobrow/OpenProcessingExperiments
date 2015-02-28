
PImage img;  //for the background
Charmander charmander;
Timer timer;        // a timer
Drop[] drops;       // the water drops
int totalDrops = 0; // counts the water drops
int BG = 255;  // a changeable background color for when Charmander dies
int score = 0; // the player's score (time spent alive)
int highScore = 0;  // the player's high score
PFont f;  // used for printing the player's score

void setup() {
  f = createFont("Arial", 13, true);  // score
  size(1000, 550);  // the playing field
  smooth();  
  charmander = new Charmander();  // here's our cute little fire lizard
  drops = new Drop[1000];  // 1000 drops.  I guess if you reach 1000 then you win
  timer = new Timer(250);  // makes drops fall at a reasonable rate... 
                           //the smaller the number the higher the difficulty
  timer.start();             // starts the timer
  img = loadImage("pokebackground.jpg");
}


void draw() {
  image(img, 0, 0, 1000, 550);
  if (BG != 255) {  // this detects when charmander dies
    background(BG);  
  }
  charmander.display();  // here's the player character
  charmander.keyPressed();  // this let's him respond to user input
  keyPressed();  
  if (BG == 255) {
    score = score + 1;  // if charmander is alive, increase the score over time
  }
  if (timer.isFinished() && BG == 255) { 
    drops[totalDrops] = new Drop();  // make it rain
    totalDrops ++ ;
    if (totalDrops >= drops.length) {
      totalDrops = 0;  // if you reach 1000 drops congrats you win and it starts over 
                       // (think of it as level 2)
    }
    timer.start();  // run the timer
  }

  // Move and display all drops
  for (int i = 0; i < totalDrops; i++ ) {
    drops[i].move();
    drops[i].display();
    if (charmander.dies(drops[i])) { // if Charmander gets hit by a rain drop
      drops[i].charmanderDied();  // make the drop disappear
      BG = 100; // and turn the screen grey
    }
  }
  fill(255, 0, 0); // print the score in red
  textFont(f, 40);
  text(score, 830, 50);  // print the score in the upper right
  fill(0, 255, 0);
  text(highScore, 40, 50); // print the high score in the upper left in green
}

class Charmander {  
  PImage charchar = loadImage("Charmander.gif");  // here's our cutie
  float charX = 80;
  float charY = 125;
  float xPos = width/2 - charX/2;
  float yPos = height - charY;
  void display() {
    fill(0);
    image(charchar, xPos, yPos, charX, charY);  // Charmander's hitbox (it's a rectangle)
  }
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT) {  // if you push the right arrow Charmander moves over by 5
        xPos = xPos + 5;
      }
      if (keyCode == LEFT) {  // if you push the left arrow Charmander moves over by 5
        xPos = xPos - 5;
      }
      if (keyCode == DOWN) {
        if (highScore < score) {
          highScore = score;
        }
        score = 0;
        BG = 255;
        totalDrops = 0;
      }
      keyCode = UP;  // removes the issue of Charmander moving forever because the key is stored
    }
  }
  boolean dies(Drop d) {
    float dropX = d.x;
    float dropY = d.y;
    if (xPos < dropX && dropX < xPos + charX && yPos < dropY && dropY < height) {
      // if it's to the right of the left boundary of the hitbox and to the left of the right boundary
      // and below the top boundary but above the floor
      // then it is intersecting Charmander's hitbox
      // kill him.
      return true;
    }
    else {
      return false;
    }
  }
}

class Drop {
  float x, y;   
  float speed; 
  color c;
  float r;  

  Drop() {
    r = 8;                 // raindrop size
    x = random(width);     // start with a random x location
    y = -r*4;              // forms the raindrops above the window
    speed = random(1, 6);   // random speed for difficulty's sake
    c = color(0, 0, 255);   // my raindrops are really blue
  }

  void move() {  // moves the raindrop
    y += speed;  // by a speed from 1 to 6
  }

  boolean reachedBottom() {  // checks for when the raindrops hit the bottom of the screen
    if (y > height + r*4) { 
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {  // display...
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }
  void charmanderDied() {    // if the drop hits charmander, make it vanish
    speed = 0; 
    y = - 1000;
  }
}

class Timer {

  int savedTime; // a timer for the sake of score and drop frequency
  int totalTime; // the end of level 1

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() { // this checks to see if level 1 is over, basically
    int passedTime = millis()- savedTime;  // i mean, level 2 is the same, but yeah
    if (passedTime > totalTime) {   // you got past 1000 drops so goood for you
      return true;
    } 
    else {
      return false;
    }
  }
}



