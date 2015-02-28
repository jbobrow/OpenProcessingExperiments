
/*
 Makes a tree using recursion.
 Instead of having one tree, I made my tree bigger by having
 other trees stacked on the first tree. As the tree grew, the braches of
 the tree began to become deformed. This results in a really ugly tree that
 also makes it look somewhat spooky.

 Arturo Alviar
 1/25/2014
 */

int treeNum=9; //number of trees used to make big tree
NoiseSky sky = new NoiseSky(); // declare sky varaible
Mountains mountainRange = new Mountains(); // declare mountain range variable
Tree[] trees = new Tree[treeNum]; //make tree array
void setup() {
  size(800, 800);
  smooth();
  background(0);
  sky.paint(); //paint the sky
  mountainRange.paint(); //paint the mountains
  for (int i = 0; i < trees.length; i++) { //fill tree array with tree objects
    trees[i] = new Tree();
    trees[i].treeHeight = 150*0.5; //make each tree half the height
    trees[i].theta = radians(24*i); // change the theta
  }
  noLoop();
}



void draw() {
  translate(width/2, height);
  for (int i = 0; i < trees.length; i++) {
    trees[i].paint();
  }
}


class Tree {
  float treeHeight, theta, noiseVar, noiseStep, noiseStart;
  Tree() {
    noiseVar = 0.008;
    noiseStep = 0.003;
    noiseStart = 0;
  }

  void branch(float len) {
    stroke(random(230,255));
    strokeWeight(len*0.1);
    line(0, 0, 0, -len);
    translate(0, -len);
    len *= 0.66;
    if (len > 2) {
      pushMatrix();
      rotate(theta+noise(noiseVar)*theta - theta/2);
      noiseVar+=noiseStep;
      branch(len);
      popMatrix();
      pushMatrix();
      rotate(-theta-noise(noiseVar)*theta - theta/2);
      noiseVar+=noiseStep;
      branch(len);
      popMatrix();
    }
  }
  void paint() {
    noiseVar = noiseStart;
    branch(treeHeight);
  }
}

class NoiseSky {
  float xStart, xNoise, yNoise;
  NoiseSky() {
    xStart = random(10);
    xNoise = xStart; 
    yNoise = random(10);
  }

  void paint() {
    for (int y = 0; y <=height/2+height/5; y+=5) {
      yNoise +=0.01;
      xNoise = xStart;
      for (int x = 0; x <=width; x+=5) {
        xNoise+=0.01;
        stroke(135, 0, 230, random(255));
        drawPoint(x, y, noise(xNoise, yNoise));
      }
    }
    noLoop();
  }

  void drawPoint(float x, float y, float noiseFactor) {
    float len=5 * noiseFactor;
    rect(x, y, len, len);
  }
}

class Mountains {
  float noiseScale, randomX, randomY;
  Mountains() {
    noiseScale=0.04;
    randomX = random(width);
    randomY = random(height/6);
  }  
  void paint() {
    for (int x=0; x < width; x++) {
      float noiseVal = noise((randomX+x)*noiseScale, randomY*noiseScale);
      stroke(0);
      line(x, (randomY+noiseVal*190)+height/4+height/6, x, height/2+height/4);
    }
  }
}


void keyReleased() {
  switch(key) {
  case 's':
    saveFrame("aalviar_hw12-####.png");
    break;
  case 'r':
    redraw();
    break;
  }
} 



