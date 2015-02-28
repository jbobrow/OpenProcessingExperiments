
PImage img;  
PImage drop;

float yDropPos;
float xDropPos;
float ySpeed = 6;
float yDirection = 1;


void setup() {
  size(500,500);
  img = loadImage("faucet.png");
  stroke(255, 100);
    frameRate(30);



  //load droplet of water + things to do with it
  drop = loadImage("drop.png");
  xDropPos = 225;
  yDropPos = 340; 
}

void draw() {
  background(0);
    noStroke();
  image(img,0,0);
    smooth();
  rectMode(CENTER);

//TIME ints that have to be IN THE DRAW LOOP
  int mil = millis();
  int s = second();
  int m = minute();
  int h = hour();


  //----------ACTUAL HOURGLASS THINGS TO DO WITH TIME
  //droplet
  yDropPos = yDropPos + (ySpeed + yDirection);

  if (yDropPos < 500 || yDropPos < 252) {
    yDirection*= -1;
    image (drop, xDropPos, yDropPos);
  }
  //reset droplette position
  if(yDropPos >1000){
    yDropPos=340;
  }
}


  




