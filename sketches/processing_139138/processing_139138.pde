
/* Next: differentiate the 3 seeds to each do slightly 
   different things
   Constrain different seeds to start from same point
   if object is below/right, it has to move up and left toward that point
   
*/

Walker[] walkers;
Walker[] walkers1;
Walker[] walkers2;

int h = 150;
int s = 0;
int b = 65;
int walknum = 40;



void setup() {
  size(700,400);
  smooth();
  background(235);
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
    s+= .035;
  }

}

class Walker {
  //determine x by ran(1)
  int diameter = 6;
  int x;
  int y;
  int x1;
  int y1;
  int x2;
  int y2;
  int rx = random(15,75);
  int ranx = random(1);
  int ranx1 = random(1);
  int ranx2 = random(1);
  int yran = random(1);
  int yran1 = random(1);
  int yran2 = random(1);
  
  int ranpointx = random(0,width-10);
  int ranpointy = random(0,height-10);

  
  Walker() {   
   x = width/2;
   y = height/2;
   x1 = width/2-50;
   y1 = height/2-50;
   x2 = width/2+50;
   y2 = height/2+50;
  }
  
  void display() {
    
    if (rx <= 45) {
      stroke(130,s,s,s);
      fill(90,s,100, s);
      strokeWeight(1);
      ellipse(x,y, 2, 2);
      fill(50,s,200, s);
      ellipse(x1,y1,diameter,diameter);
      fill(225,50,s, s);
      ellipse(x2,y2,diameter,diameter);
      strokeWeight(.5);
      stroke(130,s,100, s);
    }
    
    else {
      colorMode(HSB);
      stroke(0, 0,255, s);
      fill(s);
      strokeWeight(1);
      ellipse(x,y,diameter,diameter);
      ellipse(x1,y1,2,2);
      ellipse(x2,y2,1,1);
  }
  }
  

void step() {
  if (x < ranpointx) {
    x++;
  }
  else if (x > ranpointx) {
    x--;
  }
  if (x == ranpointx) {
      x += 0;
  }
  
  if (y < ranpointy) {
    y++;
  }
  else if (y > ranpointy) {
    y--;
  }
  if (y == ranpointy) {
      y+= 0;
  }
  
  if (x1 < ranpointx) {
    x1++;
  }
  else if (x1 > ranpointx) {
    x1--;
  }
   if (x1 == ranpointx) {
      x1 += 0;
  }
  
  if (y1 < ranpointy) {
    y1++;
  }
  else if (y1 > ranpointy) {
    y1--;
  }
  if (y1 == ranpointy) {
      y1+= 0;
  }
  
  if (x2 < ranpointx) {
    x2++;
  }
  else if (x2 > ranpointx) {
    x2--;
  }
   if (x2 == ranpointx) {
      x2 += 0;
  }
  
  if (y2 < ranpointy) {
    y2++;
  }
  else if (y2 > ranpointy) {
    y2--;
  }
  if (y2 == ranpointy) {
      y2+= 0;
  }
}
///////////////////////////////////////////////////SET 1 center
/*  
    float r = random(1);
  if (r < 0.3) {
      x+=2;
    } else if (r < 0.6) {
      x-=2;
    } else if (r < 0.8) {
      y+=2;
    } else {
      y-=2;
    }
}

if (x > 700) {
   float rb = random(1);
  if (rb < 0.3) {
      x+=1;
    } else if (rb < 0.6) {
      x-=4;
    } else if (rb < 0.8) {
      y+=2;
    } else {
      y-=2;
    }
}

else if (x < 0) {
   float rc = random(1);
  if (rc < 0.3) {
      x+=4;
    } else if (rc < 0.6) {
      x-=1;
    } else if (rc < 0.8) {
      y+=2;
    } else {
      y-=2;
    }
}

else if (y < 0) {
   float rd = random(1);
  if (rd < 0.3) {
      x+=2;
    } else if (rd < 0.6) {
      x-=1;
    } else if (rd < 0.8) {
      y+=4;
    } else {
      y-=1;
    }
}

else if (y = 400) {
   float re = random(1);
  if (re < 0.3) {
      x+=2;
    } else if (re < 0.6) {
      x-=1;
    } else if (re < 0.8) {
      y+=1;
    } else {
      y-=4;
    }
}
///////////////////////////////////////////////////// 2 light blue
    
    if (x1!=0 && x1!=700 && y1!= 0 && y1!= 400) {
          float r1 = random(1);
  if (r1 < 0.3) {
      x1+=2;
    } else if (r1 < 0.5) {
      x1-=2;
    } else if (r1 < 0.8) {
      y1+=2;
    } else {
      y1-=2;
    }
}

else if (x1 = 700) {
   float r1b = random(1);
  if (r1b < 0.3) {
      x1+=1;
    } else if (r1b < 0.6) {
      x1-=4;
    } else if (r1b < 0.8) {
      y1+=2;
    } else {
      y1-=2;
    }
}

else if (x1 = 0) {
   float r1c = random(1);
  if (r1c < 0.3) {
      x1+=4;
    } else if (r1c < 0.6) {
      x1-=1;
    } else if (r1c < 0.8) {
      y1+=2;
    } else {
      y1-=2;
    }
}

else if (y1 = 0) {
   float r1d = random(1);
  if (r1d < 0.3) {
      x1+=2;
    } else if (r1d < 0.6) {
      x1-=1;
    } else if (r1d < 0.8) {
      y1+=4;
    } else {
      y1-=1;
    }
}

else if (y1 = 400) {
   float r1e = random(1);
  if (r1e < 0.3) {
      x1+=2;
    } else if (r1e < 0.6) {
      x1-=1;
    } else if (r1e < 0.8) {
      y1+=1;
    } else {
      y1-=4;
    }
}
///////////////////////////////////////////////////// 3 green/white
    
if (x2!=0 && x2!=700 && y2!= 0 && y2!= 400) {
       float r2 = random(1);
  if (r2 < 0.2) {
      x2+=2;
    } else if (r2 < 0.5) {
      x2-=2;
    } else if (r2 < 0.7) {
      y2+=2;
    } else {
      y2-=2;
    }
}

else if (x2 = 700) {
   float r2b = random(1);
  if (r2b < 0.3) {
      x2+=1;
    } else if (r2b < 0.6) {
      x2-=4;
    } else if (r2b < 0.8) {
      y2+=2;
    } else {
      y2-=2;
    }
}

else if (x2 = 0) {
   float r2c = random(1);
  if (r2c < 0.3) {
      x2+=4;
    } else if (r2c < 0.6) {
      x2-=1;
    } else if (r2c < 0.8) {
      y2+=2;
    } else {
      y2-=2;
    }
}

else if (y2 = 0) {
   float r2d = random(1);
  if (r2d < 0.3) {
      x2+=2;
    } else if (r2d < 0.6) {
      x2-=1;
    } else if (r2d < 0.8) {
      y2+=4;
    } else {
      y2-=1;
    }
}

else if (y2 = 400) {
   float r2e = random(1);
  if (r2e < 0.3) {
      x2+=2;
    } else if (r2e < 0.6) {
      x2-=1;
    } else if (r2e < 0.8) {
      y2+=1;
    } else {
      y2-=4;
    }
}

}
*/
}
