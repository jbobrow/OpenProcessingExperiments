
int tileCount = 10; //tile count here, sets up grid in x and y, must be an integer
float scope = 1.5;
float angleSpeed = 0.05;
float angle = 0;//rotation of the arc

int tileWidth, tileHeight; //dimensions of grid cell
int actRandomSeed = 0; //random seed
int stroke0, stroke1;// stroke variation
int actStrokeCap = ROUND; //stroke Modes
float a; //rotation angle
PShape sheep; //custom shape or module
float moduleSize; //custom module size


void setup() {
  size(500, 500);
  background(255);
  smooth();
  cursor(CROSS);

  sheep = loadShape("Module_1.svg");//loads the shape

    tileWidth = width/tileCount;//getting the smallest grid unit in X
  tileHeight = height/tileCount;//getting the smallest grid unit in Y

  moduleSize = tileWidth;//setting the size of the SVG to fit the cell
}

void draw() {
  background(255);

  stroke0 = mouseX/30;//mouse input for stroke
  stroke1 = mouseY/30;//mouse input for stroke

  randomSeed(actRandomSeed);//setting the randomseed

    strokeCap(actStrokeCap);//setting the strokeCap

    for (int gridY = 0; gridY < tileCount; gridY++) {//cells in x
    for (int gridX = 0; gridX < tileCount; gridX++) {//cells in y

      float posX = width/tileCount * gridX + tileWidth/2;//iterating through cells in x
      int posY = height/tileCount * gridY + tileHeight/2;//iterating through cells in y

      int toggle = (int) random(0, 2);//binary toggle

      //text(gridX, posX, posY);//text check

      stroke(0, 25);
      strokeWeight(1);
      rectMode(CENTER);
      noFill();
      rect(posX, posY, width/tileCount, height/tileCount); //draws the grid
      ellipse(posX, posY, tileWidth-2, tileHeight-2);//geometry check

      //================================================================================================================================
      //SETTING THE MOUSE INTERACTION AND ROTATIONS

      a = atan2(mouseY - posY, mouseX - posX);//measures angle from mouse position to posX, posY centers

      float range = tileWidth*scope;//setting a range of searching. Larged the multiplier, more the range of shapes influenced

      //Checking for proximity distance
      if (dist(mouseX, mouseY, posX, posY) < range) {
        pushMatrix();

        translate(posX, posY);
        rotate(angle);
        noFill();
        stroke(0, 214, 161);
        strokeWeight(stroke1);
        //arc(0, 0, tileWidth, tileHeight, random(0, 2*PI), random(radians(mouseX/1.1), 2*PI));
        ellipse(0, 0, moduleSize, moduleSize);


        popMatrix();
      }// by making the if loop a part of the for loop, only selected modules will get translated. pretty cool

      //drawing the modules
      pushMatrix();

      translate(posX, posY);
      rotate(a);
      shapeMode (CENTER);
      noStroke();
      shape(sheep, 0, 0, tileWidth*0.8, tileHeight*0.8);//calling the shape

      popMatrix();
    }
  }
  angle+=angleSpeed;
}
//================================================================================================================================
void mousePressed() {
  actRandomSeed = (int) random(0, 100);
}

//================================================================================================================================
void keyReleased() {
  if (key == '1') {
    actStrokeCap = ROUND;
  }

  if (key == '2') {
    actStrokeCap = PROJECT;
  }

  if (key == '3') {
    actStrokeCap = SQUARE;
  }
}
//================================================================================================================================

