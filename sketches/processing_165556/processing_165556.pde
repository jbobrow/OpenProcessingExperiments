
//BREN TAMADOTCHI GAME



//REFERENCES
//Good animated sprite tutorial:
//https://www.youtube.com/watch?v=IvvRoJCrwFY
//Controlling animation with millis:
//http://forum.processing.org/one/topic/serial-control-of-framerate.html

Bren bren;
Fullness_Score score;
Burger burger1;
Burger burger2;
Burger burger3;
Carrot carrot1;


void setup() {
  size(400, 400);
  bren = new Bren(); 
  score = new Fullness_Score();
  burger1 = new Burger();
  burger2 = new Burger();
  burger3 = new Burger();
  carrot1 = new Carrot();
  burger1.position.x = 260; //setting up burger positions...
  burger2.position.x = 290; //Originally, I had a random() function
  burger3.position.x = 360; //in the Burger class to get 3 different
  burger1.position.y = 320; //positions. Wasn't happy with the result
  burger2.position.y = 300; //though.
  burger3.position.y = 310;
  carrot1.position.x = 30;
  carrot1.position.y = 300;
}

void draw() {
  background(188, 230, 245);
  fill(200);
  noStroke();
  rect(0, 310, width, 180); //floor
  bren.display();  
  score.display();
  score.update();
  burger1.display();
  burger2.display(); 
  burger3.display();
  carrot1.display(); 
  burger1.drag();
  burger2.drag(); 
  burger3.drag();
  carrot1.drag();
}

void mouseReleased() { //When mouse is released, stop dragging burgers.
  burger1.stopDrag(); 
  burger2.stopDrag(); 
  burger3.stopDrag();
  carrot1.stopDrag();
}

class Bren {
  float x, y, w, h;
  int sx, sy, sw, sh, dx, dy, dw, dh;
  PImage brenSprite;
  boolean dead;
  boolean modeDefault;
  boolean modeEat;
  boolean modeDead;
  boolean modeTalk;
  float passedTime;
  float savedTime;
  int score;

  //CONSTRUCTOR
  Bren() {
    x = 150;
    y = 160;
    w = 100;
    h = 160;
    //COPY IMAGE SOURCE VARS:
    sx = 0; //image source X
    sy = 0; // y
    sw = 100; //source width
    sh = 160; // height
    dx = 150; // destination X
    dy = 160; // destination y
    dw = 100; // dest width
    dh = 160; // dest height
    score = 0; //(fullness)
    brenSprite = loadImage("bren.png");
    modeDefault = true; //Default sprite
    savedTime = millis();
    dead = false;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CORNER);
    noStroke();
    copy(brenSprite, sx, sy, sw, sh, dx, dy, dw, dh);

    //is burger over bren?
    if (dead == false && burger1.position.x > x && burger1.position.x < x+w && burger1.position.y > y && burger1.position.y < y+h && mousePressed == false) {
      score++; //+1 fullness
      eatSprite(); //change sprite
      modeEat = true; //set to eat
      modeDefault = false; //get rid of the other sprites
      modeTalk = false;
      burger1.position.x = -50; //warps real burger out of bounds
      savedTime = millis(); //reset timer
    }
    if (dead == false && burger2.position.x > x && burger2.position.x < x+w && burger2.position.y > y && burger2.position.y < y+h && mousePressed == false) {
      
      score++;
      eatSprite();
      modeEat = true; 
      modeDefault = false;
      modeTalk = false;
      burger2.position.x = -50;
      savedTime = millis();
    }
    if (dead == false && burger3.position.x > x && burger3.position.x < x+w && burger3.position.y > y && burger3.position.y < y+h && mousePressed == false) {
      
      score++;
      eatSprite();
      modeEat = true; 
      modeDefault = false;
      modeTalk = false;
      burger3.position.x = -50;
      savedTime = millis();
    } // (Not sure how I could condense these)
    //Did I just eat?
    if (modeEat == true) {
      
      passedTime = millis() - savedTime; 
      if (passedTime > 1000) { //give some time to eat
        modeDefault = true; //switch back to default
        modeTalk = false;
        modeEat = false;
        savedTime = millis(); //reset timer
      }
    }
    //DEFAULT MODE - WILL SWITCH BETWEEN ITSELF AND TALK MODE
    if (modeDefault == true) {

      passedTime = millis() - savedTime;
      defaultSprite(); //Display Sprite
      if (passedTime > 1000) {
        modeDefault = false;
        modeTalk = true;
        savedTime = millis(); //reset timer
      }
    }
    //TALK MODE
    if (modeTalk == true) {
      passedTime = millis() - savedTime;
      talkSprite(); //Display Sprite
      if (passedTime > 1000) { //after 1 second, switch back to default
        modeDefault = true;
        modeTalk = false;
        savedTime = millis(); //reset timer
      }
    }
    if (score == 3) { //If I'm totally full...
      modeDefault = false;
      modeTalk = false;
      modeEat = false;
      sx = 400;
      //Speech bubble:
      fill(245, 188, 239); //pink
      rect(x, y-90, 100, 60);
      triangle(x+40, y-30, x+50, y-20, x+60, y-30);    
      String words = "Th- thank you, senpai~"; // <3
      fill(0);
      textSize(13);
      text(words, x+10, y-80, 80, 40);
    }

