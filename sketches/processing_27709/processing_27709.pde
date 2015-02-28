
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;

void setup() {
  size(640, 480);
  smooth();
  img1 = loadImage("watch.png");
  img2= loadImage("sink.jpg");
  img2.resize(640, 480);
  img3 = loadImage("arm.png");
  img3.resize(640, 480);
  img4 = loadImage("bed.jpg");
  img4.resize(640, 480);
  img5 = loadImage("gym.jpg");
  img5.resize(640, 480);
  img6 = loadImage("hw.jpg");
  img6.resize(640, 480);
  img7 = loadImage("laundry.jpg");
  img7.resize(640, 480);
  img8 = loadImage("class.jpg");
  img8.resize(640, 480);
  img9 = loadImage("facebook.jpg");
  img9.resize(640, 480);
  img10 = loadImage("toilet.jpg");
  img10.resize(640, 480);
  img11 = loadImage("food.jpg");
  img11.resize(640, 480);
  img12 = loadImage("deneve.jpg");
  img12.resize(640, 480);
  img13 = loadImage("tv.jpg");
  img13.resize(640, 480);
  img14 = loadImage("closet.jpg");
  img14.resize(640, 480);
  img15 = loadImage("feet.jpg");
  img15.resize(640, 480);
}

void draw() {

  background(255);


  // Get values from the system clock
  float h = hour();
  float m = minute();
  float s = second();

  // If it's after noon, subtract 12
  if (h > 12) {
    h -= 12;
  }

    //Background Code 

  //feet
  if(h == 1) {
    background(img15);
  }


  //closet
  if(h == 2) {
    background(img14);
  }


  //deneve
  if(h == 3) {
    background(img2);
  }


  //food
  if(h == 4) {
    background(img12);
  }
  
  //toilet
  if(h == 5) {
    background(img10);
  }


  //class
  if(h == 6) {
    background(img10);
  }
  
  //gym
  if(h == 7) {
    background(img8);
  }

   //hw
  if(h == 8) {
    background(img5);
  }

  //facebook
  if(h == 9) {
    background(img6);
  }

  //tv
  if(h == 10) {
    background(img9);
  }

  if(h == 11) {
    background(img13);
  }
  
  if (h == 12)  {
    background(img4);
  }





  //Arm Image
  pushMatrix();
  image(img3,0,0);
  popMatrix();

  //Clock Image
  pushMatrix();
  image(img1,185, 310, 205, 135);
  popMatrix();


  // Map the time values to the right angles
  h = map(h, 0, 11, -90, 240);
  m = map(m, 0, 59, -90, 264);
  s = map(s, 0, 59, -90, 264);

  // Move to the center of the screen
  translate(265, 375);

  noStroke();
  int angle = 6;
  pushMatrix();
  for (int i = 0; i < 360; i += angle) {
    rotate(radians(angle));
    line(180, 0, 190, 0);
  }
  popMatrix();

  // Draw the hour hand
  pushMatrix();
  stroke(255);
  strokeWeight(5);
  rotate(radians(h));
  line(0, 0, 40, 0);
  popMatrix();

  // Draw the minute hand
  pushMatrix();
  stroke(102);
  strokeWeight(3);
  rotate(radians(m));
  line(0, 0, 40, 0);
  popMatrix();

  // Draw the second hand
  pushMatrix();
  strokeWeight(1);
  stroke(255, 0, 0);
  rotate(radians(s));
  line(0, 0, 57, 0);
  popMatrix();
}


