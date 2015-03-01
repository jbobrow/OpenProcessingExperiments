
PFont font1; //new font
PImage[] fruits = new PImage[4]; //new array of images, like a list in python, 4 things in the list
PImage[] spinning = new PImage[4]; //new array of images

void setup() {
  size(400, 200); 
  font1 = createFont("Times New Roman", 30); //makes the new font something
  textFont(font1); //changes the font that you use to font1
  textAlign(CENTER, CENTER); //aligns text center horizontally and vertically
  loadImages(); //executes function that i made that loads the images
  fill(255); //fill is white
}

boolean bool_pressedonlever; //when you are pressing the mouse on the lever
boolean bool_onlever; //when the mouse is on the lever
boolean bool_spin; //the lever has been pulled
boolean bool_spinning; //the machine is spinning
boolean win; //secret winning trick

float float_spinframe; //to calculate how fast to switch the images
int spinframe;
int time;

boolean bool_reels; //to display the reels after it has spun
int reel1; //the values that correspond to each image for each reel
int reel2;
int reel3;

void draw() {
  bool_onlever = mouseX > 343 && mouseX < 370 && mouseY > 37 && mouseY < 62; //when the mouse will be on the lever

  //makes the background and text and boxes
  background(0);
  text("Slot Machine", 200, 25);
  strokeWeight(1);
  stroke(0);
  rect(29, 59, 82, 81);
  rect(129, 59, 82, 81);
  rect(229, 59, 82, 81);

  if (bool_pressedonlever) { //if you press on a lever
    if (mouseY > 50 && mouseY <150) {
      leveron(); //function that makes the lever correspond to where your mouse is
    } else if (mouseY <= 50) {
      leverup(); //doesn't let the lever go higher then it should be
    } else {
      leverdown(); //doesn't let the lever go lower then it should be
    }
  } else {
    leverup(); //leaves the lever up
  }

  if (bool_spin) { //if you have pulled the lever
    bool_spinning = true; 
    bool_spin = false;

    reel1 = int(random(4)); //random values to show the different images
    reel2 = int(random(4));
    reel3 = int(random(4));

    if (win) { //secret winning trick makes the values all the same
      reel2 = reel1;
      reel3 = reel1;
    }
  }

  if (bool_spinning) { //shows the frames spinning
    if (time < 120) { //for the first 2 seconds make all the frames look like their spinning
      image(spinning[spinframe], 30, 60); //the images spin because sprinframe corresponds to the image to use. it goes through the array of spinning images
      image(spinning[spinframe], 130, 60);
      image(spinning[spinframe], 230, 60);
    }else if (time < 240) { // at 4 seconds
      image(fruits[reel1], 30, 60); //show the first reel
      image(spinning[spinframe], 130, 60); //the rest are still spinning
      image(spinning[spinframe], 230, 60);
    } else if (time < 360) { //at 6 seconds
      image(fruits[reel1], 30, 60); //first two are shown
      image(fruits[reel2], 130, 60);
      image(spinning[spinframe], 230, 60); //last is still spinning
    } else if (time < 370) {
      image(fruits[reel1], 30, 60); //all are shown
      image(fruits[reel2], 130, 60);
      image(fruits[reel3], 230, 60);
    } else {
      time = 0; //restarts time so you can spin it again
      bool_spinning = false; //you aren't spinning anymore
      bool_reels = true; //show the reels
    }
    float_spinframe += 0.2; //adds to the floatspinframe to make it increase not eversecond
    if (float_spinframe > 4) {
      float_spinframe = 0;
    }
    spinframe = floor(float_spinframe); //spinframe is an integer so we floor the float so we can have a slowly increasing integer.
    // it will end up something like this:
    //float spinframe: 0.2 0.4 0.6 0.8 etc
    //spin frame     : 0   0   0   0   1   1   1   1   2   2   2   2   
    time ++; //adds time
  }

  if (bool_reels) { //shows all the reels and if you lose or not
    image(fruits[reel1], 30, 60);
    image(fruits[reel2], 130, 60);
    image(fruits[reel3], 230, 60);
    if (reel1 == reel2 && reel1 == reel3) {
      text("YOU WIN!!!", 200, 165);
    } else {
      text("You lose.", 200, 165);
    }
  }
}


void mousePressed() {
  if (bool_onlever && !bool_spinning) {
    bool_pressedonlever = true; //you can't pull the lever if it is already spinning. and you have to be on the lever
  }
  if (mouseButton == RIGHT) { //this is the secret winning trick
    win = true;
  } else {
    win = false;
  }
}
void mouseReleased() {
  if (bool_pressedonlever) { //if you press
    bool_pressedonlever = false; //then no more
    if (!bool_spin && !bool_spinning && mouseY > 100) { //you have to pull the lever down
      bool_reels = false; //don't show the reels anymore
      bool_spin = true; //spin the thing
    }
  }
}
// draws pictures of the lever if it is up / down / or if your pressing on it with your mouse
void leverup() {
  strokeWeight(12);
  stroke(150);
  line(357, 100, 357, 50);
  strokeWeight(1);
  noStroke();
  ellipse(357, 50, 20, 20);
}

void leverdown() {
  strokeWeight(12);
  stroke(150);
  line(357, 100, 357, 150);
  strokeWeight(1);
  noStroke();
  ellipse(357, 150, 20, 20);
}

void leveron() {
  strokeWeight(12);
  stroke(150);
  line(357, 100, 357, mouseY);
  strokeWeight(1);
  noStroke();
  ellipse(357, mouseY, 20, 20);
}

void loadImages() { //just loads all the images
  
  fruits[0] = loadImage("banana.bmp");
  fruits[1] = loadImage("orange.bmp");
  fruits[2] = loadImage("strawberries.bmp");
  fruits[3] = loadImage("grapes.bmp");

  spinning[0] = loadImage("spin1.bmp");
  spinning[1] = loadImage("spin2.bmp");
  spinning[2] = loadImage("spin3.bmp");
  spinning[3] = loadImage("spin4.bmp");
}
