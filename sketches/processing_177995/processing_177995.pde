
int x=0;
int y=1;
int s=-1;
int p=6;
int line=0;
int scale=10;
int step=7;
int row1[]= {
  0, 0, 1, 0, 0, 0, 0
};
int row2[]= {
  0, 1, 1, 1, 0, 0, 0
};
int row3[]= {
  1, 1, 1, 1, 1, 0, 0
};
int row4[]= {
  0, 1, 1, 1, 0, 0, 0
};
int row5[]= {
  0, 0, 1, 0, 0, 0, 0
};
int row6[]= {
  0, 0, 0, 0, 0, 0, 0
};
int rand1[]= {
  50, 10, 255
};
int rand2[]= {
  0, 200, 150
};
int rand3[]= {
  100, 200, 120
};
int alt=1;
int col=0;

void setup() {
  size(700, 600);
  noStroke();
  colorMode(HSB);
  reset();
  fill(rand1[0], rand1[1], rand1[2]);
}

void reset() {
  println("RESET!");
  line=int(random(0, 4));
  if (line%2==0) {
    fill(rand1[0], rand1[1], rand1[2]);
  } else {
    fill(rand3[0], rand3[1], rand3[2]);
  };
  x=0;
  y=1;
  s=-1;
  background(rand2[0], rand2[1], rand2[2]);
  p=int(random(1, 7));
}

void draw() {
  scale(scale);
  if (x==width/scale) {
    line++;
    x=0;
    y=y+step;
    if (line%2==0) {
      fill(rand1[0], rand1[1], rand1[2]);
    } else {
      fill(rand3[0], rand3[1], rand3[2]);
    }
    line=int(random(0, 3));
    s=-1;
  }
  switch(line) {
  case 0:
    zigzag(p);
    break;
  case 1:
    zigzag(p/2);
    break;
  case 2:
    //star 
    row1=new int[] {
      0, 0, 0, 1, 0, 0, 0
    };
    row2=new int[] {
      0, 0, 1, 1, 1, 0, 0
    };
    row3=new int[] {
      0, 1, 1, 1, 1, 1, 0
    };
    row4=new int[] {
      0, 0, 1, 1, 1, 0, 0
    };
    row5=new int[] {
      0, 0, 0, 1, 0, 0, 0
    };
    row6=new int[] {
      0, 0, 0, 0, 0, 0, 0
    };
    raster();
    break;
  case 3:
    //reindeer
    row1=new int[] {
      0, 1, 1, 1, 0, 0, 0
    };
    row2=new int[] {
      0, 0, 1, 0, 0, 0, 0
    };
    row3=new int[] {
      0, 1, 1, 1, 1, 1, 0
    };
    row4=new int[] {
      0, 1, 0, 1, 1, 1, 0
    };
    row5=new int[] {
      0, 0, 0, 1, 0, 1, 0
    };
    row6=new int[] {
      0, 0, 0, 1, 0, 1, 0
    };
    raster();
    break;
  }
}

void raster() {
  if (x%7==0) {
    alt=-1*alt;
  }
  if (alt>0) {
    col=x%7;
  } else {
    col=6-x%7;
  }
  if (row1[col]==1) {
    rect(x, y, 1, 1);
  }
  if (row2[col]==1) {
    rect(x, y+1, 1, 1);
  }
  if (row3[col]==1) {
    rect(x, y+2, 1, 1);
  }  
  if (row4[col]==1) {
    rect(x, y+3, 1, 1);
  }
  if (row5[col]==1) {
    rect(x, y+4, 1, 1);
  }
  if (row6[col]==1) {
    rect(x, y+5, 1, 1);
  }
  x++;
}

void zigzag(int p) {
  rect(x, y, 1, 1);
  if (x%p==0) {
    s=-s;
  }
  y=y+s;
  x++;
}

void mousePressed() {
  reset();
}

