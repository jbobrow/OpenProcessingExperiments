
///////Lauren Ruoff copyright 2014
////////////lruoff Project 2

////////////////Declarations\\\\\\\\\\\\\\\\\\\\\

int[] rustleAngles = { 
  45, -45, 40, -40, 35, -35, 30, -30, 15, -15
};
boolean rustling = false;
//int rustleIndex = 0;
final int MAX = 120;
color backgroundColor;
color[] leafColors = {
  color(135, 152, 140), color(201, 222, 181), color(154, 178, 63)
};

int epicenterDistance;
int rustlingListTimer = -1;

ArrayList<Leaf> shockWave1 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave2 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave3 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave4 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave5 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave6 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave7 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave8 = new ArrayList<Leaf>();

Leaf [ ] leafArray;
Leaf testLeaf;

//////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void setup() {

  size(400, 600);
  //backgroundColor = color(129, 126, 131);
  //backgroundColor = color(84, 82, 85);
  //backgroundColor = color(139, 133, 111);
  backgroundColor = color(93, 89, 80);
  background(backgroundColor);
  smooth();
  //noCursor();
  frameRate(10);

  leafArray = new Leaf [MAX];
  initializeLeafArray();
  testLeaf = new Leaf(width/2, height/2, 0, color(100, 0, 0), 0);
  
  shockWave1 = new ArrayList<Leaf>();
  shockWave2 = new ArrayList<Leaf>();
  shockWave3 = new ArrayList<Leaf>();
  shockWave4 = new ArrayList<Leaf>();
  shockWave5 = new ArrayList<Leaf>();
  shockWave6 = new ArrayList<Leaf>();
  shockWave7 = new ArrayList<Leaf>();
  shockWave8 = new ArrayList<Leaf>();
}

/////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void draw() { 
  background(backgroundColor);

  if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 800 && millis() - rustlingListTimer <= 1400) {
    for (int i = 0; i < shockWave1.size(); i++) {
      shockWave1.get(i).rustling = true;
    }
    shockWave1 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 1400 && millis() - rustlingListTimer <= 2000) {
    for (int i = 0; i < shockWave2.size(); i++) {
      shockWave2.get(i).rustling = true;
    }
      shockWave2 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 2000 && millis() - rustlingListTimer <= 2600) {
    for (int i = 0; i < shockWave3.size(); i++) {
      shockWave3.get(i).rustling = true;
    }
      shockWave3 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 2600 && millis() - rustlingListTimer <= 3200){
    for (int i = 0; i < shockWave4.size(); i++) {
      shockWave4.get(i).rustling = true;
    }
      shockWave4 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 3200 && millis() - rustlingListTimer <= 3800){
    for (int i = 0; i < shockWave5.size(); i++) {
      shockWave5.get(i).rustling = true;
    }
      shockWave5 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 3800 && millis() - rustlingListTimer <= 4400){
    for (int i = 0; i < shockWave6.size(); i++) {
      shockWave6.get(i).rustling = true;
    }
      shockWave6 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 4400 && millis() - rustlingListTimer <= 5000){
    for (int i = 0; i < shockWave7.size(); i++) {
      shockWave7.get(i).rustling = true;
    }
      shockWave7 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 5000 && millis() - rustlingListTimer <= 5600){
    for (int i = 0; i < shockWave8.size(); i++) {
      shockWave8.get(i).rustling = true;
    }
      shockWave8 = new ArrayList<Leaf>();
  }

  for (int i = 0; i < leafArray.length; i++) {
    leafArray[i].drawLeaf();

    if (mousePressed) { 
      if (leafArray[i].checkDistance() < 30 && !leafArray[i].rustling) {
        leafArray[i].rustling = true;
        for (int k = 0; k < leafArray.length; k++) {
          //epicenterDistance = abs(int(dist(leafArray[i].x, leafArray[i].y, leafArray[k].x, leafArray[k].y)));
          epicenterDistance = int(sqrt(sq(leafArray[k].x-leafArray[i].x))+sqrt(sq(leafArray[k].y-leafArray[i].y)));
          if (epicenterDistance < 150) {
            shockWave1.add(leafArray[k]);
          }
          else if (epicenterDistance > 50 && epicenterDistance < 150) {
            shockWave2.add(leafArray[k]);
          }
          else if(epicenterDistance > 150 && epicenterDistance < 250) {
            shockWave3.add(leafArray[k]);
          }
          else if(epicenterDistance > 250 && epicenterDistance < 350) {
            shockWave4.add(leafArray[k]);
          }
          else if(epicenterDistance > 350 && epicenterDistance < 450) {
            shockWave5.add(leafArray[k]);
          }
          else if(epicenterDistance > 450 && epicenterDistance < 550) {
            shockWave6.add(leafArray[k]);
          }
          else if(epicenterDistance > 550 && epicenterDistance < 650) {
            shockWave7.add(leafArray[k]);
          }
          else if(epicenterDistance > 650 && epicenterDistance < 750) {
            shockWave8.add(leafArray[k]);
          }
        }
        rustlingListTimer = millis();
      }
    }

    if (leafArray[i].rustling) {
      leafArray[i].r += rustleAngles[leafArray[i].rustleIndex];
      leafArray[i].rustleIndex++;
    }

    if (leafArray[i].rustleIndex == rustleAngles.length) {
      leafArray[i].rustling = false;
      leafArray[i].rustleIndex = 0;
    }
  }
}




void initializeLeafArray() {
  for (int i = 0; i < leafArray.length; i++) {
    leafArray[i] = new Leaf(int(random(10, width-10)), int(random(0, height-40)), random(0, 90), color(leafColors[i%leafColors.length]), 0);
  }
}

class Leaf {

  int x;
  int y;
  int direction;
  int movement;
  float distance;
  float r;
  color clr;
  boolean rustling = false;
  int rustleIndex;


  Leaf(int tempx, int tempy, float tempr, color tempclr, int temprustleIndex) {
    x = tempx;
    y = tempy;
    r = tempr;
    clr = tempclr;
    rustleIndex = temprustleIndex;
  }

  void drawLeaf() {
    noStroke();
    fill(clr);
    pushMatrix();
     translate(x, y);    
     rotate(radians(r));
      beginShape();
          vertex(0, 0);
          bezierVertex(-25, 25, -5, 60, 50, 70);
          vertex(0, 0);
          bezierVertex(50, 15, 55, 45, 50, 70);
      endShape();
      stroke(227, 191, 144);
      line(0, 0, 50, 70);
    popMatrix();
    
    direction = int(cos(r)/( abs(cos(r)) ));
  }
  
  float checkDistance() {
    distance = dist(mouseX, mouseY, x, y+30);
    return distance;
  }
}





