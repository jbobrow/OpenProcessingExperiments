
Coffee[] coffee;
CupTree[] tree;


float theta;

void setup() {
  size(900, 800);

  coffee = new Coffee[5];
  tree = new CupTree[10];
  for (int i=0; i<tree.length; i++) {
    tree[i]=new CupTree(random(50, 850), random(300, height-100), random(50, 70), random(radians(-50), radians(50)));
  }
  for (int i=0; i<coffee.length; i++) {
    coffee[i] = new Coffee(random(width), random(500, height), random(50, 100));
  }
}

void draw() {
  background(#90651F);


  //nice hills!
  fill(#AF8541, 100);
  noStroke();
  ellipse(0, height, 1000, height);
  ellipse(100, 600, 1000, height);
  ellipse(width, 700, 1200, height);
  ellipse(width/2, 700, 800, 800);



  for (int i=0; i<tree.length; i++) {
    tree[i].makeTree();
    tree[i].shakeTree();
  }

  for (int i=0; i<coffee.length; i++) {
    coffee[i].draw();
    coffee[i].move();
  }
}

class Coffee {
  float x;
  float y;
  float size;
  float speed;
  float theta;
  float theta2;
  Waves[] waves;

  Coffee(float tempX, float tempY, float tempSize) {
    x = tempX;
    y = tempY;

    size = tempSize;
    speed = size/(size*10);
    theta=0;
    theta2=0;

    waves = new Waves[4];
    for (int i = 0; i<waves.length; i++) {
      waves[i]=new Waves();
    }
  } 

  void draw() {
    stroke(0);
    fill(#764E23);
    strokeWeight(size/30);


    pushMatrix();
    translate(x, y);
    //body
    beginShape();
    vertex(-0.75*size, -0.50*size);
    vertex(0.75*size, -0.50*size);
    bezierVertex(0.75*size, 0.75*size, -0.75*size, 0.75*size, -0.75*size, -0.50*size);
    theta+=speed/4;
    //move!
    rotate(map(noise(theta), 0, 1, size/size*-0.5, size/size*0.5));
    endShape(CLOSE);

    //left eye
    beginShape();
    vertex(-0.10*size, -0.25*size);
    bezierVertex(-0.10*size, -0.10*size, -0.50*size, -0.10*size, -0.50*size, -0.25*size);
    endShape();

    //right eye
    beginShape();
    vertex(0.10*size, -0.25*size);
    bezierVertex(0.10*size, -0.10*size, 0.50*size, -0.10*size, 0.50*size, -0.25*size);
    endShape();

    //handle
    beginShape();
    noFill();
    vertex(0.75*size, -0.30*size);
    bezierVertex(size, -0.30*size, size, 0.25*size, 0.48*size, 0.25*size);
    endShape();

    //my waves
    for (int i = 0; i<waves.length; i++) {
      pushMatrix();
      translate(-0.60*size+i*0.37*size, -0.6*size);
      waves[i].makeWave(speed, size);
      waves[i].moveWave(speed, size);
      popMatrix();
    }

    popMatrix();
  }

  void move() {
    theta2+=speed/2;

    x+=map(noise(theta2), 0, 1, -random(5,10), random(5,10));     
    y+=map(noise(theta2), 0, 1, -random(5,10), random(5,10));
    
    x = constrain(x,50,750);
    y = constrain(y,500,750);
  }
}

class CupTree {
  Cup cup;
  float x;
  float y;
  float size;
  float angle;
  float startAngle;
  float theta;

  CupTree(float tempX, float tempY, float tempSize, float tempAngle) {
    size = tempSize;
    x = tempX;
    y = tempY;
    angle = tempAngle;
    startAngle = radians(0);


    theta=0;

    cup = new Cup(size, angle);
  }

  //shake that tree plz
  void shakeTree() {
    startAngle+=map(noise(theta), 0, 1, radians(-3), radians(3));
    theta+=0.05;
    startAngle=constrain(startAngle, radians(-5), radians(5));
  }

  void makeTree() {
    cup.drawCup(x, y, startAngle, 20);
  }
}

class Cup {
  float maxSize;
  float xPos, yPos;
  float maxAngle;
  float angleIncrement;
  float increaseSize;

  float startSize;
  float startAngle;


  Cup(float tempSize, float tempAngle) {
    maxSize = tempSize;
    maxAngle = tempAngle;

    angleIncrement = tempAngle/8;
    increaseSize= maxSize/12;

    startAngle = radians(0);
    startSize = 20;
  } 

  void drawCup(float tempXPos, float tempYPos, float startAngle_, float startSize_) {
    xPos = tempXPos;
    yPos = tempYPos;

    startAngle = startAngle_;
    startSize = startSize_;

    pushMatrix();
    translate(xPos, yPos);
    rotate(startAngle);

    noStroke();
    //cup
    fill(#42CB6C, 150);
    beginShape();
    vertex(0, 0);
    vertex(startSize/6, startSize);
    bezierVertex(startSize/6, startSize+startSize/4, startSize-startSize/6, startSize+startSize/4, startSize-startSize/6, startSize);
    vertex(startSize, 0);
    endShape();

    //lid
    fill(#764E23);
    beginShape();
    vertex(0, 0);
    bezierVertex(0, startSize/3, startSize, startSize/3, startSize, 0);
    bezierVertex(startSize, -startSize/3, 0, -startSize/3, 0, 0);
    endShape();

    //straw
    beginShape();
    stroke(0);
    strokeWeight(1);
    vertex(startSize/2, 0);
    vertex(startSize/1.5, -startSize/1.5);
    endShape();

    popMatrix();

    //more cups to complete cup tree!
    if (maxAngle<startAngle && maxSize>startSize) {
      drawCup(xPos-startSize*0.2+startSize*startAngle*0.65, yPos-startSize*0.65, startAngle+angleIncrement, startSize+increaseSize);
    } else if (startAngle<maxAngle && startSize<maxSize) {
      drawCup(xPos+startSize*startAngle*0.9, yPos-startSize*0.8, startAngle+angleIncrement, startSize+increaseSize);
    }
  }
}

class Waves {
  float theta;

  Waves() {
    theta=0;
  }
  
  void makeWave(float speed, float size) {
    stroke(0);
    float y = theta;
    for (int i = 0; i<300; i++) {
      float x= sin(y)*size/15;
      point(0+x, 0-i*size/300);
      //move along Y axis;
      y+=speed/2;
    }
  }
  
  void moveWave(float speed, float size) {
    theta+=speed;
  }
  
}




