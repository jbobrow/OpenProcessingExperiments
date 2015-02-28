
///////Lauren Ruoff copyright 2014
////////////lruoff Project 2

////////////////Declarations\\\\\\\\\\\\\\\\\\\\\

int[] rustleAngles = { 
  45, -45, 40, -40, 35, -35, 30, -30, 15, -15
};
boolean rustling = false;
final int MAX = 100;
color backgroundColor;
color[] leafColors = {
  color(135, 152, 140), color(201, 222, 181), color(154, 178, 63)
};

int leafNumber;
int epicenterDistance;
int rustlingListTimer = -1;
int waitTimer = 0;

ArrayList<Leaf> shockWave1 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave2 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave3 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave4 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave5 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave6 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave7 = new ArrayList<Leaf>();
ArrayList<Leaf> shockWave8 = new ArrayList<Leaf>();

Leaf [ ] leafArray;

//////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void setup() {

  size(400, 600);
  //backgroundColor = color(129, 126, 131);
  //backgroundColor = color(84, 82, 85);
  //backgroundColor = color(139, 133, 111);
  backgroundColor = color(93, 89, 80);
  background(backgroundColor);
  smooth();
  frameRate(9);

  leafArray = new Leaf [MAX];
  initializeLeafArray();
}

/////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void draw() { 

  background(backgroundColor);

  //////////////////////////////////////////////////////////////////////  
  ///////////////////Initializing shock wave times\\\\\\\\\\\\\\\\\\\\\\
  //////////////////////////////////////////////////////////////////////

  if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 600 && millis() - rustlingListTimer <= 1000) {
    for (int i = 0; i < shockWave1.size(); i++) {
      shockWave1.get(i).rustling = true;
    }
    shockWave1 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 700 && millis() - rustlingListTimer <= 1500) {
    for (int i = 0; i < shockWave2.size(); i++) {
      shockWave2.get(i).rustling = true;
    }
    shockWave2 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 1200 && millis() - rustlingListTimer <= 2100) {
    for (int i = 0; i < shockWave3.size(); i++) {
      shockWave3.get(i).rustling = true;
    }
    shockWave3 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 1800 && millis() - rustlingListTimer <= 2800) {
    for (int i = 0; i < shockWave4.size(); i++) {
      shockWave4.get(i).rustling = true;
    }
    shockWave4 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 2500 && millis() - rustlingListTimer <= 3600) {
    for (int i = 0; i < shockWave5.size(); i++) {
      shockWave5.get(i).rustling = true;
    }
    shockWave5 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 3300 && millis() - rustlingListTimer <= 4500) {
    for (int i = 0; i < shockWave6.size(); i++) {
      shockWave6.get(i).rustling = true;
    }
    shockWave6 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 4200 && millis() - rustlingListTimer <= 5500) {
    for (int i = 0; i < shockWave7.size(); i++) {
      shockWave7.get(i).rustling = true;
    }
    shockWave7 = new ArrayList<Leaf>();
  }
  else if (rustlingListTimer != -1 && millis() - rustlingListTimer >= 5200 && millis() - rustlingListTimer <= 6600) {
    for (int i = 0; i < shockWave8.size(); i++) {
      shockWave8.get(i).rustling = true;
    }
    shockWave8 = new ArrayList<Leaf>();
  }


  /////////////////////////////////////////////////////////////
  //////////////////Drawing the leaves\\\\\\\\\\\\\\\\\\\\\\\\\
  //////////////////////////////////////////////////////////////

  for (int i = 0; i < leafArray.length; i++) {
    leafArray[i].drawLeaf();

    /////////////////////////////////////////////////////////////////////
    //////////////////Rustling individual Leaves/////////////////////////
    /////////////////////////////////////////////////////////////////////


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



///////\\\\\\\\\\///////////\\\\\\\\\\\///////////\\\\\\\\\\\/////////\\\
//////////////////////Creating the leaves\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////\\\\\\\\\\\\//////////\\\\\\\\\\\\\///////////\\\\\\\\\\////////

void initializeLeafArray() {
  for (int i = 0; i < leafArray.length; i++) {
    leafArray[i] = new Leaf(int(random(10, width-10)), int(random(0, height-40)), random(0, 90), color(leafColors[i%leafColors.length]), 0);
  }
}

void keyPressed() {
  //if(millis() > waitTimer + 1000) {
  // waitTimer = millis();
  leafNumber = int(random(leafArray.length));
  leafArray[leafNumber].rustling = true;
  
  

    ///////////////////////////////////////////////////////////////
    /////////////////Initializing Shock Waves\\\\\\\\\\\\\\\\\\\\\\
    //////////////////////////////////////////////////////////////

  for (int k = 0; k < leafArray.length; k++) {
    //epicenterDistance = abs(int(dist(leafArray[i].x, leafArray[i].y, leafArray[k].x, leafArray[k].y)));
    epicenterDistance = int(sqrt(sq(leafArray[k].x-leafArray[leafNumber].x))+sqrt(sq(leafArray[k].y-leafArray[leafNumber].y)));
    if (epicenterDistance < 150) {
      shockWave1.add(leafArray[k]);
    }
    else if (epicenterDistance > 100 && epicenterDistance < 200) {
      shockWave2.add(leafArray[k]);
    }
    else if (epicenterDistance > 200 && epicenterDistance < 300) {
      shockWave3.add(leafArray[k]);
    }
    else if (epicenterDistance > 300 && epicenterDistance < 400) {
      shockWave4.add(leafArray[k]);
    }
    else if (epicenterDistance > 400 && epicenterDistance < 500) {
      shockWave5.add(leafArray[k]);
    }
    else if (epicenterDistance > 500 && epicenterDistance < 600) {
      shockWave6.add(leafArray[k]);
    }
    else if (epicenterDistance > 600 && epicenterDistance < 700) {
      shockWave7.add(leafArray[k]);
    }
    else if (epicenterDistance > 700 && epicenterDistance < 800) {
      shockWave8.add(leafArray[k]);
    }
    rustlingListTimer = millis();
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
     scale(.7);
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





