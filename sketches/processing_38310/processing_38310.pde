
float[] x = {
  860, 860, 880, 900, 940, 980, 1030, 1055, 1065, 1090, 1117, 1140, 1148, 1140, 1154, 1158, 1135, 1110, 1085, 1055, 1020, 995, 997, 975, 960, 910, 870, 860, 860
};
float[] y = {
  140, 140, 120, 100, 80, 62, 80, 90, 110, 125, 110, 85, 110, 130, 147, 160, 153, 145, 150, 190, 183, 185, 215, 205, 185, 180, 160, 140, 140
};
float wiggle = 0;

void setup() {
  size(700, 290);
}

void draw() {
  background(70, 130, 180);
  
  smooth();
  fill(0);
  noStroke();
  
  beginShape();
  for (int i = 0; i < x.length; i++) {
    curveVertex(x[i], y[i]);
  }
  endShape();
  
  wiggle = sin(frameCount*0.1)*.5;
  
  if (x[15] > 0) { 
    for (int i = 0; i < x.length; i++) {
      x[i] = x[i] - 3.5;
    }
    
    for (int i = 10; i <= 18; i++) {
      x[i] = x[i] - wiggle;
    }
    
    for (int i = 0; i <= 3; i++) {
      x[i] = x[i] - wiggle;
    }
    
    for (int i = 26; i < x.length; i++) {
      x[i] = x[i] - wiggle;
    }
  }
  
  else {
    x[0] = 860;
    x[1]= 860;
    x[2] = 880;
    x[3] = 900;
    x[4] = 940;
    x[5] = 980;
    x[6] = 1030;
    x[7] = 1055;
    x[8] = 1065;
    x[9] = 1090;
    x[10] = 1117;
    x[11] = 1140;
    x[12] = 1148;
    x[13] = 1140;
    x[14] = 1154;
    x[15] = 1158;
    x[16] = 1135;
    x[17] = 1110;
    x[18] = 1085;
    x[19] = 1055;
    x[20] = 1020;
    x[21] = 995;
    x[22] = 997;
    x[23] = 975;
    x[24] = 960;
    x[25] = 910;
    x[26] = 870;
    x[27] = 860;
    x[28] = 860;
    
    for (int i = 0; i < x.length; i++) {
      x[i] = x[i] - 3.5;
    }
    
    for (int i = 10; i <= 18; i++) {
      x[i] = x[i] - wiggle;
    }
    
    for (int i = 0; i <= 3; i++) {
      x[i] = x[i] - wiggle;
    }
    
    for (int i = 26; i < x.length; i++) {
      x[i] = x[i] - wiggle;
    }
    
  }
  
}                               
