
//Katrina Gates, Tianna Woodford, Jasmine Roper


PImage bg;
PImage gg;
PImage pf;
PImage end;

PFont font;
int a = 6;

//int x = 0;   
int y = 0;     

float speed = 20;   

float gravity = 0.01;  

int [] locX = {
  (int)random(800), (int)random(800), (int)random(800), (int)random(800), (int)random(800)
};
int score = 0;

boolean falling = false;

Ipfmg ip;

Ipfmg[] img = new Ipfmg[a];

int savedTime;
int totalTime = 20000;


void setup() {
  size(882, 711);
  // setting up of images
  bg = loadImage("Dino_chicken_by_funkwood.jpg");

  image(bg, 0, 0, width, height);
  gg = loadImage("200_s.gif");
  image(gg, 100, 100, 100, 100);
  textSize(75);
    //flying pig pictures
  pf = loadImage("123567.jpg");
    //end photo
  end = loadImage("cage-wicker-man.jpg");

  for ( int i = 0; i<img.length; i ++) {
    img[i] = new Ipfmg();
  }
  savedTime = millis();
}

void draw() {
  background(bg);
  for (Ipfmg currentPig : img) {
    image(pf, currentPig.x, currentPig.y, 50, 50);

    currentPig.y = currentPig.y + currentPig.speed;

   //helps to keep track of the score
    if (mousePressed && dist(currentPig.x, currentPig.y, mouseX, mouseY)<=50) {
      score = score + 1;
      currentPig.y = 0;
      currentPig.x=(int)random(800); 
      
    }
   if(currentPig.y >= height) {
      currentPig.y = 0;
      currentPig.x=(int)random(800); 
   }
}
   //nicolas cages position on screen
  image(gg, width-100, height-100, 100, 100);

 
  //the lasers from nic's eyes
  stroke(255, 0, 0);
  strokeWeight(2);
  line(832, 640, mouseX, mouseY);
  line(845, 648, mouseX, mouseY);

//the actual writing of the score
  fill(255, 0, 0);
  textSize(60);
  text("score: "+score, 450, 100);
  
  //timer for the game
    int passedTime = millis();

  if (passedTime > totalTime) {
    noLoop();
    image(end,0,0,width,height);
    fill(255,0,0);
    text("Time's up!", 300,400);
    text("score: "+score, 450, 100);

  }
}

class Ipfmg {
  public int x;
  public float y;
  public float speed;

  Ipfmg () {
    x = int(random(width));
    y = -(0);
    speed  = random(5, 10);
  }
}
