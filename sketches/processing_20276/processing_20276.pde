
/*Adam Oaks
 Oscillating Water Column Energy Generation Tool
 
 controls:
 base width = left & right arrows
 intermediate width = z & x keys
 intermediate height = up & down arrows
 top width = a & d keys
 top height = w & s keys
 fan height = e & r keys
 fan diameter = i & o keys
 save design = p key
 */

void setup() {
  size(400,400);
  smooth();
  Owc();
}

float owcTopWidth =75;
float owcTopHeight = 300;
float owcMidWidth = 100;
float owcMidHeight = 200;
float owcBaseWidth = 300;
float fanSize = 50;
float fanHeight = 150;
float widthScale = .5;

void draw() {
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      owcMidHeight++;
      Owc();
    }
    else if (keyCode == DOWN) {
      owcMidHeight--;
      Owc();
    }
    else if (keyCode == LEFT) {
      owcBaseWidth--;
      Owc();
    }
    else if (keyCode == RIGHT) {
      owcBaseWidth++;
      Owc();
    }
  }
  if (key == 'a' || key == 'A') {
    owcTopWidth++;
    Owc();
  }
  else if (key == 'd' || key == 'D') {
    owcTopWidth--;
    Owc();
  }

  else if (key == 'w' || key == 'W') {
    owcTopHeight++;
    Owc();
  }

  else if (key == 's' || key == 'S') {
    owcTopHeight--;
    Owc();
  }

  else if (key == 'z' || key == 'Z') {
    owcMidWidth++;
    Owc();
  }

  else if (key == 'x' || key == 'X') {
    owcMidWidth--;
    Owc();
  }
  else if (key == 'i' || key == 'I') {
    fanSize--;
    Owc();
  }
  else if (key == 'o' || key == 'O') {
    fanSize++;
    Owc();
  }
  else if (key == 'e' || key == 'E') {
    fanHeight--;
    Owc();
  }
  else if (key == 'r' || key == 'R') {
    fanHeight++;
    Owc();
  }
  if((key=='p')||(key=='P')) {
    saveFrame("owc-####.tif");
    println("saved");
  }
}

void Owc() {

  //background(255);
  PImage sky;
  sky = loadImage("sky.jpg");
  image(sky,0,0,width,height/1.5);


  fill(255,204,51);
  noStroke();
  beginShape();
  vertex(width/2+owcBaseWidth*widthScale, height-75);
  vertex(width/2-owcBaseWidth*widthScale, height-75);
  vertex(width/2-owcMidWidth*widthScale, height-owcMidHeight);
  vertex(width/2+owcMidWidth*widthScale, height-owcMidHeight);
  vertex(width/2+owcBaseWidth*widthScale, height-75);
  endShape();
  beginShape();
  vertex(width/2+owcMidWidth*widthScale, height-owcMidHeight);
  vertex(width/2-owcMidWidth*widthScale, height-owcMidHeight);
  vertex(width/2-owcTopWidth*widthScale, height-owcTopHeight);
  vertex(width/2+owcTopWidth*widthScale, height-owcTopHeight);
  vertex(width/2+owcMidWidth*widthScale, height-owcMidHeight);
  endShape();


  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(width/2,fanHeight,fanSize,fanSize);
  fill(150);
  ellipse(width/2,fanHeight,10,10);

  rectMode(CENTER);
  fill(89,132,189,90);
  rect(width/2,height,width,height/1.5);
}


