
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139574*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Walker[] walkers;
Walker[] walkers1;
Walker[] walkers2;

int h = 150;
int s = 0;
int s1 = 0;
int b = 65;
int walknum = 15;


void setup() {
  size(700,400);
  colorMode(HSB);
  smooth();
  background(140,25,195);
  walkers = new Walker[walknum];
  walkers1 = new Walker[walknum];
  walkers2 = new Walker[walknum];
  
  for (int y = 0; y <=walknum; y++) {
    walkers[y] = new Walker();
  }
  for (int x = 0; x <=walknum; x++) {
    walkers1[x] = new Walker();
  }
  for (int z = 0; z <=walknum; z++) {
    walkers2[z] = new Walker();
  }
}

void draw() {
  for (int i = 0; i <= walknum; i++) {
    walkers[i].step();
    walkers[i].display();
    walkers1[i].step();
    walkers1[i].display();
    walkers2[i].step();
    walkers2[i].display();
    s+= .002;
    s1 += .008;
  }
}

void mousePressed() {
  noLoop();
  setup();
  redraw();
  loop();
}


class Walker {
  int diameter = 2;
  int x, y, x1, x2, y1, y2;
  int rx = random(15,75);
  int ry = random(1,15);
  int ranx = random(width);
  int ranx1 = random(height);
  int ranx2 = random(width);
  int yran = random(height);
  int yran1 = random(width);
  int yran2 = random(height);
  
  Walker() {
  x = ranx;
  y = yran;
  x1 = ranx1;
  y1 = yran1;
  x2 = ranx2;
  y2 = yran2;
  }
  
  void display() {
    
    if (rx <= 60) {    
      strokeWeight(1);
      stroke(130,s,80,s);
      fill(90,s,200,s);
      ellipse(x,y,diameter,diameter);
      stroke(80,s,120,s);
      fill(150,100,200,s);
      ellipse(x1,y1,diameter,diameter);
      stroke(180,s1,240,s1);
      fill(180,100,200,s1);
      ellipse(x2,y2,diameter,diameter);
    }
    
    else {
      stroke(255,s);
      fill(255,5);
      strokeWeight(1);
      ellipse(x,y,diameter*12,diameter*12);
      ellipse(x1,y1,diameter*12,diameter*12);
      ellipse(x2,y2,diameter*12,diameter*12);
  }
 }
  

void step() {
  
///////////////////////////////////////////////////SET 1
if (ranx < .5) {
  if (yran <= .5) {
    float r = random(1);
  if (r < 0.4) {
      x+=2;
    } else if (r < 0.6) {
      x-=1;
    } else if (r < 0.9) {
      y+=2;
    } else {
      y-=1;
    }
}
  else if (yran >= .5) {
    float ra = random(1);
    if (ra < 0.3) {
        x+=2;
      } else if (ra < 0.5) {
        x-=1;
      } else if (ra < 0.6) {
        y+=1;
      } else {
        y-=2;
      }
  }
}

else if (ranx >= .5) {
  if (yran <= .5) {
    float rb = random(1);
  if (rb < 0.3) {
      x+=1;
    } else if (rb < 0.6) {
      x-=2;
    } else if (rb < 0.9) {
      y+=2;
    } else {
      y-=1;
    }
   }
  else if (yran >= .5) {
    float rc = random(1);
    if (rc < 0.3) {
        x+=1;
      } else if (rc < 0.5) {
        x-=2;
      } else if (rc < 0.6) {
        y+=1;
      } else {
        y-=2;
      }
  }
}

///////////////////////////////////////////////////SET 2
if (ranx1 < .5) {
  if (yran1 <= .5) {
    float r1a = random(1);
  if (r1a < 0.4) {
      x1+=2;
    } else if (r1a < 0.6) {
      x1-=1;
    } else if (r1a < 0.9) {
      y1+=2;
    } else {
      y1-=1;
    }
}
  else if (yran1 >= .5) {
    float r1b = random(1);
    if (r1b < 0.3) {
        x1+=2;
      } else if (r1b < 0.5) {
        x1-=1;
      } else if (r1b < 0.6) {
        y1+=1;
      } else {
        y1-=2;
      }
  }
}

else if (ranx1 >= .5) {
  if (yran1 <= .5) {
    float r1c = random(1);
  if (r1c < 0.3) {
      x1+=1;
    } else if (r1c < 0.6) {
      x1-=2;
    } else if (r1c < 0.9) {
      y1+=2;
    } else {
      y1-=1;
    }
   }
  else if (yran1 >= .5) {
    float r1d = random(1);
    if (r1d < 0.3) {
        x1+=1;
      } else if (r1d < 0.5) {
        x1-=2;
      } else if (r1d < 0.6) {
        y1+=1;
      } else {
        y1-=2;
      }
  }
}

///////////////////////////////////////////////////SET 3
if (ranx2 < .5) {
  if (yran2 < .5) {
    float r21 = random(1);
  if (r21 < 0.4) {
      x2+=2;
    } else if (r21 < 0.6) {
      x2-=1;
    } else if (r21 < 0.9) {
      y2+=2;
    } else {
      y2-=1;
    }
  }

  else if (yran2 >= .5) {
    float r22 = random(1);
    if (r22 < 0.4) {
        x2+=2;
      } else if (r22 < 0.5) {
        x2-=1;
      } else if (r22 < 0.6) {
        y2+=1;
      } else {
        y2-=2;
      }
  }
}

else if (ranx2 >= .5) {
  if (yran2 < .5) {
    float r23 = random(1);
  if (r23 < 0.3) {
      x2+=1;
    } else if (r23 < 0.6) {
      x2-=2;
    } else if (r23 < 0.9) {
      y2+=2;
    } else {
      y2-=1;
    }
  }

  else if (yran2 >= .5) {
    float r24 = random(1);
    if (r24 < 0.3) {
        x2+=1;
      } else if (r24 < 0.5) {
        x2-=2;
      } else if (r24 < 0.6) {
        y2+=1;
      } else {
        y2-=2;
      }
  }
}

}

}