    if (carrot1.position.x > x && carrot1.position.x < x+w && carrot1.position.y > y && carrot1.position.y < y+h && mousePressed == false) {
      dead = true;
      score=-1000;
      deadSprite();
      modeDefault = false;
      modeTalk = false;
      carrot1.position.x = -50;
      savedTime = millis();
    }
  } //end of display





  void defaultSprite() {
    //copy(src, sx, sy, sw, sh, dx, dy, dw, dh)
    //displays a sprite from my sprite sheet
    sx = 0; //changes source to first sprite
  }
  void talkSprite() {
    sx = 200; //source = 3rd sprite
    //Speech bubble:
    fill(255);
    rect(x, y-90, 100, 60);
    triangle(x+40, y-30, x+50, y-20, x+60, y-30);    
    String words = "I'm hungry for a burger!";
    fill(0);
    textSize(13);
    text(words, x+10, y-80, 80, 40);
  }
  void deadSprite() {
    sx = 300; //source = 4th sprite
    
  }
  void eatSprite() {
    sx = 500;
  }
}

class Burger {
  PVector position = new PVector();
  //float position.x, position.y, w, h;
  int sx, sy, sw, sh, dx, dy, dw, dh;
  PImage burgerSprite;
  boolean dragged;
  boolean mouseOver;
  boolean clicked;
  float offsetX;
  float offsetY;
  //CONSTRUCTOR
  Burger() {
    burgerSprite = loadImage("burger.png");
  }

  void display() { //Displays the sprite
    image(burgerSprite, position.x, position.y);
  }


  void drag() {
    //if mouse is over burger...
    if (mouseY < position.y+30 && mouseY > position.y && mouseX > position.x && mouseX < position.x+40) {
//      println("mouse over true");
      mouseOver = true; //Yes, Mouse is over burger.
    } else {
      mouseOver = false; //Or else it's not
    }
    if (mouseOver == true && mousePressed == true) { //If mouse if over burger and mouse is being held...
      dragged = true;
//      println("dragged");
      offsetX = position.x - mouseX;  //Record offset
      offsetY = position.y - mouseY; 
    }
    if (dragged == true) {
      position.x = mouseX + offsetX; //Sync burger with mouseX &
      position.y = mouseY + offsetY; //mouseY with an offset so no "snapping"
    } else if (position.y < 300) { //Is burger on ground?
      position.y+=3; //Fall
    }
  }
    void stopDrag() {
      dragged = false;
    }
  }

class Carrot {
  PVector position = new PVector();
  //float position.x, position.y, w, h;
  int sx, sy, sw, sh, dx, dy, dw, dh;
  PImage burgerSprite;
  boolean dragged;
  boolean mouseOver;
  boolean clicked;
  float offsetX;
  float offsetY;
  //CONSTRUCTOR
  Carrot() {
    burgerSprite = loadImage("carrot.png");
  }

  void display() { //Displays the sprite
    image(burgerSprite, position.x, position.y);
  }


  void drag() {
    //if mouse is over Carrot...
    if (mouseY < position.y+30 && mouseY > position.y && mouseX > position.x && mouseX < position.x+40) {
//      println("mouse over true");
      mouseOver = true; //Yes, Mouse is over carrot.
    } else {
      mouseOver = false; //Or else it's not
    }
    if (mouseOver == true && mousePressed == true) { //If mouse if over carrot and mouse is being held...
      dragged = true;
//      println("dragged");
      offsetX = position.x - mouseX;  //Record offset
      offsetY = position.y - mouseY; 
    }
    if (dragged == true) {
      position.x = mouseX + offsetX; //Sync carrot with mouseX &
      position.y = mouseY + offsetY; //mouseY with an offset so no "snapping"
    } else if (position.y < 300) { //Is carrot on ground?
      position.y+=3; //Fall
    }
  }
    void stopDrag() {
      dragged = false;
    }
  }

class Fullness_Score {
  color block1, block2, block3;
  //CONSTRUCTOR
  Fullness_Score() {
    bren.score = 0;
    block1 = color(255);
    block2 = color(255);
    block3 = color(255);
  } //end contructor

  void display() {
    fill(0);
    textSize(30);
    text("POINTS", 20, 40);
    
    
    stroke(0);
    fill(block1);
    rect(20, 50, 20, 30);
    fill(block2);
    rect(60, 50, 20, 30);
    fill(block3);
    rect(100, 50, 20, 30);
  } //end display

  void update() {
    if (bren.score == 1) {
//      println("hi");
      block1 = color(255, 0, 0);
    }
    if (bren.score == 2) {
//      println("hi");
      block2 = color(255, 0, 0);
    }
    if (bren.score == 3) {
//      println("hi");
      block1 = color(245, 188, 239);
      block2 = color(245, 188, 239);
      block3 = color(245, 188, 239);
    }
    if (bren.score <= 0){
      block1 = color(255);
      block2 = color(255);
      block3 = color(255);
    }
  } //end update
} //end class



