
int time1= 4000;
PImage silver;
PImage bo;
PImage yellow;
PImage fullblue;
PImage golden;
PImage red;
PImage orange;
PImage light;
PImage blue;

void setup() {
  size(600, 300);
  yellow = loadImage ("yellow.jpg");
  fullblue = loadImage("fullblue.png");
  golden = loadImage("golden.png");
  red = loadImage ("red.png");
  orange = loadImage("orange.png");
  light= loadImage ("light.png");
  blue = loadImage ("blue.png");
  silver = loadImage ("silver.JPG");
  bo = loadImage ("bo.png");
  frameRate(1);

  imageMode(CENTER);
}

void draw() {
  // background(0);
  int timer = millis();
  println(timer);
  float x = random(width);
  float y = random(height);
  float d = random(100, 430);

 // int currentTime = millis();
  //if (currentTime<time1)
  {  
    image(fullblue, width/2, height/2, 663, 300);
 // }
 // if (currentTime>time1)

  //{


    image(red, width/2, height/2);
  //}
  //if (currentTime>time1+1000) {
    image(golden, 300, 150);
  //}
  //if (currentTime>time1+2000)
  //{
    image(light, 700, 150, 500, 500);
  //}
  //if (currentTime>time1+3000)
  //{
    image(yellow, 200, 150, 150, 700);
  //}

  //if (currentTime>time1+4000)
  //{

    image(orange, 410, 150);
  //}
  //if (currentTime>time1+5000)
  //{
    image(bo, 575, 150);
  //}
  //if (currentTime>time1+6000)
 // {
    image(silver, 10, 150);
  }
}


