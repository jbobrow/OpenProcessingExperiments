
float[] circleX = new float[10];
float[] circleY= new float[10];
float[] yVel= new float [10];
PImage[] racers = new PImage[10];
String[] files = {"Koi.gif", "RedDog.gif", "PurpGuy.gif", "Bluehound.gif", "Doggie.gif", "Pointy.gif", "Woof.gif"};
//float[] explsion = new float;


int colorR;
int colorG;
int colorB;

////instatiate all potential racers
PImage fish;
PImage Rdog;
PImage Pdog;
PImage Bdog;
PImage Dog;
PImage Pointy;
PImage Woof;

PFont myFont;

void setup() {
  size(400, 500);
  smooth();
  frameRate(25);
  stroke(150);
  fill(0);

  colorR = (int)random(0, 225);
  colorG = (int)random(0, 255);
  colorB = (int)random(0, 255);  

  fish =loadImage("Koi.gif"); 
  Rdog = loadImage("RedDog.gif");
  Pdog = loadImage("PurpGuy.gif");

  myFont = loadFont("AcademyEngravedLetPlain-25.vlw");

  for (int i =0; i<10; i++) {
    circleX[i] = 40*(i+1);
    circleY[i]= 0;
    yVel[i]=random(1, 1.5);
    racers[i] = loadImage(files[(int)random(files.length)]);
    println((int)random(files.length));
  }
  }



void draw() {
  background(colorR, colorG, colorB);
  pushStyle();
  fill(255);
  rect(200, 300, 100, 50);
  textFont(myFont);
  fill(0);
  text("reset", 225, 330);
  popStyle();

  for (int i =0; i <10; i++) {
    //    image[i] = loadImage("racers"); //0racers
    image(racers[i], circleX[i], circleY[i]);
    // ellipse(circleX[i], circleY[i], 15, 15);
  }
  update();

}
 void update() {

    for (int i = 0; i < 10; i++) {
      yVel[i] = yVel[i] + random(-0.4, 0.4);
    }

    for (int i =0; i <10; i++) {
      if (yVel[i] <= 0.2) {
        yVel[i] = random(0.2, 0.4);
      }

      circleY[i] = circleY[i]+yVel[i];
      circleX[i] = 40*(i+1);

      if (circleY[i] + 15 >= height) {
        //  println("done");

        //    if(racers[i] <= height){
        //      explosion(
        //    }
      }
    }
  }

  void mouseClicked() {
    if (mouseX>=200 && mouseX<=300 && mouseY>=300 && mouseY<=350) {
      setup();
    }
  }
  


