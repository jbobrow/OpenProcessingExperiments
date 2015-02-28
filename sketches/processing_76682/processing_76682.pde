
/*****************************************
 * Assignment 4
 * Name:    James Reingruber
 * E-mail:  jreingru@haverford.edu
 * Course:      CS 110 - Section 01
 * Submitted:    10/23/2012
 *
 * 
 * This program depicts a mid-afternoon scene in Autumn.
 * Arrays and objects are used to create leaves and
 * berries falling from a tree
 *
***********************************************/
//declare arrays
Acorn[] acorns = new Acorn [15];
Leaf[] leaves = new Leaf [5000];

//declare MaxNumObjects (used to determine how many leaves can be created at one via mouse click)
int MaxNumObjects=20;
Maple[] maples = new Maple [MaxNumObjects];


//create background, canvas size
void setup () {
  smooth ();
  background (255);
  size (500, 500);
  
  //for loop used to create berries falling out of tree
  for (int i = 0; i < acorns.length; i++) {
    acorns[i] = new Acorn (i*10, random (0, 100), random (1, 5));
  }
  //for loop used to create pile of leaves on ground
  for (int i = 0; i < leaves.length; i++) {
    leaves[i] = new Leaf (random (0, 500), random (400, 500), random (0, 360), random (100, 200), random (0, 50), random (0, 10));
  }
}

void draw () {
  //tan autumn background
  background (219,162,93);
  noStroke ();
 //draw pile of leaves
    for (int i = 0; i < leaves.length; i++) {
      leaves[i].appear ();
    }
//create leaves blowing in wind via mouseclick
  for (int i=0; i< maples.length; i++) {
    if (maples[i] != null) {
      maples[i].show ();
      maples[i].blow ();
    }
  }
   
//draw sun.  Fill Color determined by distance of mouse from sun
fill (500-(dist (mouseX,mouseY, 500,0)/1.8), 56,7); 
ellipse (500,0, 100,100);
   
    //draw tree
    fill (121, 77, 5);
    rect (50, 100, 50, 350);
    fill (0, 250, 0);
    ellipse (100, 100, 100, 75);
    ellipse (150, 100, 100, 75);
    ellipse (50, 100, 100, 75);
    ellipse (0, 85, 100, 75);
    ellipse (125, 50, 100, 75);
    ellipse (110, 35, 100, 75);
    ellipse (0, 45, 100, 75);
    ellipse (50, 50, 100, 75);

    //draw rake
    stroke (0);
    fill (219,195,9);
    ellipse (90, 240, 10, 5);
    beginShape ();
    vertex (85, 240);
    vertex (95, 240);
    vertex (160, 390);
    vertex (150, 390);
    endShape (CLOSE);
    line (155, 390, 110, 450);
    line (155, 390, 100, 450);
    line (155, 390, 120, 450);
    line (155, 390, 130, 450);
    line (155, 390, 140, 450);
    line (155, 390, 150, 450);
    line (155, 390, 160, 450);
    line (155, 390, 170, 450);
    line (155, 390, 180, 450);
    line (155, 390, 190, 450);
    line (155, 390, 200, 450);
    line (155, 390, 210, 450);
    line (155, 390, 220, 450);
    line (155, 390, 230, 450);
    line (155, 390, 240, 450);
    line (155, 390, 250, 450);
    line (155, 390, 260, 450);
   
    noStroke ();
   
    //create berries that fall from tree
    for (int i = 0; i < acorns.length; i++) {
      acorns[i].fall();
      acorns[i].display ();
    }
  
}
/*****************************************
 * Represents berriers generated at random positions that 
 * fall from tree
 * @author James Reingruber (jreingru@haverford.edu)
 *
***********************************************/
class Acorn {
  float nutx;
  float nuty;
  float ySpeed;

  Acorn (float tempNutx, float tempNuty, float tempYSpeed) {
    nutx=tempNutx;
    nuty= tempNuty;
    ySpeed= tempYSpeed;
  }
  //display berries
  void display () {
    line (nutx, nuty, nutx, nuty-3);
    fill (227, 33, 27);
    ellipse (nutx, nuty, 5, 5);
  }
  //berries fall
  void fall () {
    nuty = nuty + ySpeed;
    if (nuty > 500) {
      nuty = random (0, 100);
    }
  }
}

/*****************************************
 * Represents a pile of leaves on the ground
 *
 * @author James Reingruber (jreingru@haverford.edu)
 *
***********************************************/
class Leaf {
  float leafX;
  float leafY;
  float leafAngle;
  float leafRed;
  float leafGreen;
  float leafBlue;

  Leaf (float tempLeafX, float tempLeafY, float tempLeafAngle, float tempLeafRed, float tempLeafGreen, float tempLeafBlue) {
    leafX= tempLeafX;
    leafY=tempLeafY;
    leafAngle=tempLeafAngle;
    leafRed = tempLeafRed;
    leafGreen= tempLeafGreen;
    leafBlue=tempLeafBlue;
  }
  
  //create pile of leaves
  void appear () {
    fill (leafRed, leafGreen, leafBlue);
    pushMatrix();
    translate (leafX, leafY);
    rotate (radians(leafAngle));
    ellipse (0, 0, 15, 7);
    popMatrix();
  }
}

/*****************************************
 * Represents leaves blowing in the wind that can be created  
 * via mouse click
 * @author James Reingruber (jreingru@haverford.edu)
 *
***********************************************/
class Maple {
  float mapleX;
  float mapleY;
  float mapleWidth;
  float mapleHeight;
  float mapleXspeed;
  float mapleYspeed;
  float leafColor;

  Maple (float tempMapleX, float tempMapleY, float tempMapleWidth, float tempMapleHeight, float tempLeafColor) {

    mapleX= tempMapleX;
    mapleY = tempMapleY;
    mapleWidth = tempMapleWidth;
    mapleHeight= tempMapleHeight;
    leafColor = tempLeafColor;
  }
  //maple leaves appear
  void show () {
    frameRate (30);
    fill (203, leafColor, 12);
    ellipse (mapleX, mapleY, mapleWidth, mapleHeight);
    stroke (72, 61, 5);
    line (mapleX, mapleY- (mapleHeight/2), mapleX, mapleY+(mapleHeight/2));
    noStroke ();
  }
 
  //maple leaves blown by wind
  void blow () {
    mapleX = mapleX+6;
    mapleY = (mapleY+4) + (32 * cos (mapleX));
  }
}


//formula for making maximum number of leaves appearing via mousepress = MaxNumObjects
int idxMyobject = 0;

void mousePressed () {
  maples [idxMyobject] = new Maple(mouseX, mouseY, random (3,12), random (12,19), random (100,250));
  idxMyobject = (idxMyobject +1) % MaxNumObjects;
}
