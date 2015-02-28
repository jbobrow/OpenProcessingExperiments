
///////Lauren Ruoff copyright 2014
////////////lruoff Project 2

////////////////Declarations\\\\\\\\\\\\\\\\\\\\\

int[] rustleAngles = { 
  45, -45, 40, -40, 35, -35, 30, -30, 15, -15
};
boolean rustling = false;
//int rustleIndex = 0;
final int MAX = 100;
color backgroundColor;
//float checkLeafDistance;
int[][] checkLeafDistance;
int maximumDistance = 100;
int lastTime = 0;

Leaf [ ] leafArray;
Leaf testLeaf;

//////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void setup() {

  size(400, 600);
  backgroundColor = color(170, 155, 112);
  background(backgroundColor);
  smooth();
  //noCursor();
  frameRate(10);

  leafArray = new Leaf [MAX];
  initializeLeafArray();
  testLeaf = new Leaf(width/2, height/2, 0, color(100, 0, 0), 0);
}

/////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void draw() { 
  background(backgroundColor);
  
  

////////Check distance between each leaf/////////////////   
    checkLeafDistance = new int[leafArray.length][];
    for (int j = 0; j < leafArray.length; j++) {
      checkLeafDistance[j] = new int[leafArray.length - j-1];
      for (int k = j+1; k < (leafArray.length); k++) {
        checkLeafDistance[j][k-j-1] = int(dist(leafArray[j].x, leafArray[j].y, leafArray[k].x, leafArray[k].y));
      }
    }
    
  for (int i = 0; i < leafArray.length; i++) {
    leafArray[i].drawLeaf();

///////////////////////////////////////////

    if (mousePressed) {   
      if (leafArray[i].checkDistance() < 30 && !leafArray[i].rustling) {
        leafArray[i].rustling = true;
        
      }
    }
    
    if(leafArray[i].secondCounter != -1 && millis() - leafArray[i].secondCounter >= 500) {
     leafArray[i].rustling = true; 
     leafArray[i].secondCounter = -1;
    }

    ///////////////if leafArray[i].rustling = true, check if distance to next leaf < 45 rustle that leaf = true//////

    if (leafArray[i].rustling) {
      leafArray[i].r += rustleAngles[leafArray[i].rustleIndex];
      leafArray[i].rustleIndex++;
     for(int j = 0; j < checkLeafDistance[i].length; j++){
          if(checkLeafDistance[i][j] < maximumDistance & leafArray[i].rustling) {
            leafArray[j+i+1].secondCounter = millis();
            println(" " + leafArray[j+i].secondCounter);
          }
        }
    }

    if (leafArray[i].rustleIndex == rustleAngles.length) {
      leafArray[i].rustling = false;
      leafArray[i].rustleIndex = 0;
    }
  }
}    

void initializeLeafArray() {
  for (int i = 0; i < leafArray.length; i++) {
    leafArray[i] = new Leaf(int(random(10, width-10)), int(random(0, height-40)), random(0, 90), color(int(random(75, 100)), int(random(80, 110)), 0), 0);
  }
}

//float leafSpacing(Leaf leafArray) {
//  checkLeafDistance = dist(Leaf.x, Leaf.y, Lea, y);
//  return checkLeafDistance;
//}

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
  int secondCounter = -1;


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





