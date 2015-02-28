
/* Next: differentiate the 3 seeds to each do slightly 
   different things
   Constrain different seeds to start from same point
*/

Walker[] walkers;
Walker[] walkers1;
Walker[] walkers2;

int h = 150;
int s = 0;
int b = 65;
int walknum = 10;

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
  strokeWeight(10);
  stroke(0,20);
//  line(350,0,350,400);
}

void draw() {
  for (int i = 0; i <= walknum; i++) {
    walkers[i].step();
    walkers[i].display();
    walkers1[i].step();
    walkers1[i].display();
    walkers2[i].step();
    walkers2[i].display();
    s+= .01;
  }

}

class Walker {
  //determine x by ran(1)
  int diameter = 4;
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

  
  Walker() {
    if (ranx < .5) {
    x = random(width/2);
    }
    if (ranx >= .5) {
      x = random(width/2, width);
    }
    if (yran <= .5) {
       y = 0;
      }
      else { 
      y = height;
     }
   
   if (ranx1 < .5) {
    x1 = random(width/2);
    }
    if (ranx1 >= .5) {
      x1 = random(width/2, width);
    }
     if (yran1 <= .5) {
       y1 = 0;
      }
     else { 
      y1 = height;
     }
     
   if (ranx2 < .5) {
    x2 = random(width/2);
    }
    if (ranx2 >= .5) {
      x2 = random(width/2, width);
    }
   x2 = random(width);
   
     if (yran2 <= .5) {
       y2 = 0;
      }
     else { 
      y2 = height;
     }
   
  }
  
  void display() {
    
    if (rx <= 45) {
      stroke(130,s,100);
      fill(20,s,100, 200);
      strokeWeight(1);
      ellipse(x,y, diameter, diameter);
      fill(50,100,200, 200);
      ellipse(x1,y1,diameter,diameter);
      fill(180,100,200, 200);
      ellipse(x2,y2,diameter,diameter);
      strokeWeight(.5);
      stroke(130,100,100);
     // line(0,0,x,y);
      
      stroke(20,100,100);
     // line(0,0,x1,y1);

      stroke(180,100,100);
      //line(0,0,x2,y2);
    }
    else {
      colorMode(HSB);
      stroke(h, s, b, 60);
      fill(s);
      strokeWeight(1);
      ellipse(x,y,diameter,diameter);
      ellipse(x1,y1,diameter,diameter);
      ellipse(x2,y2,diameter,diameter);
  }
  }
  

void step() {
  
///////////////////////////////////////////////////SET 1
if (ranx < .5) {
////////////////////////////////left, top
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
////////////////////////////////left, bottom
  else if (yran >= .5) {
    float r1 = random(1);
    if (r1 < 0.3) {
        x+=2;
      } else if (r1 < 0.5) {
        x-=1;
      } else if (r1 < 0.6) {
        y+=1;
      } else {
        y-=2;
      }
  }
}

else if (ranx >= .5) {
////////////////////////////////right, top
  if (yran <= .5) {
    float r = random(1);
  if (r < 0.3) {
      x+=1;
    } else if (r < 0.6) {
      x-=2;
    } else if (r < 0.9) {
      y+=2;
    } else {
      y-=1;
    }
   }
////////////////////////////////right, bottom
  else if (yran >= .5) {
    float r1 = random(1);
    if (r1 < 0.3) {
        x+=1;
      } else if (r1 < 0.5) {
        x-=2;
      } else if (r1 < 0.6) {
        y+=1;
      } else {
        y-=2;
      }
  }
}

///////////////////////////////////////////////////SET 2
if (ranx1 < .5) {  
  if (yran1 < .5) {
    float r11 = random(1);
  if (r11 < 0.4) {
      x1+=2;
    } else if (r11 < 0.6) {
      x1-=1;
    } else if (r11 < 0.9) {
      y1+=2;
    } else {
      y1-=1;
    }
  }

  else if (yran1 >= .5) {
    float r12 = random(1);
    if (r12 < 0.4) {
        x1+=2;
      } else if (r12 < 0.5) {
        x1-=1;
      } else if (r12 < 0.6) {
        y1+=1;
      } else {
        y1-=2;
      }
  }
}

else if (ranx1 >= .5) {  
  if (yran1 < .5) {
    float r11 = random(1);
  if (r11 < 0.3) {
      x1+=1;
    } else if (r11 < 0.6) {
      x1-=2;
    } else if (r11 < 0.9) {
      y1+=2;
    } else {
      y1-=1;
    }
  }

  else if (yran1 >= .5) {
    float r12 = random(1);
    if (r12 < 0.3) {
        x1+=1;
      } else if (r12 < 0.5) {
        x1-=2;
      } else if (r12 < 0.6) {
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
    float r21 = random(1);
  if (r21 < 0.3) {
      x2+=1;
    } else if (r21 < 0.6) {
      x2-=2;
    } else if (r21 < 0.9) {
      y2+=2;
    } else {
      y2-=1;
    }
  }

  else if (yran2 >= .5) {
    float r22 = random(1);
    if (r22 < 0.3) {
        x2+=1;
      } else if (r22 < 0.5) {
        x2-=2;
      } else if (r22 < 0.6) {
        y2+=1;
      } else {
        y2-=2;
      }
  }
}

}

}




