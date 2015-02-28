
//Rosa Han
//Creative Computing Final project
//Catch the Mouse 


int STATE = 1;


PFont f;
PImage m;
PImage pw;
PImage smallMouse; 
PImage bigMouse; 
PImage cat;
PImage wowcat;
PImage sadcat;

int score = 0;

int miceNumber = 8;//setting up an array of mice
mouseClass[] mice = new mouseClass[miceNumber]; //my mice array. 

void setup() {

  size(500, 500);
  smooth();
  f = loadFont ("Rockwell-40.vlw");
  m = loadImage ("mouse.png");
  pw = loadImage ("paw.png");
  smallMouse = loadImage ("Bmouse.png");
  bigMouse = loadImage ("Pmouse.png");
  cat = loadImage ("kitty.png");
  wowcat = loadImage ("wowkitty.png");
  sadcat = loadImage ("sadkitty.png");
   
  for (int i = 0; i<mice.length; i++) { 
    if (i < miceNumber/2) {
      mice[i] = new mouseClass(random(width), random(height) - height, "big mouse");
       
    } else {
      mice[i] = new mouseClass(random(width), random(height) - height, "small mouse");
    }
  }
}

void draw() {
  if (STATE == 0) {
    cursor();
    //last page
    background(0);
    fill(255);
    textFont(f);
    textSize(30);
    text ("Try Again?", 180, 250);

    image (sadcat, 200, 280);

     if (dist(mouseX, mouseY, 193, 192) < 80) {
       image (wowcat, 192, 283);
     }
    if (keyPressed == true) {
      if (key == ' ') {
       STATE = 1;
      }
    }
  } else if (STATE == 1) {
    
    //first page
    background (255);
    fill (0);
    textFont (f);
    textSize (30);
    text ("Catch the", 100, 250);
    textSize (18);
    text("Click to start!", 300, 200);
    
     
    if (mousePressed == true) {
      STATE = 2;
    }
    score = 0;
    
    image (m, 220, 200);
  } 
  else if (STATE == 2) {
      noCursor();  

    //playing page
    background(255);
    fill (0);
    textFont (f);
    textSize (15);

    text ("Hits: "+ score, 10, 30); 

    image (cat, 200, 400);
      
    for (int i = 0; i<mice.length; i++) {
      mice[i].display();
    }

    tint (250, 250);
    image (pw, mouseX - 25, mouseY - 25);
     
    if ( score > 1000 ) {
      STATE = 0 ;
    }  
   
  }
}

class mouseClass {
  float x;
  float y;
  String type; 
  int counter; 
  int speedFrame;
  int yspeed = 3;

  mouseClass ( float xpos, float ypos, String _type) {
    x= xpos;
    y= ypos;
    type = _type; 
     
  }
  void display() {
    
    if (type == "big mouse") {
      image(bigMouse, x, y);
    }
    else {
    
      image(smallMouse, x, y);
    }
    y += yspeed;
    if (y > height) {
       
        resetMouse();
    }
  }
  void checkMouse() {
   
    float mouseDist;
    if (type =="big mouse") {
       
      mouseDist  = dist(x + 50, y + 50, mouseX, mouseY); 
      if (mouseDist < 50) {
        
        score += 10; 
        resetMouse();
      }
    }
    else if (type == "small mouse") {
      
      mouseDist  = dist(x + 25, y +25, mouseX, mouseY);
      if (mouseDist < 25) { 
        score += 20;
        resetMouse();
      }
    }
  }
  void resetMouse() {
    
    x = random(width);
    y = -100;
  }
}

void mousePressed() {
  
  for (int i = 0; i<mice.length; i++) {
    mice[i].checkMouse();
  }
}


