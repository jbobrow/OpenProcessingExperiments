



//PImage img;
City blackcity;
Human myHuman;  

PImage guy;
PImage guyjump;

float textX;
float textY;
float oX;  //for obstacle position x
float oY = 300; //for obstacle position y

float worldX;   // moving the world~ (the scene)
float worldY;

float yspeed = 0;
float gravity = -0.3;

boolean spacePressed;

void setup() {
  size(900, 800);
  guy = loadImage("pixelperson2.png");
  guyjump = loadImage("pixelpersonjump.png");
  
  blackcity = new City(200, 200);
  myHuman = new Human(300, 300);
  worldY = 10;
}

void draw() {
  background(10, 180, 250);
  sun();
  blackcity.run();  
  road();
  obstacle();
  myHuman.display();
  

  // road();
  //image(img, 200,300);
  
  //jumping``````````````````//jumping``````````````````
  
  blackcity.buildingposY += yspeed;
  if ( blackcity.buildingposY > 680 ) {
    yspeed += gravity;
  } else {
    blackcity.buildingposY = 680;
  }
  
  if (spacePressed) {
     yspeed = 12;
  } 
  println(yspeed);
  //jumping``````````````````//jumping``````````````````

//  if (blackcity.buildingposY > height ) { 
//    speed = speed * -0.8;
//  }
}

void road(){
    fill(80);
    rect(0,blackcity.buildingposY,width,100);
}


void obstacle(){
    fill(100,200,100);
    
    rect(oX,blackcity.buildingposY-350,80,400);
    oX -= 3;

   if(oX < 0){
    oX = width; 
    }
}


void sun() {
  noStroke();
  fill(200, 200, 10);  
  ellipse(100, 150, 50, 50);
}

void keyPressed() {
  if ( key == ' ' ) {
    spacePressed = true;
  }
} 

void keyReleased() {
  if ( key == ' ' ) {
    spacePressed = false;
  }
}


class City {


  float x = 0;
  float y = 0;
  float buildingposX1 = 10;
  float buildingposX2 = 30;
  float buildingposX3 = 60;
  float buildingposX4 = 120;
  float buildingposX5 = 180;
  float buildingposX6 = 240;
  float buildingposX7 = 300;
  float buildingposX8 = 370;
  float buildingposX9 = 410;
  float buildingposX10 = 480;
  float buildingposX11 = 530;
  float buildingposX12 = 570;
  float buildingposX13 = 610;
  float buildingposX14 = 650;
  float buildingposX15 = 700;
  float buildingposX16 = 760;
  float buildingposX17 = 810;
  float buildingposX18 = 880;
  float buildingposX19 = 910;
  float buildingposX20 = 970;
  float buildingposX21 = 80;

  float buildingposY = 680;

  City(float x, float y) {
    
  }

  //functionality
  //everything runs through here
  void run() {
    display();
    move();
  }


  void move() {  //speed
    buildingposX1 -= 2;
    buildingposX2 -= 2;
    buildingposX3 -= 2;
    buildingposX4 -= 2;
    buildingposX5 -= 2;
    buildingposX6 -= 2;
    buildingposX7 -= 2;
    buildingposX8 -= 2;
    buildingposX9 -= 2;
    buildingposX10 -= 2;
    buildingposX11 -= 2;
    buildingposX12 -= 2;
    buildingposX13 -= 2;
    buildingposX14 -= 2;
    buildingposX15 -= 2;
    buildingposX16 -= 2;
    buildingposX17 -= 2;
    buildingposX18 -= 2;
    buildingposX19 -= 2;
    buildingposX20 -= 2;
    buildingposX21 -= 2;


    if (buildingposX1 < 0) {
      fill(random(255));
      buildingposX1 = width;
    }
    if (buildingposX2 < 0) {
      fill(random(255));
      buildingposX2 = width;
    }
    if (buildingposX3 < 0) {
      fill(random(255));
      buildingposX3 = width;
    }
    if (buildingposX4 < 0) {
      buildingposX4 = width;
    }
    if (buildingposX5 < 0) {
      buildingposX5 = width;
    }
    if (buildingposX6 < 0) {
      buildingposX6 = width;
    }
    if (buildingposX7 < 0) {
      buildingposX7 = width;
    }
    if (buildingposX8 < 0) {
      buildingposX8 = width;
    }
    if (buildingposX9 < 0) {
      buildingposX9 = width;
    }
    if (buildingposX10 < 0) {
      buildingposX10 = width;
    }
    if (buildingposX11 < 0) {
      buildingposX11 = width;
    }
    if (buildingposX12 < 0) {
      buildingposX13 = width;
    }
    if (buildingposX13 < 0) {
      buildingposX14 = width;
    }
    if (buildingposX14 < 0) {
      buildingposX14 = width;
    }
    if (buildingposX15 < 0) {
      buildingposX15 = width;
    }
    if (buildingposX16 < 0) {
      buildingposX16 = width;
    }
    if (buildingposX17 < 0) {
      buildingposX17 = width;
    }
    if (buildingposX18 < 0) {
      buildingposX18 = width;
    }
    if (buildingposX19 < 0) {
      buildingposX19 = width;
    }
    if (buildingposX20 < 0) {
      buildingposX20 = width;
    }
    if (buildingposX21 < 0) {
      buildingposX21 = width;
    }
  }

  void display() {
    fill(90);
    rect(buildingposX1, buildingposY, 70, -120);
    rect(buildingposX2, buildingposY, 70, -400);
    rect(buildingposX3, buildingposY, 70, -80);
    rect(buildingposX4, buildingposY, 70, -100);
    rect(buildingposX5, buildingposY, 80, -80);
    rect(buildingposX6, buildingposY, 80, -80);
    rect(buildingposX7, buildingposY, 80, -100);
    rect(buildingposX8, buildingposY, 90, -120);
    rect(buildingposX9, buildingposY, 70, -300);
    rect(buildingposX10, buildingposY, 80, -50);
    rect(buildingposX11, buildingposY, 80, -60);
    rect(buildingposX12, buildingposY, 90, -80);
    rect(buildingposX13, buildingposY, 80, -345);
    rect(buildingposX14, buildingposY, 80, -70);
    rect(buildingposX15, buildingposY, 80, -150);
    rect(buildingposX16, buildingposY, 80, -200);
    rect(buildingposX17, buildingposY, 80, -50);
    rect(buildingposX18, buildingposY, 80, -80);
    rect(buildingposX19, buildingposY, 80, -400);
    rect(buildingposX20, buildingposY, 90, -340);
    rect(buildingposX21, buildingposY, 90, -140);

   // fill(80);
   // rect(0, 680, width, 120);  // building blockgate
  }
}



class Human {
  
  
  Human(float x, float y) {
  }
  
  float speed;   // speed of square 
  float w;  
  
  float x = 100;
  float y = 660;
  float speedY = 6;
  float gravityY = 0.5;
  
  // be comfortable with this!!
  void move() {   //building a jump motion
     // Add speed to location
    y = y + speed; 
    // Add gravity to speed
    speed = speed + gravity; 

    // If square reaches the bottom 
    // Reverse speed 
    if (y > height ) { 
      speed = speed * -0.8;  
    } 
     
     
    }
  
  void display() {

    imageMode(CENTER);  
    image(guy, x, y, 100,100);
    
  }
  

  
  
}



