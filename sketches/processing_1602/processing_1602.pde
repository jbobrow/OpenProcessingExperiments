
Individual[] community;
int communitySize = 10000;
Random rnd = new Random();

void setup() {
  size(600,600,P2D);
  frameRate(30);
  background(0);
  //smooth();
  
  community = new Individual[communitySize];
  for (int i=0; i < communitySize; i++) {
    community[i] = new Individual();
  }
}

void draw() {
  //background(88,58,34);
  noStroke();
  fill(0,30);
  rect(0,0,width,height);
  stroke(255);
  strokeWeight(1);
  noFill();
  line(width/10,height/2, width/6, height/2);
  line(width*9/10, height/2, width*5/6, height/2);
  line(width/2, height/10, width/2, height/6);
  line(width/2, height*9/10, width/2, height*5/6);
  
  for (int i=0; i < communitySize; i++) {
    community[i].move();
    community[i].draw();
  }    

}

class Individual {
  float angle;
  float shift;
  float shiftSpeed;
  float angularSpeed; // angular speed
  color c;
  float widthLimit;
  
  Individual() {
    angle = random(0, 360);
    shift = 0;
    shiftSpeed = random(-0.01, 0.01);
    widthLimit = (float)rnd.nextGaussian() * 50;
                //int(random(15, 50));
    angularSpeed = random(PI/720, PI/180);
    float tmp = random(0,1);
    if (tmp < 0.4) {
      c = #F7DDA2;
    } else if (tmp < 0.8) {
      c = #F2974C;
    } else {
      c = color(255,255,255);
    }
  }
    
  void move() {
    angle += angularSpeed;
    if (angle > 360) {
      angle -= 360;
    }

    shift += shiftSpeed;    
    shiftSpeed += random( -0.05, 0.05 );
    if (shift > widthLimit) {
      shiftSpeed = Math.abs(shiftSpeed) * -0.5;
    }
    else if (shift < -widthLimit) {
      shiftSpeed = Math.abs(shiftSpeed) * 0.5;
    }
    
  }
  
  void draw() {
    noStroke();
    fill(c, 127);
    //fill(0, 50);
    float baseRadius = width / 3;
    float x = cos(angle) * (baseRadius + shift) + (width / 2);
    float y = sin(angle) * (baseRadius + shift) + (height / 2);
    ellipse(x, y, 4, 4);
  }
    
}

