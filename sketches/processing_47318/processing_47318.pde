
int[] ageGroup0n = {
  0, 0
};
float[] ageGroup0y = {
  0, 0, 0, 0, 0, 0, 0, 1
};


int[] ageGroup1n = {
  0, 0, 1, 1
};
int[] ageGroup1y = {
  0, 0, 0, 0, 1, 1
};


int[] ageGroup2n = {
  0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2
};
int[] ageGroup2y = {
  0, 0, 0, 0, 0, 1, 1, 2
};


int[] ageGroup3n = {
  0, 1, 1, 2, 2, 2, 2
};
int[] ageGroup3y = {
  0, 0, 1
};


int[] ageGroup4n = {
2
};
int[] ageGroup4y = {
};


int[] ageGroup5n = {
  2
};
int[] ageGroup5y = {
};


int[] ageGroup6n = {
  2
};
int[] ageGroup6y = {
};




PFont font;
int barHeight = 400;
int barWidth = 40;
int labelWidth = 50;
int labelHeight = 20;
int labelY = 470;
int margin = 50;




void setup () {
  size(750, 500);
  colorMode(RGB);
  smooth();
  noStroke();
  font = loadFont("NewsGothicBT-Bold-48.vlw");
}




void draw () {
  background(250);

  fill(50);
  textFont(font);


  // question
  textAlign(LEFT);
  textSize(24);
  text("If you were offered instant fame, would you accept?", margin, margin, 160, height-margin);


  // label: age groups
  textAlign(CENTER);
  textSize(11);
  text("0-9", 240, labelY, labelWidth, labelHeight);
  text("10-19", 310, labelY, labelWidth, labelHeight);
  text("20-29", 380, labelY, labelWidth, labelHeight);
  text("30-39", 450, labelY, labelWidth, labelHeight);
  text("40-49", 520, labelY, labelWidth, labelHeight);
  text("50-59", 590, labelY, labelWidth, labelHeight);
  text("60+", 660, labelY, labelWidth, labelHeight);


  // label: divider
  for (int x = 240; x< width-margin; x+=70) {
    stroke(150);
    strokeWeight(1);
    line(x-5, margin+barHeight+10, x+labelWidth, margin+barHeight+10);

    noStroke();
    fill(230);
    rect(x+5, margin+5, barWidth, barHeight);

    fill(255);
    rect(x, margin, barWidth, barHeight);
  }


  // legend: colors
  for (int i=0; i<3; i++) {
    fill(250-i*30, 100-i*10, 130+i);
    rect(margin, 390+20*i, 20, 20);
    fill(250, 180-i*20, 0);
    rect(margin+30, 390+20*i, 20, 20);
  }


  // legend: labels
  fill(50);
  textAlign(LEFT);
  textSize(11);
  text("NO", margin, 375, 20, 20);
  text("YES", margin+30, 375, 20, 20);
  textSize(8);
  text("SINGLE", margin+60, margin+347, 80, 15);
  text("IN A RELATIONSHIP", margin+60, margin+367, 80, 15);
  text("MARRIED", margin+60, margin+387, 80, 15);




  // age group 0: 0-9
  for (int i=0; i<ageGroup0n.length; i++) {
    fill(250-ageGroup0n[i]*30, 100-ageGroup0n[i]*10, 130+ageGroup0n[i]); 
    rect(240, margin+i*(barHeight/(ageGroup0n.length+ageGroup0y.length)), barWidth, (barHeight/(ageGroup0n.length+ageGroup0y.length)));
  }
  for (int i=0; i<ageGroup0y.length; i++) {
    fill(250, 180-ageGroup0y[i]*20, 0);
    rect(240, (ageGroup0n.length*(barHeight/(ageGroup0n.length+ageGroup0y.length))+(margin+i*(barHeight/(ageGroup0n.length+ageGroup0y.length)))), barWidth, (barHeight/(ageGroup0n.length+ageGroup0y.length)));
  }


  // age group 1: 10-19
  for (int i=0; i<ageGroup1n.length; i++) {
    fill(250-ageGroup1n[i]*30, 100-ageGroup1n[i]*10, 130+ageGroup1n[i]); 
    rect(310, margin+i*(barHeight/(ageGroup1n.length+ageGroup1y.length)), barWidth, (barHeight/(ageGroup1n.length+ageGroup1y.length)));
  }
  for (int i=0; i<ageGroup1y.length; i++) {
    fill(250, 180-ageGroup1y[i]*20, 0); 
    rect(310, (ageGroup1n.length*(barHeight/(ageGroup1n.length+ageGroup1y.length))+(margin+i*(barHeight/(ageGroup1n.length+ageGroup1y.length)))), barWidth, (barHeight/(ageGroup1n.length+ageGroup1y.length)));
  }


  // age group 2: 20-29
  for (int i=0; i<ageGroup2n.length; i++) {
    fill(250-ageGroup2n[i]*30, 100-ageGroup2n[i]*10, 130+ageGroup2n[i]); 
    rect(380, margin+i*(barHeight/(ageGroup2n.length+ageGroup2y.length)), barWidth, (barHeight/(ageGroup2n.length+ageGroup2y.length)));
  }
  for (int i=0; i<ageGroup2y.length; i++) {
    fill(250, 180-ageGroup2y[i]*20, 0); 
    rect(380, (ageGroup2n.length*(barHeight/(ageGroup2n.length+ageGroup2y.length))+(margin+i*(barHeight/(ageGroup2n.length+ageGroup2y.length)))), barWidth, (barHeight/(ageGroup2n.length+ageGroup2y.length)));
  }


  // age group 3: 30-39
  for (int i=0; i<ageGroup3n.length; i++) {
    fill(250-ageGroup3n[i]*30, 100-ageGroup3n[i]*10, 130+ageGroup3n[i]); 
    rect(450, margin+i*(barHeight/(ageGroup3n.length+ageGroup3y.length)), barWidth, (barHeight/(ageGroup3n.length+ageGroup3y.length)));
  }
  for (int i=0; i<ageGroup3y.length; i++) {
    fill(250, 180-ageGroup3y[i]*20, 0); 
    rect(450, (ageGroup3n.length*(barHeight/(ageGroup3n.length+ageGroup3y.length))+(margin+i*(barHeight/(ageGroup3n.length+ageGroup3y.length)))), barWidth, (barHeight/(ageGroup3n.length+ageGroup3y.length)));
  }
  
  
  // age group 4: 40-49
  for (int i=0; i<ageGroup4n.length; i++) {
    fill(250-ageGroup4n[i]*30, 100-ageGroup4n[i]*10, 130+ageGroup4n[i]); 
    rect(520, margin+i*(barHeight/(ageGroup4n.length+ageGroup4y.length)), barWidth, (barHeight/(ageGroup4n.length+ageGroup4y.length)));
  }
  for (int i=0; i<ageGroup4y.length; i++) {
    fill(250, 180-ageGroup4y[i]*20, 0); 
    rect(520, (ageGroup4n.length*(barHeight/(ageGroup4n.length+ageGroup4y.length))+(margin+i*(barHeight/(ageGroup4n.length+ageGroup4y.length)))), barWidth, (barHeight/(ageGroup4n.length+ageGroup4y.length)));
  }
  
  
  // age group 5: 50-59
  for (int i=0; i<ageGroup5n.length; i++) {
    fill(250-ageGroup5n[i]*30, 100-ageGroup5n[i]*10, 130+ageGroup5n[i]); 
    rect(590, margin+i*(barHeight/(ageGroup5n.length+ageGroup5y.length)), barWidth, (barHeight/(ageGroup5n.length+ageGroup5y.length)));
  }
  for (int i=0; i<ageGroup5y.length; i++) {
    fill(250, 180-ageGroup5y[i]*20, 0); 
    rect(590, (ageGroup5n.length*(barHeight/(ageGroup5n.length+ageGroup5y.length))+(margin+i*(barHeight/(ageGroup5n.length+ageGroup5y.length)))), barWidth, (barHeight/(ageGroup5n.length+ageGroup5y.length)));
  }


  // age group 6: 60+
    for (int i=0; i<ageGroup6n.length; i++) {
    fill(250-ageGroup6n[i]*30, 100-ageGroup6n[i]*10, 130+ageGroup6n[i]); 
    rect(660, margin+i*(barHeight/(ageGroup6n.length+ageGroup6y.length)), barWidth, (barHeight/(ageGroup6n.length+ageGroup6y.length)));
  }
  for (int i=0; i<ageGroup6y.length; i++) {
    fill(250, 180-ageGroup6y[i]*20, 0); 
    rect(660, (ageGroup6n.length*(barHeight/(ageGroup6n.length+ageGroup6y.length))+(margin+i*(barHeight/(ageGroup6n.length+ageGroup6y.length)))), barWidth, (barHeight/(ageGroup6n.length+ageGroup6y.length)));
  }
}


