
//Chun Yi Wu 
//concept is Flash & THOR 
PImage img ;


int _num = 5;      
Circle[] _circleArr = {
};  
float ustart, unoise, zstart, znoise; 
void setup() { 
  
  size(800, 400); 
  background(255); 
  strokeWeight(1); 
  fill(150, 50); 
  drawCircles();
  img = loadImage("city222.png");
} 

void draw() {    
  background(0);
  
  image(img,0,250,width,height/2.3);
  
  ////////// Flash ///////////
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
  ////////// cloud ///////////////
  ustart += 0.01;
  zstart += 0.01;
  unoise = ustart; 
  znoise = zstart; 
  for (int z =160; z <= (height/2)+30; z+=5) { 
    znoise += 0.1;                                     
    unoise = ustart; 
    for (int u = 0; u <= width; u+=5) { 
      unoise += 0.1;     
      drawPoint(u, z, noise(unoise, znoise));
    }
  }
  ////text////
  fill(230,random(30));
  textSize(20);
  text("TROR", width/2-30, height/2);
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
////////// cloud ///////////////
void drawPoint(float u, float z, float noiseFactor) {    
  pushMatrix();
  translate(u, z);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 30;
  float grey = 50 + (noiseFactor * 80);
  float alph = 30 + (noiseFactor * 40);
  noStroke();
  fill(grey, alph/3);
  ellipse(0, 0, edgeSize*2, edgeSize*2);
  popMatrix();
}


class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;


  Circle() {
    x = random(width);
    y = random(250);
    radius = random(10) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(150, alph);
    beginShape();
    vertex(x-(radius/4), y-radius);
    vertex(x-(radius/2), y-(radius*0.8));
    vertex(x-(radius/2), y+(radius*0.8));
    vertex(x-(radius/4), y+radius);
    vertex(x+(radius/4), y+radius);
    vertex(x+(radius/2), y+(radius*0.8));
    vertex(x+(radius/2), y-(radius*0.8));
    vertex(x+(radius/4), y-radius);
    endShape(CLOSE); 
    stroke(100, alph);
    strokeWeight((radius*0.3));
    line(x+(radius/2), y, x+(radius/2)+30, y);
    //stroke(linecol, 150);
    //fill(0);
    //ellipse(x, y, 10, 10);
  }

  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius) ) { 
      x=0-radius;
    }
    if (x < (0-radius) ) { 
      x=width+radius;
    }
    if (y > (height-radius-(height/2))) {
      y = height-radius-(height/2) ;
      ymove = -ymove ;
      stroke(255);
      strokeWeight(random(5));
      float t = random(20);
      line(x, y, x-t, y+t+30);
      line(x-t, y+t+30, x+t, y+t+10);
      line(x+t, y+t+10, x-t+10, y+t+60);
      fill(150, random(10, 50));
      noStroke();
      rect(0, 0, width, height);
    }
    if (y < (0-radius)) {
      y =  0-radius;
      ymove = -ymove ;
    }

    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        if ((dis-radius-otherCirc.radius) < 0) {
          touching = true;
          break;
        }
      }
    }
    if (touching) {
      if (alph > 0) { 
        alph--;
      }
    } 
    else {
      if (alph<255) { 
        alph += 4;
      }
    }

    drawMe();
  }
}



