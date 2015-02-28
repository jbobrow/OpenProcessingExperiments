
/* @pjs preload="/static/uploaded_resources/p.1954/earth.png"; */
PFont font; 
 
PImage left1;
PImage left2;
PImage left3;
PImage left4;
PImage left5;
PImage right1;
PImage right2;
PImage right3;
PImage right4;
PImage right5;

float startx;
float starty; 
int counter;
int [] redValue;
int [] greenValue;
int [] blueValue;
PImage [] leftArray;
PImage [] rightArray;
boolean [] leftInPlace;
boolean [] leftChosen;
boolean [] rightInPlace;
boolean [] rightChosen;

int leftIncrement;
int rightIncrement;
int waitCount;

PImage [] leftChoices;
PImage [] rightChoices;

int l;
int r;



void setup() {
  size(600, 600);
  
  waitCount = 0;
  font = loadFont("AngsanaNew-Bold-48.vlw");
  left1 = loadImage("boxerposeleft1.jpg");
  left2 = loadImage("boxerposeleft2.jpg");
  left3 = loadImage("boxerposeleft3.jpg");
  left4 = loadImage("boxerposeleft4.jpg");
  left5 = loadImage("boxerposeleft5.jpg");
  right1 = loadImage("boxerposeright1.jpg");
  right2 = loadImage("boxerposeright2.jpg");
  right3 = loadImage("boxerposeright3.jpg");
  right4 = loadImage("boxerposeright4.jpg");
  right5 = loadImage("boxerposeright5.jpg");

  startx = width/2;
  starty = height/2;
  l = 0;
  r = 0;
  leftIncrement = 0;
  rightIncrement = 0;
  
  redValue = new int[5];
  greenValue = new int[5];
  blueValue = new int[5];
  leftArray = new PImage[5];
  rightArray = new PImage[5];
  leftChoices = new PImage[5];
  leftInPlace = new boolean[3];
  leftChosen = new boolean[3];
  rightChoices = new PImage[5];
  rightInPlace = new boolean[3];
  rightChosen = new boolean[3];
  
  leftInPlace[0] = false;
  leftInPlace[1] = false;
  leftInPlace[2] = false;
  leftChosen[0] = false;
  leftChosen[1] = false;
  leftChosen[2] = false;
  
  rightInPlace[0] = false;
  rightInPlace[1] = false;
  rightInPlace[2] = false;
  rightChosen[0] = false;
  rightChosen[1] = false;
  rightChosen[2] = false;
  
  leftArray[0] = left1;
  leftArray[1] = left2;
  leftArray[2] = left3;
  leftArray[3] = left4;
  leftArray[4] = left5;
  
  rightArray[0] = right1;
  rightArray[1] = right2;
  rightArray[2] = right3;
  rightArray[3] = right4;
  rightArray[4] = right5;
  
  redValue[0] = 255;
  redValue[1] = 167;
  redValue[2] = 255;
  redValue[3] = 242;
  redValue[4] = 217;
  greenValue[0] = 235;
  greenValue[1] = 190;
  greenValue[2] = 176;
  greenValue[3] = 171;
  greenValue[4] = 229;
  blueValue[0] = 176;
  blueValue[1] = 130;
  blueValue[2] = 90;
  blueValue[3] = 78;
  blueValue[4] = 63;

  counter = 0;
// frameRate(1);
  imageMode(CENTER);
  background(0);
}
 
void leftAnimate( int chooser, float degree){
   l += 10;
 
  if( leftChosen[leftIncrement] == false){
     leftChosen[leftIncrement] = true;
     leftChoices[leftIncrement] = leftArray[chooser];
      
  }
  
  float moveX = 0;
  float moveY = 0;

  if( leftIncrement == 0){
  moveX = width/2 - l;
  moveY = width/2 - l;
  
  if( moveY < 100)
     moveY = 100;
  }
  
  if( leftIncrement == 1){
    moveX = width/2 - l;
    moveY = width/2;  
  
  }
 
  if( leftIncrement == 2){
    moveX = width/2 - l;
    moveY = width/2 + l;  
     if( moveY > 500)
       moveY = 500;
  }
  
  if( moveX < 80){
    moveX = 80; 
    degree = 0;
    leftInPlace[leftIncrement] = true;
    
  }
  
  pushMatrix();
  translate(moveX, moveY);
  rotate(radians(degree));
  image(leftChoices[leftIncrement], 0, 0, 100, 150);
  popMatrix();
  tint( redValue[leftIncrement], greenValue[leftIncrement], blueValue[leftIncrement]);
  
  if( leftInPlace[leftIncrement] == true){
     leftIncrement++; 
     l = 0;
  }
 
} 

