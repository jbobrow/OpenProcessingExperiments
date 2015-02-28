
// Demo Program for the lecture on "Emergence"
// a program to draw moving circles using objects
//changing circle to triangle and bounce back

// by KokFu Lok


int _num = 10;      
Circle[] _circleArr = {
};  

void setup() { 
  size(800, 800); 
  background(255); 
  strokeWeight(1); 
  fill(150, 50); 
  drawCircles();
} 

void draw() {    
  background(0);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
} 

void mouseReleased() { 
  drawCircles();
} 

void drawCircles() { 
  for (int i=0; i<_num; i++) { 
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


class Circle {
  float x, y, x1, y1, x2, y2;
  float radius;
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;
  float rot;

  Circle() {
    x = random(width);
    y = random(height);
    x1 = random(width)-random(10);
    y1 = random(height)-random(5, 10);
    x2 = random(width)+random(10);
    y2 = random(height)-random(5, 10);
    radius = random(5, 50);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(30, 150);

    xmove = random(-2, 2);// - 5;
    ymove = random(-2, 5); //- 5;
    rot=radians(x*6);
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    //  pushMatrix();
    //  translate(-x,-y);
    //  rotate(rot);
    triangle(x, y, x1, y1, x2, y2);
    //ellipse(x, y, radius*2, radius*2);
    //  popMatrix();
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, random(radius), radius);
    ellipse(x1, y1, radius, random(radius));
    ellipse(x2, y2, random(radius), random(radius));
  }

  void updateMe() {
    x += xmove;
    y += ymove;
    x1 += xmove*0.1;
    y1 += ymove*0.2;
    x2 += xmove*0.3;
    y2 += ymove*0.4;
   
    if (x > (width+radius)) { 
      x=width+radius;
      xmove= -xmove;
    }
    if (x < (0-radius)) { 
      x=0-radius;
      xmove= -xmove;
    }
    if (y > (height+radius)) { 
      y=height+radius;
      ymove= -ymove;
    }
    if (y < (0-radius)) { 
      y=0-radius;
      ymove= -ymove;
    }
    /*
     if (x1 > (width+radius)) { 
      x1=width+radius;
      xmove= -xmove;
    }
    if (x1 < (0-radius)) { 
      x1=0-radius;
      xmove= -xmove;
    }
    if (y1 > (height+radius)) { 
      y1=height+radius;
      ymove= -ymove;
    }
    if (y1 < (0-radius)) { 
      y1=0-radius;
      ymove= -ymove;
    }
    */
     if (x2 > (width+radius)) { 
      x2=width+radius;
      xmove= -xmove;
    }
    if (x2 < (0-radius)) { 
      x2=0-radius;
      xmove= -xmove;
    }
    if (y2 > (height+radius)) { 
      y2=height+radius;
      ymove= -ymove;
    }
    if (y2 < (0-radius)) { 
      y2=0-radius;
      ymove= -ymove;
    }
    drawMe();
  }
}



