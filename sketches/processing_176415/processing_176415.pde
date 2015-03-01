
// Coordinates for the rectangle that the slide object should follow.
int x=120;
int y=320;
int w=450;
int h=100;

float ellipseDiam1 = 200;
float ellipseDiam2 = 30;

// Buttons are assigned for each point in ph_0 (1,2,3) and for the yellow circle/button in page_01 (4).
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;

// Slide object. Got own x position and image.
int xslide1=180;
PImage slide1;

// Slide object. Got own x position and image.
int xslide2=400;
PImage slide2;

// Text for the different points
PImage education;
PImage campus_life;
PImage jobs;

// Opening background
PImage opening;
PImage page1;
PImage ph0;
PImage ph3;

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void setup() {
  size(684, 967);
  /* Slide object and different text*/
  slide1=loadImage("slide object.png");
  slide2=loadImage("slide object1.png");
  education=loadImage("education1.png");
  campus_life=loadImage("campus_life1.png");
  jobs=loadImage("jobs1.png");
  opening=loadImage("opening1.jpg");
  page1=loadImage("page_01.jpg");
  ph0=loadImage("ph_0.jpg");
  ph3=loadImage("ph_3.jpg");
}

void draw() {
  imageMode(CORNER);
  image(opening, 0, 0);
  // Slide object1 as an image with x-y-coordinates
  imageMode(CENTER);
  image(slide1, xslide1, 370);

  // Slide object 1 movement
  if (mouseX>x+50 && mouseY>y && mouseY<y+h && mousePressed) {
    xslide1=mouseX;
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // When the slide object1 exceeds x=520, a yellow circle (image) with a yellow stroke scaling up appears.
  if (xslide1>520) {
    imageMode(CORNER);
    image(page1, 0, 0);

    // Transparent fill and slightly transparent stroke on the hand
    fill(0, 0);
    stroke(255, 201, 10, 150);
    strokeWeight(4);

    //ellipse(255, 662, 200, 200);
    ellipse(255, 662, ellipseDiam1, ellipseDiam1);
    // circle scaling
    ellipseDiam1+=1.5;
    //If circle diameter exceeds 300, it resets to 200(original size)
    if (ellipseDiam1 >= 300) {
      ellipseDiam1 = 200;
    }
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // If yellow circle is pressed (button4), a new background appears
  if (mouseX>155 && mouseX<355 && mouseY>562 && mouseY<762 && mousePressed) {
    button4 = true;
  }
  // 3 circles (image) with transparent fill and a grey stroke scaling up appears when the background changes.
  if (button4) {
    image(ph0, 0, 0);
    fill(0, 0);
    stroke(0, 70);
    strokeWeight(4);
    // 3 circles
    ellipse(48, 158, ellipseDiam2, ellipseDiam2);
    ellipse(48, 288, ellipseDiam2, ellipseDiam2);
    ellipse(48, 420, ellipseDiam2, ellipseDiam2);
    //circles scaling
    ellipseDiam2+=1.5;
    //If circles diameter exceeds 65, it resets to 30(original size)
    if (ellipseDiam2 >= 62) {
      ellipseDiam2 = 30;
    }
  }


  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // 1 circle text by image when button1/circle1 is pressed
  if (mouseX>30 && mouseX<70 && mouseY>140 && mouseY<180 && mousePressed) {
    button1 = true;
  }
  if (button1) {
    image(education, 0, 126);
  }


  // 2 circle text by image when button2/circle2 is pressed
  if (mouseX>30 && mouseX<70 && mouseY>270 && mouseY<310 && mousePressed) {
    button2 = true;
  }
  if (button2) {
    image(campus_life, 0, 252);
  }


  // 3 circle text by image when button3/circle3 is pressed
  if (mouseX>30 && mouseX<70 && mouseY>400 && mouseY<440 && mousePressed) {
    button3 = true;
  }
  if (button3) {
    image(jobs, 0, 382);
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // When all circles are clicked the termination button appears with a new background that shows all the information
  if (button1 && button2 && button3) {
    image(ph3, 0, 0);
    imageMode(CENTER);
    image(slide2, xslide2, 924);
  }

  // Termination button path if following criterias are met
  if (mouseX>370 && mouseX<590 && mouseY>900 && mouseY<950 && mousePressed) {
    xslide2=mouseX;
  }

  /* Termination button position.
   If mouse not pressed slide object2 x-position will always be 400 since xslide2 always will be less than width.
   This is the last step of the restart part*/
  //f (!mousePressed && xslide2<width) {
  //xslide2 = 400;
  //}

  // Restart function, if slide object2 exceeds x=580, the program restarts.
  if (xslide2>580) {
    button1=false;
    button2=false;
    button3=false;
    button4=false;
    xslide1=180;
    xslide2=400;
  }
}



