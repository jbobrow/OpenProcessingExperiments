
void setup(){
  size (400,400);
}

int x = 80;
int speed = 1;

int tv = 30;
int speedtv = -1;

int R = 75; // grey off tv screen
int G = 75;
int B = 75;

int xPos = 200; // Person starting x pos.
int yPos = 232; // Person starting y pos.

void draw(){
  background(255); 
  
  fill(45);
  rect(20, 40, 60, 160, 5); //left speaker
  fill(216, 216, 203);
  ellipse(50, 80, 20, 20); // Tweeter
  ellipse(50, 145, 35, 35); //Woofer
  fill(20);
  ellipse(50, 145, 10, 10); // small woofer
  ellipse(50, 80, 5, 5); // small tweeter
  
  fill(45);
  rect(320, 40, 60, 160, 5); //right speaker
  fill(216, 216, 203);
  ellipse(350, 80, 20, 20); // tweeter
  ellipse(350, 145, 35, 35); //woofer
  fill(20);
  ellipse(350, 145, 10, 10); //small woofer
  ellipse(350, 80, 5, 5); // small tweeter
  
  ////////////////
  tv = tv + speedtv;
  
  if ((tv > 40) || (tv < 0)){
    speedtv = speedtv * -1;
  } 
  
   R = (int)random(255);
   G = (int)random(255);
   B = (int)random(255);

  fill(30);
  rect(110, tv, 180, 90, 15); // tv
  fill(R, G, B); 
  rect(117, tv+7, 165, 75, 5); //screen
  
  fill(134, 122, 83);
  rect(100, 130, 200, 70, 0); // tv stand
  
  fill(255);
  ellipse(200, 232, 45, 45);// person
  //////
  x = x + speed;
  
  if ((x > width-240) || (x < 0)){
    speed = speed * -1;
  }
    
  fill(67, 55,44);
  rect(x, 250, 240, 110);// couch
}

void mouseClicked() { //TV changes to random colors when clicked
  if (R == 75 && G == 75 && B == 75) {
    R = (int)random(255); // sets random Red value
    G = (int)random(255); // sets random Green value
    B = (int)random(255); // sets random Blue value
  } else {
    R = 75;
    G = 75;
    B = 75;
  }
}

void keyPressed() {  // moves person left & right on couch
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (xPos > 100) {    //stops person from moving left off couch
        xPos = xPos - 2; // moves person two pixels left per press
      } 
    }
    if (keyCode == RIGHT) { 
      if (xPos < 300) { //stops person from moving right off couch
        xPos = xPos + 2; // moves person two pixels right per press
      }
    }
  }
}




