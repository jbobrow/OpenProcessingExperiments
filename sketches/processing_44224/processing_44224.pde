
PImage kitkat, dance;
//loopingGif;
//PImage[] animation;
///Gif loopingGif;
//rGif nonLoopingGif;
//boolean pause = false;



void setup() {
  size (500, 500);
  kitkat = loadImage ("kitkat1.png"); 
  dance = loadImage("catgif.gif");
  frameRate(40);
  //loopingGif = new Gif(this, "catgif.gif");
  //loopingGif.loop();
  //nonLoopingGif = new Gif(this, "catgif.gif");
  //nonLoopingGif.play();
  smooth();
  noStroke();
  imageMode(CENTER);
}

int numObjects = 10;
int centerX = 250;
int centerY = 250;
int distance = 50;


void draw() {
  background(201,249,252);

  float angleObject = (TWO_PI/numObjects);
  pushMatrix();
  translate(width/2, height/2);
  image(dance, 0, 0);
  popMatrix();

  for (int i =0; i<numObjects; i++)
  {

    float posX = centerX -distance*sin(angleObject*i+frameCount*0.1);
    float posY = centerY+ distance*cos(angleObject*i+frameCount*0.1);

    pushMatrix();
    translate(posX, posY);
    rotate(angleObject*i+frameCount*0.1);
    image(kitkat, 115, 0, kitkat.width*.6,kitkat.height*.6);
    image(dance, 157.5, 0, dance.width*.65, dance.height*.65);
    image(kitkat, 210, 0, kitkat.width*.65, kitkat.height*.65);
    image(dance, 275, 0, dance.width, dance.height);
    image(kitkat, 430, 0, kitkat.width*.75, kitkat.height*.75);
    image(dance, 500, 0, dance.width, dance.height);
    popMatrix();
  }
}


