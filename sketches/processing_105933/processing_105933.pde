
//declare variables
//array for 

int rain = 300;
int [] posX=new int [rain];//array for position x of the rain
int [] posY=new int [rain];//array for position y of the rain
int [] speedX=new int [rain];//array for speed x of the rain
int [] speedY=new int [rain];//array for speed yof the rain
int [] hue=new int [rain];//array for hue
int [] diameter = new int[rain]; //array for size

int paintColor = 20; //brush size for painting color


void setup() {
  size (500, 500);
  background(255);
  colorMode(HSB, 255);
  rectMode(CENTER);

//loop setting
  for (int i=0; i<rain; i++) {
    posX[i]=int(random(0, 500));
    posY[i]=int(random(0, 500));
    speedX[i]=int(random(0));
    speedY[i]=int(random(2, 6));
    diameter[i]=int(random(10, 15));
    hue[i]=int(random(90, 130));
  }
}


void draw() {
  background(0);
  //brush
  fill (255,255,255,0);
  ellipse(mouseX,mouseY,paintColor,paintColor);
  
  //rain drops
  for (int i=0; i<rain; i++) {
    posX[i]+=speedX[i];
    posY[i]+=speedY[i];
    noStroke();
    fill(hue[i], 255, 255, random(70, 200));
    rect(posX[i], posY[i], diameter[i]/4, diameter[i]+30);
  }
  //make it rain
  rain();
  paintColor();
}

//function for rainning
void rain () {
  for (int i=0; i<rain; i++) {
    if (posX[i]>width-diameter[i]/2) {
      speedX[i]=-speedX[i];
      posX[i]=width-diameter[i]/2;
    }
  }
  for (int i=0; i<rain; i++) {
    if (posX[i]<diameter[i]/2) {
      speedX[i]=-speedX[i];
      posX[i]=diameter[i]/2;
    }
  }
  for (int i=0; i<rain; i++) {
    if (posY[i]>width-diameter[i]/2) {
      speedY[i]=-speedY[i];
      posY[i]=width-diameter[i]/2;
    }
  }

  for (int i=0; i<rain; i++) {
    if (posY[i]<diameter[i]/2) {
      speedY[i]=-speedY[i];
      posY[i]=diameter[i]/2;
    }
  }
}

void keyPressed () {
  if (key==CODED) {
    if (keyCode==DOWN) {
      for (int i=0; i<rain; i++) {
        posY[i]=width; // make rain fall to bottom

      }
    }
  }
  if (key==CODED) {
    if (keyCode==UP) {
      for (int i=0; i<rain; i++) {
        fill (hue[i]+=20); 
        if (hue[i]>=255) {
          hue[i]=int (random(150, 190)); //change color of rain
        }
      }
    }
  }
  if (key==CODED) {
    if (keyCode==RIGHT) {
      for (int i=0; i<rain; i++) {
        diameter[i]+=5; //size of rain drop
      }
    }
  }
}

void paintColor(){
for (int i=0;i<rain;i++){
if (dist(mouseX,mouseY,posX[i],posY[i])<paintColor){
  hue[i]=147; //paint different color over rain

}
}
}



