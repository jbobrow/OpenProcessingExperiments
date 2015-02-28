

PImage Bird;
PImage Boy;
PImage BG;
int recW = 30;
int recH = 20;
int rxPos;
int ryPos;
int boySpeed = 100;

Bird myBird1;
Bird myBird2;
Bird myBird3;
Bird myBird4;

Boy myBoy;
//Movie movie;
Gui myGui;


void setup() {
  size (1200, 1000);

  myBird1 = new Bird("Bird1", 1, 0, 350, 6);
  myBird2 = new Bird("Bird2", 1, 0, 100, 4);
  myBird3 = new Bird("Bird3", 1, 0, 200, 100);
  myBird4 = new Bird("Bird4", 1, 0, 345, 10);
  myBoy = new Boy("Boy", 1, 50, 50, 10);
  BG = loadImage ("BG.PNG"); // movie = new Movie(this, "Spectrum.mov");
 //movie.loop();
  myGui = new Gui("Handwriting-Dakota-48.vlw", 40, 0, 0);
 
 
}

void draw() {
  background(13,178,210);
  levels();
}

void levels() {
  if (myGui.level == 0) {
    myGui.fontLoader();
    myGui.startMenu();
  }

  if (myGui.level == 1) {
   tint(255,128);
  image(BG,600,500);
  noTint();
  
 myBoy.display();
    myBoy.keyEvents();
    myBoy.collide();
    myBird1.exist();
    myBird1.drift();
    myBird2.exist();
    myBird2.drift();
    myBird3.exist();
    myBird3.drift();
    myBird4.exist();
    myBird4.drift();
 
    myGui.levelDisplay();
    myGui.health();
  }
  
  
  

}

//declare class
class Bird{
  float xpos;
  float ypos;
  float xspeed;
  PImage[] images;
  int imageCount;
  int frame;

  //Constructor
  Bird(String imagePrefix, int count, float tempXpos, float tempYpos, float tempXspeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    
     imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png"; 
      images[i] = loadImage(filename);
    }
  }

  void exist() {
    imageMode(CENTER);
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }

  void drift() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
      ypos = random(height);
      xspeed = random(25);
    }
  }
}
class Boy {
  PImage[] images;
  int imageCount;
  int frame;
  float xpos;
  float ypos;
  float speed;

 Boy(String imagePrefix, int count, float tempXpos, float tempYpos, float tempSpeed ) {
    xpos = tempXpos;
    ypos = tempYpos;
    speed = 20;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png"; 
      images[i] = loadImage(filename);
    }
  }

  void display() {
    imageMode(CENTER);
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
 void keyEvents() {
  if (keyPressed) {
    if (key == 'd') {
      xpos += speed ;
    }
    if (key == 'a') {
      xpos -= speed;
    }
    if (key == 's') {
      ypos += speed;
    }
    if (key == 'w') {
      ypos -= speed;
    }
  }
}

void collide(){
  int sense = 90;
  if(xpos >= (myBird1.xpos - sense) && xpos <= (myBird1.xpos + sense) && ypos <= (myBird1.ypos + sense) && ypos >= (myBird1.ypos - sense)){
    myBird1.xpos = width;
    myBird1.ypos = random(height);
    myBird1.xspeed = random(25);
    myGui.health -= 5;
  }
  else if(xpos >= (myBird2.xpos - sense) && xpos <= (myBird2.xpos + sense) && ypos <= (myBird2.ypos + sense) && ypos >= (myBird2.ypos - sense)){
    myBird2.xpos = width;
    myBird2.ypos = random(height);
    myBird2.xspeed = random(25);
    myGui.health -= 5;
  }
  else if(xpos >= (myBird3.xpos - sense) && xpos <= (myBird3.xpos + sense) && ypos <= (myBird3.ypos + sense) && ypos >= (myBird3.ypos - sense)){
    myBird3.xpos = width;
    myBird3.ypos = random(height);
    myBird3.xspeed = random(25);
    myGui.health -= 5;
  }
  else if(xpos >= (myBird4.xpos - sense) && xpos <= (myBird4.xpos + sense) && ypos <= (myBird4.ypos + sense) && ypos >= (myBird4.ypos - sense)){
    myBird4.xpos = width;
    myBird4.ypos = random(height);
    myBird4.xspeed = random(35);
    myGui.health += 1;
  }
}
  
  int getWidth() {
    return images[0].width;
  }
  
}


class Gui{
  PFont ourFont;
  String fontStyle;
  int fontSize;
  int health;
  int level;
  
  Gui(String tempFontStyle, int tempFontSize, int tempHealth, int tempLevel){
    fontStyle = tempFontStyle;
    fontSize = tempFontSize;
    health = 101;
    level = tempLevel;
  }
  
  void fontLoader(){
    ourFont = loadFont(fontStyle);
    textFont(ourFont, fontSize);
  }
  
  void health(){
    fill(0,0,0,235);
   
    text("health" +" " + "=" + " " + health, 125, 50);
  }
  
   void levelDisplay() {
    fill(0, 0, 0, 250);
    text("level" + " " + "=" + " " + level, 1000, 50);
  }
  
  void startMenu() {
    fill(0, 0, 0, 235);
    textAlign(CENTER);
    text("Finding the way Home", width/2, height/2);
    if (mouseX >= (width/2 - 70) && mouseX <= (width/2 + 70) && mouseY >= (height/2 - 20) && mouseY <= (height/2 + 20) && mousePressed) {
      level = 1;
    }
  }
  
  
  
}


