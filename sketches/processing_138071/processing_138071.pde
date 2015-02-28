
// Icons from here http://www.iconspedia.com/
// Sounds from here http://freesound.org/

// Fruits are falling from the sky, see if you can catch them

import java.util.LinkedList;
import java.io.File;

LinkedList <Fruit> list;  // a list to hold fruit objects

float fruitSpeed = 1.0;  // the speed of the fruits that are falling, increased as the game goes by
int fruitDelay = 1;    // the delay between creating two fruit objects, increased as the game goes by
int score;
int lives;
PImage[] fruits;  // to hold images of fruits
PFont textFont;  // font to display the score and lives remaining

// Minim didn't work for me, so I tried a free library called Maxim
// Maxim has basically the same functionality as Minim
Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;


void setup() {
  initialize();
}

void draw() {
  background(255);
  
  if(fruitDelay % 30 == 0)
    for(int i = 0; i <= millis() / 200000; i++)
      createFruit();
  
  fruitDelay++;
  drawFruits();
  drawScore();
  
}

void initialize() {
  size(800, 600);
  list = new LinkedList<Fruit>();
  // load fruit images from fruits folder
  loadFruitImages();
  textFont = loadFont("BrushScriptMT-36.vlw");
  maxim = new Maxim(this);
  player1 = maxim.loadFile("bite.wav");
  player1.setLooping(false);
  player2 = maxim.loadFile("game_over.wav");
  player2.setLooping(true);
  player1.speed(1);
  player2.speed(1);
  player2.stop();
  score = 0;
  lives = 5;
  fruitSpeed = 1.0;
  fruitDelay = 1;
  drawScore();
  loop();
}

void playOne() {
  player1.play();
}

void playTwo() {
  player2.play();
}

// if mouse pressed
void mousePressed() {
  checkFruit((int) mouseX, (int) mouseY);  // check if a fruit was clicked
  fruitSpeed += norm(second(), 0, 500) / 3 ;
  
  if(lives <= 0) {
    gameOver();
  }
}

void gameOver() {
  playTwo();
  lives = 0;
  list.clear();
  background(255);
  textSize(64);
  text("Game Over", width/2 - 130, height/2);
  noLoop();
}

// create a new fruit object with a random size and x position
void createFruit() {  
  float scale = random(30, 90);
  float x = random(width - scale);
  Fruit b = new Fruit(x, scale);
  list.add(b);
}

// loop through the fruit list and draw them.
void drawFruits() {
  for(int i =0; i < list.size(); i++) {
      Fruit b = list.get(i);
      b.draw();
      int by = (int) b.getY();
      if(by > height) {
        list.remove(i);
        lives--;
        if(lives <= 0) {
          gameOver();
        }
      }
  }
}

// check if a fruit was clicked
void checkFruit(int x, int y) {
  for(int i =0; i < list.size(); i++) {
      Fruit b = list.get(i);
      int bx = (int) b.getX();
      int by = (int) b.getY();
      int br = (int) b.getScale();
      if( ((x>=bx && x-bx<=br) || (x<=bx && bx-x<=br)) && ((y>=by && y-by<=br) || (y<=by && by-y<=br)) ) {
        playOne();
        list.remove(i);  // delete the fruit object from the list
        incrementScore(br, (int) fruitSpeed);  // increment the score
        redraw();  
      }
        
  }
}

// a function to increment score based on the size, speed of the fruit
void incrementScore(int scale, int speed) {
  score += 10 - scale / 10;
  score += speed;
}

// Display score and lives remaining
void drawScore() {
  textFont(textFont);
  fill(0);
  text("Score: " + score, 20, 30);
  text("Lives: " + lives, width - 120, 30);
}

void keyPressed() {
  if (key == 'n' || key == 'N') initialize();
}
// load fruit images.
// I tried to put them in a subfolder in the Data folder,
// but could not find a way to tell processing about it.
// The default folder for processing is the installation folder
void loadFruitImages() {
  String[] f = {"lime", "apple", "pineapple", "orange", "bananas", "watermelon", "apricot", "kiwi", "strawberry"};
  fruits = new PImage[f.length];
  for (int i = 0; i < f.length; i++) {
    fruits[i] = loadImage(f[i] + ".png");
  }
}

// A class to represent the fruit object
class Fruit {
  private float x;  // current x position of the fruit
  private float y;  // current y position
  private float scale;  // the size of the fruit
  private PImage fruitImage;  // fruitImage the image
  
  public Fruit(float x, float scale) {
    this.x = x;
    this.scale = scale;
    y = 40.0;
    fruitImage = fruits[(int) random(fruits.length)];
  } 
  
  // A method that is called to draw the fruit
  public void draw() {
    y += fruitSpeed;  // update the y coordinate of the fruit
    image(fruitImage, x, y, scale, scale);
  }
  
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getScale() {
    return scale;
  }
}

