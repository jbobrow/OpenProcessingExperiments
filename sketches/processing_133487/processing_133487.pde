

float randX = random(20);
float randY = random(20);

int randXint = int(randX) * 20 + 10;
int randYint = int(randY) * 20 + 10;

void setup() {
  size (400, 400);
  background (255);
  noStroke();


  for (float x = 10; x <= 400; x+=20) {
    for (float y = 10; y <= 400; y+=20) {
      fill(x/4, y/4, x/4);
      ellipse(x, y, 20, 20);
    }
    //println("@x="+x+"y="+y); //used for debugging
  }
  ellipse(randXint, randYint, 20, 20);
}

void draw () {
  float randA = random(255);
  float randB = random(255);
  float randC = random(255);
  
  int randAint = int(randA);
  int randBint = int(randB);
  int randCint = int(randC);
  if (mousePressed) {
    stroke(randAint,randBint,randCint);
  } 
  else {
    stroke(0);
  }
  noFill();
  ellipse(mouseX-66, mouseY, 100, 100);
}


void keyPressed() {

  if (key == 's' || key == 'S') {
    randYint += 20;
  }
  if (key == 'w' || key == 'W') {
    randYint -= 20;
  }

  if (key == 'a' || key == 'A') {
    randXint -= 20;
  }

  if (key == 'd' || key == 'D') {
    randXint += 20;
  }
  ellipse(randXint, randYint, 20, 20);
}



