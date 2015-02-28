
int number;
String prompt = "Score: ";
String typedText = "";
String message = " ";
String promptt = "Time: ";
String typedTextt = "";
String messagee = " ";
String prompttt = "Level: ";
String typedTexttt = "";
String messageee = " ";
String promptttt = "    Get to the green space!        ALT = Shoot        Arrows = Move";
String typedTextttt = "";
String messageeee = " ";
PFont font;
PFont fontt;
PFont fonttt;
PFont fontttt;
float bunnyX, bunnyY;
float carrotX, carrotY;
float carrot2X, carrot2Y;
float carrot3X, carrot3Y;
float carrot4X, carrot4Y;
float carrot5X, carrot5Y;
float carrot6X, carrot6Y;
float lazarX, lazarY;
float ammoX, ammoY;
float cometX, cometY;
float comet2X, comet2Y;
float comet3X, comet3Y;
float comet4X, comet4Y;
float comet5X, comet5Y;
float comet6X, comet6Y;
float groundX, groundY;
float rocketX, rocketY;
float backgrounddX, backgrounddY;
PImage ammo;
PImage bunny;
PImage carrot;
PImage carrot2;
PImage carrot3;
PImage carrot4;
PImage carrot5;
PImage carrot6;
PImage lazar;
PImage rocket;
PImage backgroundd;
PImage ground;
PImage comet;
PImage comet1;
PImage comet2;
PImage comet3;
PImage comet4;
PImage comet5;
PImage comet6;
float speed;
float ammoSpeed;
int move;
int moove;
int mooove;
int time = 500;
int level = 1;
int points;
int fast1;
int fast2;
int fast3;
int num = 1000;
float bob = 1;
int joe;

void setup() {
  size(800, 600);
  speed = 6;
  ammoSpeed = 20;
  bunny = loadImage("bunny.png");
  bunnyY = 400;
  bunnyX = 60;
  lazarY = 370;
  lazarX = 500;
  bob = int(joe*1.4);
  fast1 = 4;
  fast2 = 5;
  fast3 = 6;
  ammoX = lazarX+45;
  ammoY = lazarY;
  carrotY = 75;
  carrotX = 800;
  carrot2Y = 175;
  carrot2X = 900;
  carrot3Y = 275;
  carrot3X = 1000;
  carrot4Y = 75;
  carrot4X = 900;
  carrot5Y = 175;
  carrot5X = 1200;
  carrot6Y = 275;
  carrot6X = 1300;
  cometX = 1100;
  cometY = 75;
  comet2X = 1400;
  comet2Y = 175;
  comet3X = 600;
  comet3Y = 275;
  comet4X = 1300;
  comet4Y = 75;
  comet5X = 1100;
  comet5Y = 175;
  comet6X = 2000;
  comet6Y = 275;
  groundX = 0;
  groundY = 450;
  rocketX = 780;
  rocketY = 0;
  backgrounddX = 0;
  backgrounddY = 0;
  ammo = loadImage("ammo.png");
  backgroundd = loadImage("background.png");
  ground = loadImage("ground.png");
  rocket = loadImage("rocket.png");
  carrot = loadImage("carrot.png");
  carrot2 = loadImage("carrot.png");
  carrot3 = loadImage("carrot.png");
  carrot4 = loadImage("carrot.png");
  carrot5 = loadImage("carrot.png");
  carrot6 = loadImage("carrot.png");
  comet = loadImage("comet.png");
  comet2 = loadImage("comet.png");
  comet3 = loadImage("comet.png");
  comet4 = loadImage("comet.png");
  comet5 = loadImage("comet.png");
  comet6 = loadImage("comet.png");
  lazar = loadImage("lazar.png");
  font = createFont("Helvetica", 18);  
  fill(255);
  textFont(font);
}

