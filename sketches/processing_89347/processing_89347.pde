
/* @pjs fontlight="Raleway-Light.ttf"; */
/* @pjs fontbold="Raleway-Bold.ttf"; */

PFont fontlight;
PFont fontbold;
PImage img;
int titlex;
int conx;
ArrayList water;

void setup() {
  size(1350,992);
  fontlight = createFont("Raleway-Light.ttf", 30);
  fontbold = createFont("Raleway-Bold.ttf", 110);
  img = loadImage("raingarden.jpeg");
  titlex = 0;
  conx = 1355;
  water = new ArrayList();
}

void draw() {
  background(255);
  image(img, 0, 0);

//Once title and content moved
  if (titlex == 1200 & conx == 55) {
    startWater();
  }

//Title
  textFont(fontbold);
  textAlign(RIGHT);
  
  //Psuedo outline
  fill(255);
  text("What is a rain garden?", titlex,109);
  text("What is a rain garden?", titlex,111);
  text("What is a rain garden?", titlex+1,109);
  text("What is a rain garden?", titlex+1,111);
  text("What is a rain garden?", titlex-1,109);
  text("What is a rain garden?", titlex-1,111);
  
  text("What is a rain garden?", titlex,108);
  text("What is a rain garden?", titlex,112);
  text("What is a rain garden?", titlex+2,108);
  text("What is a rain garden?", titlex+2,112);
  text("What is a rain garden?", titlex-2,108);
  text("What is a rain garden?", titlex-2,112);

  //Title text
  fill(0);
  text("What is a rain garden?", titlex,110);
  
  //Move title
  moveTitle();
  
//Content

  //Alpha box
  fill(255,255,255,190);
  noStroke();
  rect(conx,143,910,330);
  
  //Content text
  textFont(fontlight);
  textAlign(LEFT);
  fill(0);
  text("A rain garden is a garden designed to catch and absorb rainwater", conx+10, 180);
  text("before it flows into storm drains or nearby surface waters.", conx+10, 215);
  text("Rainwater runoff, especially, from urban areas like roofs and", conx+10, 280);
  text("driveways, can lead to water pollution, erosion, and flooding.", conx+10, 315);
  text("Rain gardens can cut down on the amount of pollution reaching", conx+10, 380);
  text("creeks and streams by up to 30% while also serving as a", conx+10, 415);
  text("beautiful addition to any property.", conx+10, 450);
  
  //Move content
  moveContent();
  
}

void mousePressed() {
  titlex=0;
  conx=1350;
  }
  
void moveTitle() {
  if (titlex <= 1181) {
    titlex = titlex + 9;
  } else {titlex = 1200;}
}

void moveContent() {
  if (conx >= 56) {
    conx = conx - 10;
  } else {conx = 55;}
}

void startWater() {
  
  water.add(new Drop());

  for (int i=0 ; i < water.size() ; i++) {
    Drop thisDrop = (Drop) water.get(i);
    thisDrop.display();
  }
}
class Drop {
  
  boolean alive;
  PVector position;
//  PVector velocity;
  float xPos;
  float yPos;
  float rad;
  int age;
  float a;
  float ranendx;
  float ranendy;
  float ranendy2;
    float ranendy3;
  int velo;
  
  
  Drop() {
  alive = true;
  a = 255;
  position = new PVector(random(1350),-10);

  velo = 10;
//  velocity = new PVector(0,3);

  rad = random(0,10);
  age = 0;
  ranendx = 400+random(800);
  ranendy = 630+random(50);
  ranendy2 = 620+random(100);
  ranendy3 = 600+random(170);  
  }
  
  void display() {
    age++;
    stroke(0,255,255,a);
    fill(0, 100, 255,a);
    ellipse(position.x, position.y, 5+rad, 5+rad);

    drive();

    if (age>190){
      alive = false;
  }
    if (age>180)
    a = 255 - (age-179)*25.5;
  //println(age);
  
  }
  
  void drive() {
//    if (age<90){
  if (position.x <= 180){
    position.y = position.y + velo;
  }

  if (position.x >= 181 & position.x <= 400){
    
    if (position.y >= ranendy) {
        position.y = position.y;
    } else {position.y = position.y + velo;}
  }

  if (position.x >= 401 & position.x <= 650){
    if (position.y >= ranendy2) {
        position.y = position.y;
    } else {position.y = position.y + velo;}
  }


  if (position.x >= 651 & position.x <= 1200){
    if (position.y >= ranendy3) {
        position.y = position.y; 
    } else {position.y = position.y + velo;}
  }
    
    
  if (position.x >= 1201) {
    position.y = position.y + velo;
  }
    /*    velocity.x = ((400+ranendx)- position.x)/40;
    velocity.y = ((665+ranendy) - position.y)/40;
    //x += xVel;
    //y += yVel;
    position.add(velocity);
  */  
    }

  }
  



  
    
    

    



