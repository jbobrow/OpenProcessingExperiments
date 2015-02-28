
int[] ageGroup0 = {
  1, 1, 4, 4, 4, 4, 4, 4, 4, 5
};
int[] ageGroup1 = {
  1, 1, 2, 2, 4, 4, 4, 4, 5, 5
};
int[] ageGroup2 = {
  1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 
  2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 5, 5, 5, 5, 6, 6
};
int[] ageGroup3 = {
  1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 
  3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 
  4, 4, 4, 4, 5, 5, 5, 6, 6, 6
};
int[] ageGroup4 = {
  3, 4, 6
};
int[] ageGroup5 = {
  3, 5, 6
};
int[] ageGroup6 = {
  3, 6
};

color bgcolor = color(250);
color shadow = color(230);
int barHeight = 300;
int barWidth = 20;
int margin = 200;
int mode=1;
PImage married;
PImage noMarried;
PImage yesMarried;
PImage shadowMarried;



void setup () {
  size(1280, 720);
  smooth();
  noStroke();
  married = loadImage("married.png");
  noMarried = loadImage("no_married.png");
  yesMarried = loadImage("yes_married.png");
  shadowMarried = loadImage("shadow_married.png");
}



void draw () {
  if (mode==1) {
    background(bgcolor);

    // bars
    for (int x = 340; x< 1000; x+=100) {
      noStroke();
      fill(230);
      rect(x+5, margin+5, barWidth, barHeight);
      fill(255);
      rect(x, margin, barWidth, barHeight);
      image(married, x, margin);
    }


    // age group 0: 0-9
    for (int i=0; i<ageGroup0.length; i++) {
      int group0Vals = int(ageGroup0[i]);
      barGraph(group0Vals, 340, i, ageGroup0.length);
    }

    // age group 1: 10-19
    for (int i=0; i<ageGroup1.length; i++) {
      int group1Vals = int(ageGroup1[i]);
      barGraph(group1Vals, 440, i, ageGroup1.length);
    }

    // age group 2: 20-29
    for (int i=0; i<ageGroup2.length; i++) {
      int group2Vals = int(ageGroup2[i]);
      barGraph(group2Vals, 540, i, ageGroup2.length);
    }

    // age group 3: 30-39
    for (int i=0; i<ageGroup3.length; i++) {
      int group3Vals = int(ageGroup3[i]);
      barGraph(group3Vals, 640, i, ageGroup3.length);
    }

    // age group 4: 40-49
    for (int i=0; i<ageGroup4.length; i++) {
      int group4Vals = int(ageGroup4[i]);
      barGraph(group4Vals, 740, i, ageGroup4.length);
    }

    // age group 5: 50-59
    for (int i=0; i<ageGroup5.length; i++) {
      int group5Vals = int(ageGroup5[i]);
      barGraph(group5Vals, 840, i, ageGroup5.length);
    }

    // age group 6: 60+
    for (int i=0; i<ageGroup6.length; i++) {
      int group6Vals = int(ageGroup6[i]);
      barGraph(group6Vals, 940, i, ageGroup6.length);
    }
  } 
  else if (mode==2) {
  }
  else if (mode==3) {
    background(0, 0, 255);
  }
  fill(0);
  rect(20, 20, 80, 15);
  rect(20, 40, 80, 15);
  rect(20, 60, 80, 15);
}



void barGraph(int v, int x, int y, int a) {
  if (v == 1) {
    fill(250, 100, 130);
    rect(x, margin+y*(barHeight/a), barWidth, barHeight/a);
  }
  if (v == 2) {
    fill(180, 80, 150);
    rect(x, margin+y*(barHeight/a), barWidth/2, barHeight/a);
    //    fill(220, 90, 140);
    fill(250, 100, 130);
    rect(x+10, margin+y*(barHeight/a), barWidth/2, barHeight/a);
  }
  if (v == 3) {
 fill(180, 80, 150);
  }
  if (v == 4) {
    fill(250, 180, 0);
    rect(x, margin+y*(barHeight/a), barWidth, barHeight/a);
  }
  if (v == 5) {
//    fill(250, 160, 0);
fill(250, 180, 0);
    rect(x, margin+y*(barHeight/a), barWidth/2, barHeight/a);
    fill(250, 140, 0);
    rect(x+10, margin+y*(barHeight/a), barWidth/2, barHeight/a);
  }
  if (v == 6) {
    fill(250, 140, 0);
//    rect(x, margin+y*(barHeight/a), barWidth, barHeight/a);
  }
  //  rect(x, margin+y*(barHeight/a), barWidth, barHeight/a);
}



void mousePressed() {
  //(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed)
  if (mouseX > 20 && mouseX < 20+80 && mouseY > 20 && mouseY < 20+15 && mousePressed) {
    mode=1;
  }
  else if (mouseX > 20 && mouseX < 20+80 && mouseY > 40 && mouseY < 40+15 && mousePressed) {
    mode=2;
  }
  else if (mouseX > 40 && mouseX < 40+80 && mouseY > 60 && mouseY < 60+15 && mousePressed) {
    mode=3;
  }
}


