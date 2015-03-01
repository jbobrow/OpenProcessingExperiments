
float[][] eSize=new float[4][6];
float[][] speed= {
  {
    0.6, 0.9, 0.2, 0.5, 1.3, 0.6
  }
  , 
  {
    0.2, 1.0, 0.3, 0.6, 1.4, 0.7
  }
  , 
  {
    0.3, 1.1, 0.4, 0.7, 1.5, 0.8
  }
  , 
  {
    0.4, 0.3, 1.2, 0.9, 0.5, 0.8,
  }
};
int[][] cColor= {
  {
    50, 60, 70, 80, 90, 100
  }
  , {
    60, 70, 80, 90, 100, 50
  }
  , {
    70, 80, 90, 100, 50, 60,
  }
  , {
    80, 90, 100, 50, 60, 70
  }
};

int[][] bColor= {
  {
    20, 60, 100, 140, 180, 220
  }
  , {
    40, 80, 120, 160, 200, 240
  }
  , {
    30, 70, 110, 150, 190, 230
  }
  , {
    50, 90, 130, 170, 210, 250
  }
};
float minSize=100.0;
float maxSize=500.0;
int lastAngle=-90;
int[] angle= {
  15, 15, 15, 15, 15, 15, 
  15, 15, 15, 15, 15, 15, 
  15, 15, 15, 15, 15, 15, 
  15, 15, 15, 15, 15, 15
};

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  fill(0);
  for (int y=0; y<4; y++) {
    for (int x=0; x<6; x++) {
      eSize[y][x]=minSize;
    }
  }
}

void draw() {
  background(255);
  for (int i=0; i<angle.length; i++) {
    for (int y=0; y<4; y++) {
      for (int x=0; x<6; x++) {
        eSize[y][x]+=speed[y][x];
        if (eSize[y][x]>maxSize||eSize[y][x]<minSize)speed[y][x]=-speed[y][x];
        fill(cColor[y][x], bColor[y][x], 240);
        if (eSize[y][x]>maxSize||eSize[y][x]<minSize)cColor[y][x]=-cColor[y][x];
        arc(width/2, height/2, eSize[y][x], eSize[y][x], radians(lastAngle), radians(lastAngle+angle[i]));
        lastAngle+=angle[i];
      }
    }
  }
}


