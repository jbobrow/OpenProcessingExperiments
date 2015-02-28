
PImage babyHead;
PImage babyJaw;
PImage babyBody;
int[][] tailCoordinates;
int tailLength;
int headHeight;
int xdiff;
color bg;
boolean isBaby;

void setup() {
  noCursor();
  isBaby = false;
  bg = #585834;
  headHeight=100;
  xdiff = 0;
  size(1000, 600);
  babyHead=loadImage("BabyHead.png");
  babyJaw=loadImage("Babyjaw.png");  
  babyBody=loadImage("Body.png");
  tailLength=50;
  tailCoordinates = new int[tailLength][2];
  for (int x=0; x<tailLength; x+=1) {
    for (int y=0; y<2; y+=1) {
      tailCoordinates[x][y] = -100;
    }
  }
}

void draw() {
  background(bg);
  stroke(0, 0);
  image(babyJaw, mouseX-125, headHeight);
  for (int i = 0; i<tailLength-1; i++) {
    tailCoordinates[i][0]=tailCoordinates[i+1][0]-10+int(random(-5, 5));
    tailCoordinates[i][1]=tailCoordinates[i+1][1]+int(pow(1.1, tailLength-i))+int(random(-5, 5));
  }
  tailCoordinates[tailLength-1][0]=mouseX+14;
  tailCoordinates[tailLength-1][1]=headHeight+180;
  for (int i = 0; i<tailLength; i++) {
    if (mouseX>300) {
      xdiff = (mouseX-300)/100;
      fill(1.5*i, 2*i, .5*i, 2*i*xdiff);

      if (isBaby) {
        image(babyHead, tailCoordinates[i][0]-xdiff*10, tailCoordinates[i][1]-xdiff*10, int(xdiff/2*random(30, 20)), int(xdiff/2*random(30, 20)));
      }
    }
    else {
      fill(1.5*i, 2*i, .5*i, 0);
    }

    ellipse(tailCoordinates[i][0], tailCoordinates[i][1], int(random(10, 30)), int(random(10, 30)));
  }

  image(babyHead, mouseX-125, headHeight);
  if (mouseX>200 && mouseX<600 && (mouseX-pmouseX)>0) {
    stroke(255, mouseX/5);
    fill(255, 0);
    line(mouseX-10, headHeight+115, 0, headHeight+400-mouseX/2);
    line(mouseX-10, headHeight+115, 0, mouseX/2-100);
    arc(mouseX-90, headHeight+115, 10000/mouseX, 20000/mouseX, random(0, 2*PI), random(0, 2*PI));
    arc(mouseX-120, headHeight+115, 20000/mouseX, 40000/mouseX, random(0, 2*PI), random(0, 2*PI));
  }
  stroke(0, 0);
  if (mouseX>800) {
    fill(random(100, 255), 255, 0, mouseX-(width-300));
    beginShape();
    vertex(0, headHeight+150+int(random(-500, 500)));
    vertex(0, headHeight+90+int(random(-500, 500)));
    vertex(mouseX-10, headHeight+115);
    vertex(mouseX-5, headHeight+120);
    endShape();
  }
  if (mouseX>300) {
    fill(random(100, 255), 255, 0, mouseX-(width-300));
    beginShape();
    vertex(0, headHeight+150+int(random(-20, 20)));
    vertex(0, headHeight+90+int(random(-20, 20)));
    vertex(mouseX-10, headHeight+115);
    vertex(mouseX-5, headHeight+120);
    endShape();
  }
  if (mouseX>100) {
    fill(random(200, 255), 255, 200, mouseX-(width-400));
    beginShape();
    vertex(0, headHeight+140+int(random(-20, 20)));
    vertex(0, headHeight+100+int(random(-20, 20)));
    vertex(mouseX-10, headHeight+115);
    vertex(mouseX-5, headHeight+120);
    endShape();
  }
}

void keyPressed() {
  if (key == '1') {
    bg = color(255);
  }
  else if (key == '2') {
    bg = color(200, 0, 0);
  }
  else if (key == '3') {
    bg = color(0, 200, 0);
  }
  else if (key == '4') {
    bg = color(0, 0, 200);
  }
  else if (key == '5') {
    bg = color(200, 200, 200);
  }
  else if (key == '6') {
    bg = color(200, 200, 0);
  }
  else if (key == '7') {
    bg = color(0, 200, 200);
  }
  else if (key == '8') {
    bg = color(200, 0, 200);
  }
  else if (key == '9') {
    bg = color(0, 0, 0);
  }
  else if (key == '0') {
    bg = #585834;
  }
  else if (key == ' ') {
    isBaby = !isBaby;
  }
}


