
float theta = radians(30);
PImage spring,summer,autumn,winter;

/* @pjs preload="spring.png,summer.png,autumn.png,winter.png"; */

void setup() {
  size(700, 700);
  background(93, 73, 49);
  noStroke();
  fill(255);
  ellipse(width/2, height/2, width-100, width-100);
  spring = loadImage("spring.png");
  summer = loadImage("summer.png");
  autumn = loadImage("autumn.png");
  winter = loadImage("winter.png");
  image(spring, 180, 100);
  translate(width/2, height);
  branch(130);
  leaf(130);
}

void draw() {
}

void keyPressed()
{   
  pushMatrix();
  if (key == CODED) {
    if (keyCode == 37) {
      background(93, 73, 49);
      noStroke();
      fill(255);
      ellipse(width/2, height/2, width-100, width-100);
      image(spring, 180, 100);
      translate(width/2, height);
      branch(130);
      leaf(130);
    }
    if (keyCode == 38) {
      background(93, 73, 49);
      noStroke();
      fill(255);
      ellipse(width/2, height/2, width-100, width-100);
      image(summer, 180, 100);
      translate(width/2, height);
      summerbranch(130);
      summerleaf(130);
    }
    if (keyCode == 39) {
      background(93, 73, 49);
      noStroke();
      fill(255);
      ellipse(width/2, height/2, width-100, width-100);
      image(autumn, 180, 100);
      translate(width/2, height);
      autumnbranch(130);
      autumnleaf(130);
    }
    if (keyCode == 40) {
      background(93, 73, 49);
      noStroke();
      fill(255);
      ellipse(width/2, height/2, width-100, width-100);
      image(winter, 180, 100);
      translate(width/2, height);
      winterbranch(130);
    }
  }
  popMatrix();
}

void leaf(float len) {
  fill(255, 124, 190, 100);
  if (len <= 100) {
    noStroke();
    ellipse(0, 0, 8, 8);
  }
}

void branch(float len) {

  strokeWeight(len/9);
  stroke(93, 73, 49);
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 17) { // no inf. loop

    pushMatrix();
    //rotate(-sin(theta)*len*noise(.1));
    rotate(theta+random(.1, 1)*noise(.2));
    branch(len*.65);
    leaf(len*.65);
    popMatrix();

    pushMatrix();
    rotate(theta+random(-.2, .2));
    branch(len*.75);
    leaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(-.2, .2));
    branch(len*.75);
    leaf(len*.75);
    popMatrix();

    pushMatrix();
    //rotate(-sin(theta)*len*noise(.1));
    rotate(-theta-random(.1, 1));
    branch(len*.65);
    leaf(len*.65);
    popMatrix();
  }
}

void autumnleaf(float len) {
  fill(247, 197, 67, 100);
  if (len <= 100) {
    noStroke();
    ellipse(0, 0, 8, 8);
  }
}

void autumnbranch(float len) {

  strokeWeight(len/9);
  stroke(93, 73, 49);
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 17) {

    pushMatrix();
    rotate(theta+random(.1, 1)*noise(.2));
    autumnbranch(len*.65);
    autumnleaf(len*.65);
    popMatrix();

    pushMatrix();
    rotate(theta+random(-.2, .2));
    autumnbranch(len*.75);
    autumnleaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(-.2, .2));
    autumnbranch(len*.75);
    autumnleaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(.1, 1));
    autumnbranch(len*.65);
    autumnleaf(len*.65);
    popMatrix();
  }
}

void summerleaf(float len) {
  fill(166, 232, 112, 100);
  if (len <= 100) {
    noStroke();
    ellipse(0, 0, 8, 8);
  }
}

void summerbranch(float len) {

  strokeWeight(len/9);
  stroke(93, 73, 49);
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 17) {

    pushMatrix();
    rotate(theta+random(.1, 1)*noise(.2));
    summerbranch(len*.65);
    summerleaf(len*.65);
    popMatrix();

    pushMatrix();
    rotate(theta+random(-.2, .2));
    summerbranch(len*.75);
    summerleaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(-.2, .2));
    summerbranch(len*.75);
    summerleaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(.1, 1));
    summerbranch(len*.65);
    summerleaf(len*.65);
    popMatrix();
  }
}

void winterbranch(float len) {

  strokeWeight(len/19);
  stroke(93, 73, 49);
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 40) {

    pushMatrix();
    rotate(theta+random(.1, 1)*noise(.2));
    winterbranch(len*.65);
    popMatrix();

    pushMatrix();
    rotate(theta+random(-.2, .2));
    winterbranch(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(-.2, .2));
    winterbranch(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(.1, 1));
    winterbranch(len*.65);
    popMatrix();
  }
}

