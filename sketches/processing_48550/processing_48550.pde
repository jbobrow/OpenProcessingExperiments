
/*
 Final
 Joy Lee
 
 Interactive Design 2
 Michael Kontopoulos
 Fall 2011
 
 
 If you were offered instant fame, would you accept?
 
 The first graph shows a bar graph with heights adjusted by number of surveys.
 The single lines represent the singles, 
 the paired lines are people who are in relationships, 
 and the twisted lines are those that are married.
 
 The second graph shows the answers as percentages compared within each age group.
 */




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
PImage stats;
PImage noMarried;
PImage yesMarried;



void setup () {
  size(1280, 720);
  background(bgcolor);
  smooth();
  noStroke();
  stats = loadImage("stats.png");
  noMarried = loadImage("no_married.png");
  yesMarried = loadImage("yes_married.png");
}



void draw () {
  if (mode==1) {
    background(bgcolor);
    // age group 0: 0-9
    for (int i=0; i<ageGroup0.length; i++) {
      int group0Vals = int(ageGroup0[i]);
      graphOne(group0Vals, 340, i);
    }
    // age group 1: 10-19
    for (int i=0; i<ageGroup1.length; i++) {
      int group1Vals = int(ageGroup1[i]);
      graphOne(group1Vals, 460, i);
    }
    // age group 2: 20-29
    for (int i=0; i<ageGroup2.length; i++) {
      int group2Vals = int(ageGroup2[i]);
      graphOne(group2Vals, 580, i);
    }
    // age group 3: 30-39
    for (int i=0; i<ageGroup3.length; i++) {
      int group3Vals = int(ageGroup3[i]);
      graphOne(group3Vals, 700, i);
    }
    // age group 4: 40-49
    for (int i=0; i<ageGroup4.length; i++) {
      int group4Vals = int(ageGroup4[i]);
      graphOne(group4Vals, 820, i);
    }
    // age group 5: 50-59
    for (int i=0; i<ageGroup5.length; i++) {
      int group5Vals = int(ageGroup5[i]);
      graphOne(group5Vals, 820, i);
    }
    // age group 6: 60+
    for (int i=0; i<ageGroup6.length; i++) {
      int group6Vals = int(ageGroup6[i]);
      graphOne(group6Vals, 820, i);
    }
  } 
  else if (mode==2) {
    background(bgcolor);

    // bars
    for (int x = 340; x< 1000; x+=100) {
      noStroke();
      fill(230);
      rect(x+5, margin+5, barWidth, barHeight);
      fill(255);
      rect(x, margin, barWidth, barHeight);
    }

    // age group 0: 0-9
    for (int i=0; i<ageGroup0.length; i++) {
      int group0Vals = int(ageGroup0[i]);
      graphTwo(group0Vals, 340, i, ageGroup0.length);
    }

    // age group 1: 10-19
    for (int i=0; i<ageGroup1.length; i++) {
      int group1Vals = int(ageGroup1[i]);
      graphTwo(group1Vals, 440, i, ageGroup1.length);
    }

    // age group 2: 20-29
    for (int i=0; i<ageGroup2.length; i++) {
      int group2Vals = int(ageGroup2[i]);
      graphTwo(group2Vals, 540, i, ageGroup2.length);
    }

    // age group 3: 30-39
    for (int i=0; i<ageGroup3.length; i++) {
      int group3Vals = int(ageGroup3[i]);
      graphTwo(group3Vals, 640, i, ageGroup3.length);
    }

    // age group 4: 40-49
    for (int i=0; i<ageGroup4.length; i++) {
      int group4Vals = int(ageGroup4[i]);
      graphTwo(group4Vals, 740, i, ageGroup4.length);
    }

    // age group 5: 50-59
    for (int i=0; i<ageGroup5.length; i++) {
      int group5Vals = int(ageGroup5[i]);
      graphTwo(group5Vals, 840, i, ageGroup5.length);
    }

    // age group 6: 60+
    for (int i=0; i<ageGroup6.length; i++) {
      int group6Vals = int(ageGroup6[i]);
      graphTwo(group6Vals, 940, i, ageGroup6.length);
    }
  }
  else if (mode==3) {
    image(stats, 0, 0);
  }
  fill(250, 100, 130);
  rect(20, 20, 80, 15);
  fill(250, 180, 0);
  rect(20, 40, 80, 15);
  fill(250, 160, 0);
  rect(20, 60, 80, 15);
}


void graphOne(int v, int x, int a) {
  if (v == 1) {
    fill(250, 100, 130);
    rect(x, margin+barHeight, 5, 5*-a);
  }
  if (v == 2) {
    fill(250, 100, 130);
    rect(x+30, margin+barHeight, 5, 5*-a);
    fill(180, 80, 150);
    rect(x+35, margin+barHeight, 5, 5*-a);
  }
  if (v == 3) {
//    fill(180, 80, 150);
    image(noMarried, x+70, 280);
    fill(bgcolor);
    rect(x+70, 280, 12, 5*a);
  }
  if (v == 4) {
    fill(250, 180, 0);
    rect(x+10, margin+barHeight, 5, 5*-a);
  }
  if (v == 5) {
    fill(250, 180, 0);
    rect(x+45, margin+barHeight, 5, 5*-a);
    fill(250, 140, 0);
    rect(x+50, margin+barHeight, 5, 5*-a);
  }
  if (v == 6) {
    fill(250, 140, 0);
//    rect(x+85, margin+barHeight, 10, 5*-a);
image(yesMarried, x+85, 280);
    fill(bgcolor);
    rect(x+85, 280, 12, 5*a);
  }
}


void graphTwo(int v, int x, int y, int a) {
  if (v == 1) {
    fill(250, 100, 130);
  }
  if (v == 2) {
    fill(220, 90, 140);
  }
  if (v == 3) {
    fill(180, 80, 150);
  }
  if (v == 4) {
    fill(250, 180, 0);
  }
  if (v == 5) {
    fill(250, 160, 0);
  }
  if (v == 6) {
    fill(250, 140, 0);
  }
  rect(x, margin+y*(barHeight/a), barWidth, barHeight/a);
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


