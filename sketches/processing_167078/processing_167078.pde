
ArrayList<Cell> cellBananza;

void setup() {
  size (800, 800);
  smooth();
  background (#004059);
  frameRate (30);
  cellBananza = new ArrayList<Cell>();
  cellBananza.add(new Cell(width/2, height/2, 100));  //adds first element
}

void draw() {
  fill (#004059, 30);
  noStroke ();
  rect (0, 0, width, height);
  for (int i = cellBananza.size ()-1; i >=0; i--) {
    Cell oneCell = cellBananza.get(i); 
    oneCell.bounceOffEdges();
    oneCell.display();

    }
  }


  //adds a new cell when mouse is clicked 
  void mouseClicked() {

    for (int i = cellBananza.size ()-1; i >= 0; i--) {

      if (dist(mouseX, mouseY, cellBananza.get(i).xPos, cellBananza.get(i).yPos) < cellBananza.get(i).radius) {
        cellBananza.add(new Cell(mouseX, mouseY, cellBananza.get(i).radius));
      }
    }
  }


  // Following sketches were used:
  //  http://www.openprocessing.org/sketch/143823
  //

//creates a new class

// class constractor
class Cell {  
  float xPos;
  float yPos;
  float radius;
  float xVel;
  float yVel;
  color c;


  Cell(float x, float y, float s) {
    xPos = x;
    yPos = y;
    radius = random(10, 70); //float s is the radius
    xVel = random(-3, 3);
    yVel = random(-3, 3);
    setColor();
    
  }
  // Sets colors for the cells
  void setColor() {
    int colorDice = (int) random(4);
    if (colorDice == 0) c = #008B8C;
    else if (colorDice == 1) c = #F1EFC7;
    else if (colorDice == 2) c = #F19A75;
    else c = #F2625D;
  }

  // BEHAVIOR
  void bounceOffEdges() {
    if (xPos > width - radius/2) {
      xVel = xVel * -1;
    } else if (xPos < 0 + radius/2) {
      xVel = xVel * -1;
    } else if (yPos > height - radius/2) {
      yVel = yVel * -1;
    } else if (yPos < 0 + radius/2) {
      yVel = yVel * -1;
    }
  }

//test-test
  void collide() {
    for (int i = cellBananza.size () - 1; i >=0; i--) {
      float dx = cellBananza[i].xPos - xPos;
      float dy = ocellBananza[i].yPos - yPos;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = cellBananza[i].radius/2 + radius/2;
      if (distance < minDist) {
        float angle = atan2(dy, dx);
        float targetX = xPos + cos(angle) * minDist;
        float targetY = yPos + sin(angle) * minDist;
        float ax = (targetX - cellBananza[i].xPos) * 1.9;
        float ay = (targetY - cellBananza[i].yPos) * 1.9;
        xVel -= ax;
        yVel -= ay;
        cellBananza[i].xVel += ax;
        cellBananza[i].yVel += ay;
      }
    }
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(xPos, yPos, radius, radius); //cell
    fill(250, 110, 100);
    ellipse(xPos, yPos, 7, 7); //heart of the cell

    //so the cells move around and dont get stuck at one place
    xPos += xVel;
    yPos += yVel;
  }
}



