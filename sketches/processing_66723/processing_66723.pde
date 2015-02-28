
// create font
PFont Lfont;
PFont Rfont;
PFont Alert;
//set text positions
int LPosX = 50;   
int LPosY = 50;
int RPosX = 400;  
int RPosY = 50;
int AlertX = 100; 
int AlertY = 200; 
int counterX;
int counterY;

float red = 0.0;
float green = 0.0;

int ballsize = 30; //dictates ball movement

void setup() {

  size(500, 400);
  frameRate(100); // framerate to adjust speed of ball
  smooth();
  //write text

  Lfont = loadFont("Cochin-Bold-48.vlw");
  Rfont = loadFont("Antipasto-48.vlw");
  Alert = loadFont("Kibbleznobitz-48.vlw");

  counterX = width/2;
  counterY = height/2;

  red = 0;
  green = 0;
}

void draw() {
  drawRect();//refresh background
  addText();//add text
  
  noStroke();
  fill(red, green, 0);
  ellipse(counterX, counterY, ballsize, ballsize); 
  colorupdate();
  ballmove();
}  

//function of ball
void ballmove() {
  if (mouseX > width/2) {
    counterX++;
  }
  if (mouseX < width/2) {
    counterX--;
  }
  if (mouseY > height/2) {
    counterY++;
  }
  if (mouseY < height/2) {
    counterY--;
  }
  if (counterX > width-ballsize/2 || counterX < ballsize/2 || counterY> height - ballsize/2 || counterY< ballsize/2) {
    fill(0);
    textFont(Alert); 
    text("Come Back!", AlertX, AlertY);
  }
}

// add Text
void addText(){
  fill(255, 0, 0);
  textFont(Lfont, 20);
  text("Red", LPosX, LPosY);

  fill(0, 255, 0);
  textFont(Rfont, 20);
  text("Green", RPosX, RPosY);

}
// ball color update
void colorupdate() {  
  for (int i=0; i <= 255; i++) {
    if (counterX > width/2) {
      green = i;
      red = 0;
    }
    if (counterX < width/2) {
      red = i;
      green =0;
    }     
    //println("red color =" + red + "green color=" + green);
  }
}
  // colorPalate
  void drawRect() {
    noStroke();
    fill(134, 255, 177, 30);
    rect(width/2, 0, width/2, height);
    fill(255, 144, 144, 30);
    rect(0, 0, width/2, height);
  }


