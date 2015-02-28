
// Declaring a variable of type PImage
private PImage[] img = new PImage[5];
private PImage sImg;
//Setup cords to be used by the writer
//Setup as Follows {Eyes, Nose, Mouth}
private final int[][] cords = {
  {
    100, 200, 175, 55
  }
  , {
    135, 255, 65, 60
  }
  , {
    115, 315, 170, 85
  }
};
private PImage[] face = new PImage[3];
int count = 0;
int faceCount = 0;
boolean gameOver = false;


void setup() {
  size(438,575);
  // Load the images into and array
  img[0] = loadImage("mona.jpg");
  img[1] = loadImage("raph.jpg");
  img[2] = loadImage("michel.jpg");
  img[3] = loadImage("monet.jpg");
  img[4] = loadImage("vincent.jpg");
  randomBG();
}

void draw() {
  if(count < 200) {
    background(255);
    image(sImg,0,0);
    int locCord[];
    for(int i = 0; i < 3; i++) {
      if(face[i] != null) {
        locCord = cords[i];
        image(face[i], locCord[0], locCord[1], locCord[2], locCord[3], locCord[0], locCord[1], locCord[0] + locCord[2], locCord[1] + locCord[3]);
      }
    }
  }
  if(count > 10 && count < 200) {
    mousePressed();
  }
  if(count > 199 && count < 500) {
    drawMini(mouseX, mouseY, pmouseX, pmouseY);
  }
  if(gameOver) {
    background(255, 0, 0);
    drawMan(1);
  } 
  else if (count > 499) {
    background(255);
    drawMan();
  }
}


void mousePressed()
{
  if( count < 200) {
    int part = int(random(3));
    face[part] = img[int(random(5))];
    if(random(10) < 2.5)
      randomBG();
    count++;
  }
  if(faceCount >= 100) {
    gameOver = true;
  }
}

//randomly detirmine a background Image
void randomBG() {
  int start = int(random(5));
  sImg = img[start];
}

void drawMini(int x, int y, int px, int py) {
  count++;
  float speed = abs(x-px) + abs(y-py) + 20;
  fill(random(255), random(255), random(255));
  ellipse(x, y, speed, speed);
}

void drawMan() {
  fill(255, 255, 255);
  ellipse(width/2, height/2, 200, 200);
  if(faceCount < 75 || faceCount > 90) {
    ellipse(width/2 - 30, height/2 - 30, 30, 30);
    ellipse(width/2 + 30, height/2 - 30, 30, 30);
    line(width/2 - 10, height/2 + 75, width/2 + 10, height/2 + 75);
  }
  else {
    //closed eyes
    noFill();
    arc(width/2 - 30, height/2 - 30, 30, 30, PI/90, PI);
    arc(width/2 + 30, height/2 - 30, 30, 30, PI/90, PI);
    line(width/2 - 45, height/2 - 30, width/2 - 15, height/2 - 30);
    line(width/2 + 45, height/2 - 30, width/2 + 15, height/2 - 30);
    line(width/2 - 10, height/2 + 75, width/2 + 10, height/2 + 75);
  }
  PFont f;
  f = loadFont("Calibri-48.vlw");
  textFont(f,48);
  fill(0);
  textAlign(CENTER);
  if(faceCount < 100) {
    text("Hello!", width/2, 135);
    text("can you help me?", width/2, 450);
    faceCount++;
  }
  if(faceCount >= 100) {
    text("Please,", width/2, 135);
    text("my wife is worried!", width/2, 450);
  }
}

void drawMan(int kill) {
  fill(255);

  if (faceCount > 200) {
    PFont f;
    background(255);
    f = loadFont("Calibri-48.vlw");
    textFont(f,48);
    fill(0);
    textAlign(CENTER);
    text("ART:", width/2, 200);
    text("Giving life", width/2, 275);
    text("to the lifeless.", width/2, 310);
  } 
  else if(faceCount <= 200) {
    faceCount++;
    ellipse(width/2, height/2, 200, 200);
    line(width/2 - 45, height/2 - 45, width/2 - 15, height/2 - 15);
    line(width/2 - 45, height/2 - 15, width/2 - 15, height/2 - 45);
    line(width/2 + 45, height/2 - 45, width/2 + 15, height/2 - 15);
    line(width/2 + 45, height/2 - 15, width/2 + 15, height/2 - 45);
    ellipse(width/2, height/2 + 55, 40, 40);

    PFont f;
    f = loadFont("Calibri-48.vlw");
    textFont(f,48);
    fill(0);
    textAlign(CENTER);
    text("WHY WOULD", width/2, 450);
    text("YOU DO THAT!", width/2, 490);
  }
}



