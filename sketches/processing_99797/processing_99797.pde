
// Confetti explosion, by Jan Wolski

Confetti[] confettis = new Confetti[1000];
int state = 0;

void setup() {
  size(800, 600, P3D);
  frameRate(30);
  colorMode(HSB, 100);
  noStroke();

  for(int i = 0; i < confettis.length; i++) {
    confettis[i] = new Confetti();
  }
  
}

void draw() {
  colorMode(HSB, 100);
  background(0);
  ambientLight(100,0,100);
   
  translate(width/2, height/2, 100);
  rotateZ(1.4);
  rotateX(.7f);

  for(int i = 0; i < confettis.length; i++) {
    confettis[i].run();
  }
  
  if(state == 2){
    stroke(0,0,100);
    strokeWeight(4);
    line(0,-1500,0,0,1500,0);
    noStroke();
  }
}

void mousePressed(){
  state++;
  if(state > 2) state = 0;
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      state += -1;
      if(state < 0) state = 0;
    } else if (keyCode == RIGHT) {
      state += 1;
    } 
  }
  if(state > 2) state = 0;
}

class Confetti {
  private float rotY;
  private float rotZ;
  private float radius;
  private float tempRadius;
  private color col;
  private float finalZ;
  private float tempZ = 0;
  
  Confetti() {
    rotY = random(TWO_PI);
    rotZ = random(-PI, PI);
    radius = pow(random(8000000), .3333);
    tempRadius = 0;
    col = color(random(100),100,100);
    finalZ = random(-1000, 1000);
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    if(state == 0) {
      tempRadius = 0;
      tempZ = 0;
    }
    if(state > 0) {
      if(tempRadius< radius-0.1) {
        tempRadius += ((radius-tempRadius)/10);
      }else{
        tempRadius = radius;
      }
      
    }
    if(state > 1) {
      if(tempZ < finalZ-0.1 || tempZ > finalZ+0.1) {
        tempZ += ((finalZ-tempZ)/50);
      }else{
        tempZ = finalZ;
      }
    }
  }
  
  void display() {
    pushMatrix();
    
    if(state == 2) {
      translate(0,tempZ,0);
    }
    rotateY(rotY);
    rotateZ(rotZ);
    translate(tempRadius,0,0);
    
    rotateY(HALF_PI);
    rotateX(tempRadius/10f);
    rotateY(tempRadius/10f);
    rotateZ(tempRadius/10f);
    scale(0.1+tempRadius/radius);
    
    fill(col);
    //box(10);
    rect(-5,-5,10,10);
    popMatrix();
  }
}