void leftControl(int chooser){
  
  float degree = l*10;
  
  if( leftInPlace[2] == false)
  leftAnimate( chooser, degree);
  
  if( leftInPlace[0] == true){
      image(leftChoices[0], 80, 100, 100, 150);
      tint( redValue[0], greenValue[0], blueValue[0]);
  }
  
  if( leftInPlace[1] == true){
      image(leftChoices[1], 80, 300, 100, 150);
      tint( redValue[1], greenValue[1], blueValue[1]);
  }
  
  if( leftInPlace[2] == true){
      image(leftChoices[2], 80, 500, 100, 150);
      tint( redValue[2], greenValue[2], blueValue[2]);
  }
}

void rightAnimate( int chooser, float degree){
     r += 10;
 
  if( rightChosen[rightIncrement] == false){
     rightChosen[rightIncrement] = true;
     rightChoices[rightIncrement] = rightArray[chooser];
      
  }
  
  float moveX = 0;
  float moveY = 0;

  if( rightIncrement == 0){
  moveX = width/2 + r;
  moveY = width/2 - r;
  
  if( moveY < 100)
     moveY = 100;
  }
  
  if( rightIncrement == 1){
    moveX = width/2 + r;
    moveY = width/2;  
  
  }
 
  if( rightIncrement == 2){
    moveX = width/2 + r;
    moveY = width/2 + r;  
     if( moveY > 500)
       moveY = 500;
  }
  
  if( moveX > 520){
    moveX = 520; 
    degree = 0;
    rightInPlace[rightIncrement] = true;
    
  }
  
  pushMatrix();
  translate(moveX, moveY);
  rotate(radians(degree));
  image(rightChoices[rightIncrement], 0, 0, 100, 150);
  popMatrix();
  tint( redValue[rightIncrement], greenValue[rightIncrement], blueValue[rightIncrement]);
  
  if( rightInPlace[rightIncrement] == true){
     rightIncrement++; 
     r = 0;
  }
  
}

void rightControl( int chooser){
  
  float degree = r*10;
  
  if( rightInPlace[2] == false)
  rightAnimate( chooser, degree);
  
  if( rightInPlace[0] == true){
      image(rightChoices[0], 520, 100, 100, 150);
      tint( redValue[0], greenValue[0], blueValue[0]);
  }
  
  if( rightInPlace[1] == true){
      image(rightChoices[1], 520, 300, 100, 150);
      tint( redValue[1], greenValue[1], blueValue[1]);
  }
  
  if( rightInPlace[2] == true){
      image(rightChoices[2], 520, 500, 100, 150);
      tint( redValue[2], greenValue[2], blueValue[2]);
  }
  
}
 
void draw() {
  background(0);
  if( leftIncrement > 2){
     leftIncrement = 2; 
  }
  
  int chooser =  int( random(4));
  
   if( leftInPlace[2] == true && rightInPlace[2] == true){
    waitCount++;
    
    background( redValue[chooser], greenValue[chooser], blueValue[chooser]);
    if( waitCount == 400){
     //reset everything
      leftIncrement = 0;
      rightIncrement = 0; 
      rightInPlace[0] = false;
      rightInPlace[1] = false;
      rightInPlace[2] = false;
      leftInPlace[0] = false;
      leftInPlace[1] = false;
      leftInPlace[2] = false;
      rightChosen[0] = false;
      rightChosen[1] = false;
      rightChosen[2] = false;
      leftChosen[0] = false;
      leftChosen[1] = false;
      leftChosen[2] = false;
    
      waitCount = 0;
    }
  }
  
   textAlign( CENTER, CENTER);
   textFont(font);
   text("VS", width/2, height/2);
  
  leftControl(chooser);
  
  if( leftInPlace[2] == true)
  rightControl( chooser);
  
 
  
  
  
 // tint( redValue[counter], greenValue[counter], blueValue[counter]);
  
  
  
}

