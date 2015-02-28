
int[] sp = {
  0, height/2
};
int[] ep = {
  width, height/2
};
int[] cp1 = {
  width/3, height/3
};
int[] cp2 = {
  (width/3)*2, (height/3)*2
};

int cpVis=1;


void setup() {
  size(600, 600);
  sp[0]=50;
  sp[1]=height/2;

  ep[0]=width-50;
  ep[1]=height/2;

  cp1[0]= width/3;
  cp1[1]= height/4;

  cp2[0]=(width/3)*2;
  cp2[1]=height/4;
  smooth();
  background(0);
  frameRate(60);
  //noLoop();
}
int a=0;
void draw() {



  fill(0, 0, 0, 10);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  stroke(255);
  strokeWeight(1);

  bezier(sp[0], sp[1], cp1[0], cp1[1], cp2[0], cp2[1], ep[0], ep[1]);


  stroke(255, 255, 0);
  fill(255, 255, 0);
  strokeWeight(1);
  line(sp[0], sp[1], cp1[0], cp1[1]);
  ellipse(cp1[0], cp1[1], 10, 10);
  ellipse(sp[0], sp[1], 10, 10);

  line(ep[0], ep[1], cp2[0], cp2[1]);
  ellipse(ep[0], ep[1], 10, 10);
  ellipse(cp2[0], cp2[1], 10, 10);
  
  
  if (mousePressed) {
    if (mousePressed && dist(mouseX, mouseY, cp1[0], cp1[1]) <30) {
      cp1[0] = mouseX;
      cp1[1] = mouseY;
    }
    if (mousePressed && dist(mouseX, mouseY, cp2[0], cp2[1]) <30) {
      cp2[0] = mouseX;
      cp2[1] = mouseY;
    }
    if (mousePressed && dist(mouseX, mouseY, sp[0], sp[1]) <30) {
      sp[0] = mouseX;
      sp[1] = mouseY;
    }
    if (mousePressed && dist(mouseX, mouseY, ep[0], ep[1]) <30) {
      ep[0] = mouseX;
      ep[1] = mouseY;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    sp[0]=50;
    sp[1]=height/2;

    ep[0]=width-50;
    ep[1]=height/2;

    cp1[0]= width/3;
    cp1[1]= height/4;

    cp2[0]=(width/3)*2;
    cp2[1]=height/4;
  }
}


