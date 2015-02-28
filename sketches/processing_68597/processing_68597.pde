
PFont headlineFont, subheaderFont;
float topBorder;
float bottomBorder;
float accel;
boolean titleScreen = true;

PImage drums;

PImage sample;


// Create the Hero
Hero myHero;
Item drum01;
Item sample01;

Item[] allTracks = new Item[2];

void setup() 
{
 size(1024, 600);
 background(255); 
 
 headlineFont = createFont("CenturyGothic-Bold", 32, true);
 subheaderFont = createFont("CenturyGothic-Bold", 14, true);
 
 topBorder = height*0.25;
 bottomBorder = height*0.75;
 
 myHero = new Hero(width/2, height/2, 2);
 imageMode(CENTER);
 
 drums = loadImage("icon_drums.png");
 sample = loadImage("icon_sample.png");
 drum01 = new Item(drums, width/16, height/2);
 sample01 = new Item(sample, 15*width/16, height/2);
 
 allTracks[0] = drum01;
 allTracks[1] = sample01;
 
 accel = 0.1;
 
 
}

void draw() 
{
  background(0);
  
  // title screen

  if (titleScreen == true) {
    
    textAlign(CENTER);

    textFont(headlineFont);
    text("HIP HOP HERO", width/2, height/2);

    textFont(subheaderFont);
    text("Hip Hop is in trouble. It's up to you to save it. Press any key to start", width/2, height/2 + 30);

    if (keyPressed) {
      displayHero();
      titleScreen = false;
    }
  }
  else {
    
    for (int i = 0; i < 2; i++) {
      allTracks[i].display(); 
    }
    
    displayHero();
        
    if (myHero.xpos < drum01.xpos + 10 && myHero.xpos > drum01.xpos - 10) {
      fill(255);
      textAlign(CENTER);
      textFont(subheaderFont);
      text("The drums are the essence. Without these, there is no beat.", width/2, height/2 + 30);
    }
    
    if (myHero.xpos < sample01.xpos + 10 && myHero.xpos > sample01.xpos - 10) {
      fill(255);
      textAlign(CENTER);
      textFont(subheaderFont);
      text("The sample can make or break a song. Make sure you clear it!", width/2, height/2 + 30);
    }

  }
  
}

void keyReleased() {
  myHero.speed = 2;
}


void displayHero() {
  // TO DO: for loop through arrays of each class
  myHero.display();
  myHero.moveHero();
}



// THE HERO CLASS

class Hero {

  float xpos;
  float ypos;
  float speed;
  float heroWidth = 35;
  float heroHeight = 48;
  
  PImage hero;
  

  Hero (float tempX, float tempY, float tempSpeed) {

    speed = tempSpeed;
    xpos = tempX;
    ypos = tempY;
    hero = loadImage("little_hero.png");
  }

  void display() {
    if (xpos < heroWidth/2) {
      xpos = heroWidth/2;
    }
    if (xpos > width - heroWidth/2) {
      xpos = width - heroWidth/2;
    }
    if (ypos < topBorder + heroHeight/2) {
      ypos = topBorder + heroHeight/2;
      background(255,0,0,25);
    }
    if (ypos > bottomBorder - heroHeight/2) {
      ypos = bottomBorder - heroHeight/2;
      background(255,0,0,25);
    }

    fill(0);
    image(hero, xpos, ypos, heroWidth, heroHeight);
    
  }



  // Function to move Hero around
  void moveHero() {

    if (keyPressed) {
      if (keyCode == LEFT) { 
        myHero.xpos -= myHero.speed;
        myHero.speed += .1;
      }
      if (keyCode == RIGHT) { 
        myHero.xpos += myHero.speed;
        myHero.speed += .1;
      }
    }
    
  }
  
}


// THE ITEM CLASS

// Define class for all Items
class Item {
  // Attributes determine the type of collectible (drums, bass, etc.)

  boolean isCollected = false;
  PImage type;
  float xpos;
  float ypos;
  float itemWidth = 25;
  float itemHeight = 22;
  

  Item(PImage tempType, float tempX, float tempY) {
    type = tempType;
    xpos = tempX;
    ypos = tempY;
  }


  // Show the Item
  void display() {
    image(type, xpos, ypos, itemWidth, itemHeight); 
  }
  
}

