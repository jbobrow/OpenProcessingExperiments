
//Coded w/ help from Zac G and David L

float distance = 0;
int maxdist = 5; 
int walkX = 0; 
int fallX = 0;
int walk = 0;
int fall = 0;
int halo = 0;
int rectXposit = -1000;
int boxposit = 80; 

PFont font;
PFont font2;
int timer = 20;
int timeLast = 0; 

String walkFileName = "Walk3";
String fallFileName = "Fall2";
String fileExtension = ".png";
int numWalkFrames = 31; 
int numFallFrames = 48;
int numTrailingDigits = 4;
PImage[] walkies, falling;
PImage light;
PImage obstacle;

boolean hasfallen = false;
boolean haswon = false;

void setup() {
  noStroke();
  size (1000, 500);
  frameRate(24);
  timeLast = second();
  font = createFont("Calibri", 20, true);
  font2 = createFont("Calibri", 30, true);

  light = loadImage("light.png");
  obstacle = loadImage("obstacle.png");

  //Thanks, David. 
  walkies = new PImage[numWalkFrames];
  for (int i = 1; i <= numWalkFrames; i++) {
    String fileName = "";
    fileName += walkFileName;
    String number = Integer.toString(i);
    for (int j = 0; j < numTrailingDigits - number.length(); j++) {
      fileName += "0";
    }
    fileName += number + fileExtension;
    walkies[i - 1] = loadImage(fileName);
  }

  falling = new PImage[numFallFrames];
  for (int i = 1; i <= numFallFrames; i++) {
    String fileName = "";
    fileName += fallFileName;
    String number = Integer.toString(i);
    for (int j = 0; j < numTrailingDigits - number.length(); j++) {
      fileName += "0";
    }
    fileName += number + fileExtension;
    falling[i - 1] = loadImage(fileName);
  }
}

void draw() {
  if (!haswon) {
    game();
  }
  if (!hasfallen) {
    if (mouseX > 50 && mouseX < 950 && mouseY > 30 && mouseY < 70) {
      if (timer >= 0) {
        if (boxposit > 920) {
          haswon = true;
        }
      }
    }
  }
  if (haswon) {
    fill(167, 32, 32);
    textFont(font2);
    text("Finals Completed!", 380, 100);
    textFont(font);
    text("(good for you)", 435, 130);
  }
} 


void game() {  
  distance = mouseX - pmouseX;

  fill(230, 170, 216, 70);
  rect(0, 0, 1000, 500);

  fill(121, 70, 85);
  rect(0, 450, 1000, 50);

  fill(110, 35, 75, 20);
  rect(50, 40, 900, 30);
  rect(50, 40, 600, 30);
  rect(50, 40, 400, 30);
  rect(50, 40, 250, 30);
  rect(50, 40, 100, 30);
  rect(50, 40, 40, 30);
  rect(50, 40, 15, 30);
  rect(50, 40, 5, 30);

  fill(200, 0, 0, 20);
  rect(850, 40, 100, 30); 
  rect(900, 40, 50, 30);
  rect(930, 40, 20, 30);
  rect(945, 40, 5, 30);

  textFont(font);
  fill(167, 32, 32);
  text(timer + ": Days", 920, 25);  

  if (mousePressed == true) {
    if (second() != timeLast) {
      timeLast = second();
      timer -= 1;
    }
    halo = mouseX/5;
    rectXposit += .00005; 
    walkX = mouseX - 120;
    boxposit = mouseX - 20;
    if (!hasfallen) {
      if (mouseX > 50 && mouseX < 950 && mouseY > 30 && mouseY < 70) {
        walk += 1;
        walk %= numWalkFrames;
        image(walkies[walk], walkX, 90);

        fill(240, 240, 90, 60);
        ellipse(boxposit+20, 40, halo, halo);
        image(light, boxposit, 30);

        //fill(240, 240, 90);
        //ellipse(boxposit+7, 50, 30, 30);
        //rect(boxposit, 60, 15, 15);
      }
      else {
        hasfallen = true;
        fallX = mouseX+20;
      }
      if (distance > maxdist) {
        hasfallen = true;
        fallX = mouseX+20;
      }
      if (rectXposit >= walkX-850) {
        hasfallen = true;
        fallX = mouseX+20;
      }
      if (timer == 0) {
        hasfallen = true;
        fallX = mouseX+20;
      }
    } 
    else {
      if (fall != falling.length - 1) {
        fall += 1;
      }
      image(falling[fall], fallX-200, 90);
    }
    if (hasfallen) {
      rectXposit += 5;
    }
  }


  if (mousePressed == false) {
    if (hasfallen) {
      rectXposit += 10; 
      image(falling[fall], fallX-200, 90);
    }
    if (!hasfallen) {
      image(walkies[walk], walkX, 90);
      fill(240, 240, 90, 60);
      ellipse(boxposit+20, 40, halo, halo);
      image(light, boxposit, 30);
    }

    //fill(240, 240, 90);
    //rect(boxposit, 40, 20, 30);
  }

  if (rectXposit > 0) {
    rectXposit = 0;
  }

  image(obstacle, rectXposit, 30);
  //fill(0);
  //rect(rectXposit, 0, 1000, 500);
}


