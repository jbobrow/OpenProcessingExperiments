
float rodona = 425; //tamany planetas
float brosa = 50; //tamany brosa

float p1posX = 450;
float p1posY = 0;
float p2posX = 450;
float p2posY = 650;
float cohposY = 325; //cohete
float metposX = 10; //meteorit
float metposY = 10; //metoerit
float bropos = 200; //posicio brosa

float i =0;

float velX =5;
float velY =5;
float metvelX = 6; //velocitat meteorit
float metvelY = 6; // velocitat meteorit

PImage univers;
PImage terra;
PImage lluna;
PImage brosaterra;
PImage brosaluna;
PImage cohete;
PImage meteorit;

void setup() {
  size (900, 650);
   meteorit = loadImage("meteorit.png");
  terra = loadImage("terra.png");
  univers = loadImage("univers.png");
  lluna = loadImage("lluna.png");
  brosaterra = loadImage("brosaterra.png");
  brosaluna = loadImage("brosaluna.png");
  cohete = loadImage("cohete.png");
}

void draw() {
    background(0);
    univers.resize(width,height);
    image(univers,width/2,height/2);
 
  //cohete

cohposY= cohposY +velY

imageMode(CENTER);
  image(cohete, width/2, cohposY, 40, 80);


  if ((cohposY>= 500)||(cohposY <= 150)) {
    velY = - velY;
  }

  resetMatrix();

  // terra
  translate(p1posX, p1posY);
  rotate(i/4);
  image(terra, 0, 0, rodona, rodona); //el centro tiene que ser 0,0!!
  resetMatrix();

  //brosa terra
  translate(p1posX, p1posY);
  rotate(i*1.5);
  image(brosaterra, bropos, bropos, brosa, brosa);
  resetMatrix();

  //lluna
  translate(p2posX, p2posY);
  rotate(-i/4);
  image(lluna, 0, 0, rodona, rodona);
  i =i + 0.01;
  resetMatrix();

  //brosa lluna
  translate(p2posX, p2posY);
  rotate(-i);
  image(brosaluna, bropos, bropos, brosa, brosa);
  i = i+ 0.01;
  
    // meteorit
  metposX = metposX + metvelX;
  metposY = metposY + metvelY;

  if ((metposX>= width)||(metposX <=0)) {
    metvelX = - metvelX;
  }

  if ((metposY>= height)||(metposY <=0)) {
    metvelY = - metvelY;
  } 

  image(meteorit, metposX, metposY, 35, 35);


}

void mousePressed() {
  velY = -velY;

  metvelY = random(-10, 10);
  metvelX = random(-10, 10);
}


