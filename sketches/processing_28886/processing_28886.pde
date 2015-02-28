
//color fillVal = color(1806); //this was just to see if keys respond
PImage skier;
PImage heart;
PImage tree;
int timeCount;
boolean activate;
//ArrayList<point> deathPoints = new ArrayList<point>();

float[][] trees = new float[20][20];
float[][] pills = new float[5][3];

void setup() {
  timeCount = 180;
  size(700, 700);
  reset();  
  background(255);
  fill(0);
  textSize(30);
  text("Clean Ski runner\n  Click to begin", width / 3, height/2);

  frameRate(180);
  skier = loadImage("Skier.png");
  heart = loadImage("Heart.png");
  tree = loadImage("Tree.png");
}

void draw() {
  //fill(fillVal);

  //cursor(skier, 0, 0);
  if (mousePressed == true && activate == false) {
    activate = true;
    timeCount = 10;

    reset();
  } 

  if (activate == true) {
    background(255); //loop reset
    line(0, heart.height + 40, width, heart.height + 40);
    image(heart, 25, 25);
    fill(255);
    ellipse(mouseX, mouseY, 60, 60);
    image(skier, mouseX - skier.width / 2, mouseY - skier.height / 2);
    //image(tree, width / 2, height / 2);

    //reset();
    trees();
    pills();
    textSize(50);
    text(timeCount / 180 + 10, heart.width + 30, heart.height * 1.55);
    fill(0);
    if (timeCount / 180 + 10 > -1) { //note the formula
      timeCount--;
    }

    if (timeCount / 180 + 10 <= -1) {
      activate = false;
      text("Game Over\n Play again?", width / 3, height/2);
    }
  }
}


void trees() {
  for (int x = 19; x >= 0; x--) {
    pushMatrix();
    translate(trees[x][1], trees[x][0]);
    //image(tree, x, height);
    fill(0, 120, 0);
    rotate(PI);
    triangle(-30, 0, 30, 0, 0, 90);
    fill(51, 0, 0);
    rect(-10, -15, 20, 15);

    //image(tree, x, height);
    popMatrix();

    trees[x][0] = trees[x][0] - 1;


    if (trees[x][0] < -25) {
      trees[x][0] = width + 25;
      trees[x][1] = random(0, height);
    }
  }
}

void pills() {
  for (int x = 4; x >= 0; x--) {
    pushMatrix();
    translate(pills[x][1], pills[x][0]);
    fill(120, 0, 0);
    ellipse(20, 20, 20, 20);
    popMatrix();

    pills[x][0] = pills[x][0] - 1;


    if (pills[x][0] < -25) {
      pills[x][0] = width + 25;
      pills[x][1] = random(0, height);
    }
    
    if (dist(pills[x][0], pills[x][1], width / 2, height / 2) < 45) {
      pills[x][0]=-500;
      pills[x][1]=random(0,height);
      timeCount+= 180;
    }
  }
}


void reset() {
  for (int x = 19; x >= 0; x--) {
    trees[x][0] = random(5, 500); 
    trees[x][1] = random(-500, -300);
  }

  for (int x = 4; x >= 0; x--) {
    pills[x][0] = random(5, 500); 
    pills[x][1] = random(-500, -300);
  }
}




