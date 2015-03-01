
PFont font;
float score;

PImage bagPic2;
PImage bagPic;
float xBag;
float yBag;

PImage spritePic;
float xSprite;
float ySprite;

void setup () {
  size (600, 600);
  spritePic = loadImage("hero.png");
  xSprite = 300;
  ySprite = 310;
  
  bagPic = loadImage("punchingbag.png");
  bagPic2 = loadImage("punchingbag2.png");
  xBag = 400;
  yBag = 250;
  
  font = loadFont("CharterBT-Roman-48.vlw");
  textFont(font, 32);
  score = 0;
}

void draw () {
  background(255, 255, 255);
  fill(126, 43, 43);
  rect(0, 380, 900, 900);
  drawSprite();
  moveSprite();
  drawBag();
  collision();
  drawScore();
}

void drawSprite() {
  image(spritePic, xSprite, ySprite, 100, 100);
  }
  
  void moveSprite() {
    if((keyPressed) && (key == CODED)){
      if (keyCode == LEFT) {
        xSprite--;
      }
      if (keyCode == RIGHT) {
        xSprite++;
      }
      //if (keyCode == UP) {
        //ySprite--;
      //}
      
      //if (keyCode == DOWN) {
        //ySprite++;
      //}
    }
    
    if (xSprite == 0) {
      xSprite = width;
    }
    if (xSprite == width +1) {
      xSprite = 0;
    }
    if (ySprite == height) {
      ySprite = 0;
    }
    if (ySprite == -1) {
      ySprite = height;
    }
  }
  
  void drawBag () {
    if (abs(xSprite - xBag) > 40)
    {
   image(bagPic, xBag, yBag, 50, 100);
    }
  }
  
  void collision () {
    if( abs(xSprite - xBag) <40
    &&
    abs(ySprite - yBag) <100)
       {
         image(bagPic2, 377, yBag, 75, 100);
         
         score = score +0.1;
       } 
  }
       
  void drawScore () {
    fill(10, 20, 30);
    text("Score " + score, 10, 30);
  }
  