void draw() {
  fill(255);
  image(backgroundd, backgrounddX, backgrounddY);
  time = time -1;
  image(ground, groundX, groundY);
  image(rocket, rocketX, rocketY);
  image(carrot, carrotX, carrotY);
  image(carrot2, carrot2X, carrot2Y);
  image(carrot3, carrot3X, carrot3Y);
  image(carrot4, carrot4X, carrot4Y);
  image(carrot5, carrot5X, carrot5Y);
  image(carrot6, carrot6X, carrot6Y);
  image(comet, cometX, cometY);
  image(comet2, comet2X, comet2Y);
  image(comet3, comet3X, comet3Y);
  image(comet4, comet4X, comet4Y);
  image(comet5, comet5X, comet5Y);
  image(comet6, comet6X, comet6Y);
  image(ammo, ammoX, ammoY);
  image(lazar, lazarX, lazarY);
  text(prompt+ typedText+(frameCount/10 % 2 == 0 ? points : ""), 10, 45);
  text(promptt+ typedTextt+(frameCount/10 % 2 == 0 ? time : ""), 10, 65);
  text(prompttt+ typedTexttt+(frameCount/10 % 2 == 0 ? level : ""), 10, 85);
  fill(0);
  text(promptttt+ typedTextttt+(frameCount/1 % 2 == 0 ? "" : ""), 10, 575);
  image(bunny, bunnyX, bunnyY);
  carrotX = carrotX-fast1;
  carrot2X = carrot2X-fast3;
  carrot3X = carrot3X-fast2;
  carrot4X = carrot4X-fast1;
  carrot5X = carrot5X-fast3;
  carrot6X = carrot6X-fast2;
  cometX = cometX-fast1;
  comet2X = comet2X-fast3;
  comet3X = comet3X-fast2;
  comet4X = comet4X-fast1;
  comet5X = comet5X-fast3;
  comet6X = comet6X-fast2;
  if (ammoY < 0) {
    ammoX = lazarX+45;
    ammoY = lazarY;
    ammoSpeed = 0;
  }
  if (carrotX < 0) {
    carrotX=800;
  }
  if (carrot2X < 0) {
    carrot2X=800;
  }
  if (carrot3X < 0) {
    carrot3X=800;
  }
  if (carrot4X < 0) {
    carrot4X=800;
  }
  if (carrot5X < 0) {
    carrot5X=800;
  }
  if (carrot6X < 0) {
    carrot6X=800;
  }
  if (cometX < 0) {
    cometX=800;
  }
  if (comet2X < 0) {
    comet2X=800;
  }
  if (comet3X < 0) {
    comet3X=800;
  }
  if (comet4X < 0) {
    comet4X=800;
  }
  if (comet5X < 0) {
    comet5X=800;
  }
  if (comet6X < 0) {
    comet6X=800;
  }
  if (move < 2) {
    bunnyY = 370;
  }
  if (move == 2) {
    bunnyY = bunnyY - speed;
  }
  if (move == 3) {
    bunnyY = bunnyY + speed;
  }
  if (move == 4) {
    bunnyX = bunnyX + speed;
  }
  if (move == 5) {
    bunnyX = bunnyX - speed;
  }
  if (moove == 6) {
    ammoY = ammoY - ammoSpeed;
  }
  if (mooove == 10) {
    //comet6Y = -2000;
    
   //BEFORE CHANGES Comet Y un canceled, Comet X's ALL = 900
    comet6X = 1000;
  }
  if (mooove == 11) {
   // comet5Y = -2000;
    comet5X = 1000;
  }
  if (mooove == 12) {
  //  comet4Y = -2000;
    comet4X = 1000;
  }
  if (mooove == 13) {
   // comet3Y = -2000;
  comet3X = 1000;
  }
  if (mooove == 14) {
   // comet2Y = -2000;
    comet2X = 1000;
  }
  if (mooove == 15) {
  //  cometY = -2000;
   cometX = 1000;
  }
  if (bunnyY < 0) {
    bunnyY = 0;
  }
  if (bunnyY > 370) {
    bunnyY = 370;
  }
  if (bunnyX < 10) {
    bunnyX = 10;
  }
  if (sqrt(sq(bunnyX-carrotX)+sq(bunnyY-carrotY))<20) {
    points = points +50;
    time = time + 50;
    carrotX = 900;
    carrotY = -2000;
  }
  if (sqrt(sq(bunnyX-carrot2X)+sq(bunnyY-carrot2Y))<20) {
    points = points +50;
    time = time + 50;
    carrot2X = 900;
    carrot2Y = -2000;
  }
  if (sqrt(sq(bunnyX-carrot3X)+sq(bunnyY-carrot3Y))<20) {
    points = points +50;
    time = time + 50;
    carrot3X = 900;
    carrot3Y = -2000;
  }
  if (sqrt(sq(bunnyX-carrot4X)+sq(bunnyY-carrot4Y))<20) {
    points = points +50;
    time = time + 50;
    carrot4X = 900;
    carrot4Y = -2000;
  }
  if (sqrt(sq(bunnyX-carrot5X)+sq(bunnyY-carrot5Y))<20) {
    points = points +50;
    time = time + 50;
    carrot5X = 900;
    carrot5Y = -2000;
  }
  if (sqrt(sq(bunnyX-carrot6X)+sq(bunnyY-carrot6Y))<20) {
    points = points +50;
    time = time + 50;
    carrot6X = 900;
    carrot6Y = -2000;
  }
  if (sqrt(sq(ammoX-comet6X)+sq(ammoY-comet6Y))<50) {
    points = points+25;
    time = time + 50;
    mooove = 10;
  }
  if (sqrt(sq(ammoX-comet5X)+sq(ammoY-comet5Y))<50) {
    points = points+25;
    time = time + 50;
    mooove = 11;
  }
  if (sqrt(sq(ammoX-comet4X)+sq(ammoY-comet4Y))<50) {
    points = points+25;
    time = time + 50;
    mooove = 12;
  }
  if (sqrt(sq(ammoX-comet3X)+sq(ammoY-comet3Y))<50) {
    points = points+25;
    time = time + 50;
    mooove = 13;
  }
  if (sqrt(sq(ammoX-comet2X)+sq(ammoY-comet2Y))<50) {
    points = points+25;
    time = time + 50;
    mooove = 14;
  }
  if (sqrt(sq(ammoX-cometX)+sq(ammoY-cometY))<50) {
    points = points+25;
    time = time + 50;
    mooove = 15;
  }
  if (sqrt(sq(bunnyX-cometX)+sq(bunnyY-cometY))<60) {
    points = 0;
    level = 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
    time = 500;
    num = 1000;
  }
  if (sqrt(sq(bunnyX-comet2X)+sq(bunnyY-comet2Y))<60) {
    points = 0;
    level = 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
    time = 500;
    num = 1000;
  }
  if (sqrt(sq(bunnyX-comet3X)+sq(bunnyY-comet3Y))<60) {
    points = 0;
    level = 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
    time = 500;
    num = 1000;
  }
  if (sqrt(sq(bunnyX-comet4X)+sq(bunnyY-comet4Y))<60) {
    points = 0;
    level = 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
    time = 500;
    num = 1000;
  }
  if (sqrt(sq(bunnyX-comet5X)+sq(bunnyY-comet5Y))<60) {
    points = 0;
    level = 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
    time = 500;
    num = 1000;
  }
  if (sqrt(sq(bunnyX-comet6X)+sq(bunnyY-comet6Y))<60) {
    points = 0;
    level = 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
    time = 500;
    num = 1000;
  }
  if (num == 0) {
    level = 1;
    points = 0;
    time = 500;
    num = 1000;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
  }
  if (time == 0) {
    level = 1;
    points = 0;
    time = 500;
    num = 1000;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=4;
    fast2=5;
    fast3=6;
  }
  if (sqrt(sq(bunnyX-rocketX)+sq(bunnyY-rocketY))<30) {
    time = 500;
    level = level + 1;
    bunnyY=400;
    bunnyX=60;
    carrotY = 75;
    carrotX = 800;
    carrot2Y = 175;
    carrot2X = 900;
    carrot3Y = 275;
    carrot3X = 1000;
    carrot4Y = 75;
    carrot4X = 900;
    carrot5Y = 175;
    carrot5X = 1200;
    carrot6Y = 275;
    carrot6X = 1300;
    cometX = 1100;
    cometY = 75;
    comet2X = 1400;
    comet2Y = 175;
    comet3X = 600;
    comet3Y = 275;
    comet4X = 1300;
    comet4Y = 75;
    comet5X = 1100;
    comet5Y = 175;
    comet6X = 2000;
    comet6Y = 275;
    move = 3;
    fast1=fast1 + 2;
    fast2=fast2 + 2;
    fast3=fast3 + 2;
  }

  if(bunnyX > 751){
    bunnyX = 751;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    move = 2;
  } 
  if (keyCode == DOWN) {
    move = 3;
  } 
  if (keyCode == RIGHT) {
    move = 4;
  } 
  if (keyCode == LEFT) {
    move = 5;
  }
  if (keyCode == ALT) {
    moove = 6;
    ammoSpeed = 20;
  }
}




