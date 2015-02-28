
PImage grass, frog;

Car car1, car2, car3, car4;
int frogx = 375;
int frogy = 550; 

void setup() {
  size(800, 600);
  noStroke();
  grass = loadImage("grass.png");
  frog = loadImage("frog.gif");
  car1 = new Car(0,235);
  car2 = new Car(0,265);
  car3 = new Car(0,310);
  car4 = new Car(0,340);
}

void draw() {
  side(0);
  river(110);
  street(220);
  river(380);
  side(490);
  car1.driveH();
  car1.carShape();
  car2.driveL();
  car2.carShape();
  car3.driveH();
  car3.carShape();
  car4.driveL();
  car4.carShape();
  
  image(frog,frogx,frogy);
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP){
      if(frogy != 0)
      frogy = frogy-50;
    } else if ((keyCode == DOWN)) {
      if(frogy != 550)
      frogy = frogy+50;
    } else if (keyCode == RIGHT ) {
      frogx = frogx+50;
    } else if (keyCode == LEFT ) {
      frogx = frogx-50;
    } 
  }
}
  
  
void side(int sy) {
  fill(0, 127, 0);
  rect(0, sy, 800, 5);
  image(grass, 0, sy+5);
  rect(0, sy+105, 800, 5);
}

void river(int ry) {
  fill(30, 144, 255);
  rect(0, ry, 800, 110);
}

void street(int sty) {
  boolean swc = true;
  for(int x = 0; x < width; x = x+100) {
    if(swc){
    fill(0);
    swc = false;
    }
    else{
    fill(255);
    swc = true;
    }
    rect(x, sty, 100, 10);
  }
  
  fill(127);
  rect(0, sty+10, 800, 140);
  
  for(int x = 0; x < width; x = x+100) {
    if(swc){
    fill(0);
    swc = false;
    }
    else{
    fill(255);
    swc = true;
    }
    rect(x, sty+150, 100, 10);
  }

  for(int x = 50; x < width; x = x+100) {
    if(swc){
    fill(255);
    swc = false;
    }
    else{
      noStroke();
      fill(127);
      swc = true;
    }
    rect(x, 295, 100, 10);
  }
}

class Car {
  float cx;
  float cy;
  float cs;
  
  Car(float tempX, float tempY){
    
    cx = tempX;
    cy = tempY;
  }
  color c = color(random(256),random(256),random(256));
  int csL = int(random(3,6));
  int csH = int(random(6,11));
  
  void carShape(){
    stroke(0);
    fill(c);
    rect(cx, cy,20,10);
    rect(cx-20, cy+10, 60, 10);
    fill(0);
    ellipse(cx,cy+20,10,10);
    ellipse(cx+20,cy+20,10,10);
  }
    
  void driveH(){
    cx = cx + csH;
    if(cx > width+120){
      cx = 800;
      csH = -int(random(10,16));
      c = color(random(256),random(256),random(256));
    }
    else if(cx < -120){
      cx = 0;
      csH = int(random(10,16));
      c = color(random(256),random(256),random(256));
    }
  }
  
  void driveL(){
    cx = cx + csH;
    if(cx > width+120){
      cx = 800;
      csH = -int(random(4,10));
      c = color(random(256),random(256),random(256));
    }
    else if(cx < -120){
      cx = 0;
      csH = int(random(4,10));
      c = color(random(256),random(256),random(256));
    }
  }
}



