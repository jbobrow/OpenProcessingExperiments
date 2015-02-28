
Petal[] petals = new Petal[48];
Tree[] trees = new Tree[4];

float radius = 15;
float angle = TWO_PI/48;

void setup() {
  size(800, 600);
  smooth();
  for (int i = 0; i < petals.length; i++) {
    petals[i] = new Petal((width/4)+(radius*sin(angle*i)), (3*(height/4))+(radius*cos(angle*i)), color(random(0, 255), random(0, 255), random(0, 255)), random(2, 5), random(.15, 2), random(.5, 2));
  }
  for (int j = 0; j < trees.length; j++) {
    trees[j] = new Tree(75+(j*200), 500, 75+(j*200), 350, 300, color(193, 154, 107), color(255, 183, 197));
  }
}

void draw() {
  background(135, 206, 235);

  strokeWeight(0);
  fill(240, 225, 48);
  ellipse(width/2, 0, width/4, 200);

  fill(255, 200);
  ellipse(100, 100, 50, 20);
  ellipse(700,100, 50,20);
  ellipse(250,80,80,30);

  for (int j = 0; j < trees.length; j++) {
    trees[j].display();
  }
  
  fill(34,139,34);
  rectMode(CENTER);
  rect(width/2,595,width,10);

  strokeWeight(3);
  fill(116, 195, 101);
  line(width/4, height, width/4, 3*(height/4));

  for (int i = 0; i < petals.length; i++) {
    petals[i].display();
  }
  if (mousePressed == true) {
    for (int i = 0; i < petals.length; i++) {
      petals[i].drift();
    }
  } 
  else if (mousePressed == false) {
    for (int i = 0; i < petals.length; i++) {
      petals[i].fall();
    }
  }
}

void mousePressed() {
  for (int i = 0; i < petals.length; i++) {
    petals[i].fly();
  }
}


class Petal {
  color c;
  float xpos;
  float ypos;
  float blow;
  float wind;
  float fall;

  Petal(float xpos_, float ypos_, color tempC, float blow_, float wind_, float fall_) {
    xpos = xpos_;
    ypos = ypos_;
    c = tempC;
    blow = blow_;
    wind = wind_;
    fall = fall_; 
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(c);
    strokeWeight(0);
    rect(xpos, ypos, 10, 10);
  }

  void fly() {
    xpos = random(width/4,(width/4)+20);
    ypos = random(3*(height/4)-10,3*(height/4)+10);
  }
    
  void drift() {
    xpos = xpos + blow; 
    ypos = ypos - wind;
  }
  
  void fall(){
    xpos = xpos + fall;
    ypos = ypos + fall; 
  }
}

class Tree {
  color c1;
  color c2;
  float tempX;
  float tempY;
  float tempW;
  float tempZ;
  float radius1;
  
  Tree (float tempX_, float tempY_, float tempW_, float tempZ_, float radius1_, color tempc1_, color tempc2_){
  tempX = tempX_;
  tempY = tempY_;
  tempW = tempW_;
  tempZ = tempZ_;
  radius1 = radius1_;
  c1 = tempc1_;
  c2 = tempc2_;
  }
  
  void display(){
    rectMode(CENTER);
    fill(c1);
    rect(tempX, tempY, 75, 400);
    strokeWeight(0);
    fill(c2);
    ellipse(tempW, tempZ, radius1, radius1);
    
  }
}



