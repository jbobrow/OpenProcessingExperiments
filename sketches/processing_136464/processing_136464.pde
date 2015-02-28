
  PImage bdream;
  PImage breal;
  PImage dream1;
  PImage real1;
  PImage dream2;
  PImage real2;
  PImage dream3;
  PImage real3;
  PImage dream4;
  PImage real4;
  float counter = 0;
  

void setup() {
  size(1076, 782);
  frameRate(60);
  bdream = loadImage("dream_background.png");
  breal = loadImage("real_background.png");
  dream1 = loadImage("figure_1_dream.png");
  real1 = loadImage("figure_1_real.png");
  dream2 = loadImage("figure_2_dream.png");
  real2 = loadImage("figure_2_real.png");
  dream3 = loadImage("figure_3_dream.png");
  real3 = loadImage("figure_3_real.png");
  dream4 = loadImage("figure_4_dream.png");
  real4 = loadImage("figure_4_real.png");
}

void mouseClicked() {
  counter +=1;
  
  
}

void draw(){
  int sec = millis()/1000;
  if (sec >= 15) {
    sec = 0;
  }
  if (counter > 5) {
    counter = 0;
  }
  
  if (counter == 0) {
    image(breal, 0, 0);
    image(real4, 0, 0);
    image(real3, 0, 0);
    image(real2, 0, 0);
    image(real1, 0, 0);
  }
  
  else if (counter == 1) {
    image(bdream, 0, 0);
    image(real4, 0, 0);
    image(real3, 0, 0);
    image(real2, 0, 0);
    image(real1, 0, 0);
  }
  else if (counter == 2) {
    image(bdream, 0, 0);
    image(dream4, 0, 0);
    image(real3, 0, 0);
    image(real2, 0, 0);
    image(real1, 0, 0);
  }
  else if (counter == 3) {
    image(bdream, 0, 0);
    image(dream4, 0, 0);
    image(dream3, 0, 0);
    image(real2, 0, 0);
    image(real1, 0, 0);
  }
    else if (counter == 4) {
    image(bdream, 0, 0);
    image(dream4, 0, 0);
    image(dream3, 0, 0);
    image(dream2, 0, 0);
    image(real1, 0, 0);
  }
  else if (counter == 5) {
    image(bdream, 0, 0);
    image(dream4, 0, 0);
    image(dream3, 0, 0);
    image(dream2, 0, 0);
    image(dream1, 0, 0);
  }
  
  //if ((counter1 == 0) || (counter1/6{
    
  //if (counterb == 1){
  /*
  image(bdream, 0, 0);
  image(breal, 0, 0);
  image(dream4, 0, 0);
  image(real4, 0, 0);
  image(dream3, 0, 0);
  image(real3, 0, 0);
  image(dream2, 0, 0);
  image(real2, 0, 0);
  image(dream1, 0, 0);
  image(real1, 0, 0);
  */
}


