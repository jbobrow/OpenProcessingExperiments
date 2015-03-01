
ArrayList<Cell> cellBananza;
float v_threshold_H = 3;
float v_threshold_L = 3;

void setup() {
  size (800, 800);
  smooth();
  background (#004059);
  frameRate (30);
  cellBananza = new ArrayList<Cell>();
  cellBananza.add(new Cell(width/2, height/2, 100));  //adds first element

  //checks if balls overlap

  for (int i = cellBananza.size ()-1; i >=0; i--) {
    for (int j=i; j >=0; j--) {
      if (i!=j) {
        float distance = dist(cellBananza.get(i).xPos, cellBananza.get(i).yPos, cellBananza.get(j).xPos, cellBananza.get(j).yPos);
        if (distance <=((cellBananza.get(i).radius + cellBananza.get(j).radius))/2) {
          cellBananza.get(i).radius = floor(distance/2);
          cellBananza.get(j).radius = floor(distance/2);
        }
      }
    }
  }
}

void draw() {
  fill (#004059, 20);
  noStroke ();
  rect (0, 0, width, height);
  for (int i = cellBananza.size ()-1; i >=0; i--) {
    Cell oneCell = cellBananza.get(i); 
    oneCell.bounceOffEdges();
    oneCell.display();
  }

  //collision with neighboors 
  for (int i = cellBananza.size ()-1; i >=0; i--) {
    for (int j=i; j >=0; j--) {
      if (i!=j) {
        float distance = dist(cellBananza.get(i).xPos, cellBananza.get(i).yPos, cellBananza.get(j).xPos, cellBananza.get(j).yPos);
        if (distance <=(cellBananza.get(i).radius + cellBananza.get(j).radius)/2) 
        {
          //start vectors
          PVector veli_s = new PVector(cellBananza.get(i).xVel, cellBananza.get(i).yVel);
          PVector velj_s = new PVector(cellBananza.get(j).xVel, cellBananza.get(j).yVel);

          //calculate the central point between two cells
          PVector  center1 = new PVector (cellBananza.get(j).xPos-cellBananza.get(i).xPos, cellBananza.get(j).yPos-cellBananza.get(i).yPos);
          center1.normalize();

          //calculate the perpendicular vector of center1
          PVector center2 = new PVector(center1.y, -1*center1.x);

          //calculate the final vector after collision
          float coef_i1 = (cellBananza.get(i).radius-cellBananza.get(j).radius)/(cellBananza.get(i).radius+cellBananza.get(j).radius);
          float coef_i2 = (2*cellBananza.get(j).radius)/(cellBananza.get(i).radius+cellBananza.get(j).radius);
          float coef_j1 = (2*cellBananza.get(i).radius)/(cellBananza.get(i).radius+cellBananza.get(j).radius);
          float coef_j2 = (cellBananza.get(j).radius-cellBananza.get(i).radius)/(cellBananza.get(i).radius+cellBananza.get(j).radius);      
          PVector vi_f_c1 = new PVector(coef_i1*veli_s.dot(center1)*center1.x+coef_i2*velj_s.dot(center1)*center1.x, coef_i1*veli_s.dot(center1)*center1.y+coef_i2*velj_s.dot(center1)*center1.y);
          PVector vj_f_c1 = new PVector(coef_j1*veli_s.dot(center1)*center1.x+coef_j2*velj_s.dot(center1)*center1.x, coef_j1*veli_s.dot(center1)*center1.y+coef_j2*velj_s.dot(center1)*center1.y);

          //calculate the final vector after collision projected on c2
          PVector vi_f_c2 = new PVector(veli_s.dot(center2)*center1.x, veli_s.dot(center2)*center1.y);
          PVector vj_f_c2 = new PVector(velj_s.dot(center2)*center1.x, velj_s.dot(center2)*center1.y);

          //calculate the final vector after collision
          PVector vi_f = new PVector(vi_f_c1.x+vi_f_c2.x, vi_f_c1.y+vi_f_c2.y);
          PVector vj_f = new PVector(vj_f_c1.x+vj_f_c2.x, vj_f_c1.y+vj_f_c2.y);

//          //adjust velocity according to thresholds
//          if (vi_f.x>v_threshold_H) vi_f.x=v_threshold_H;
//          else if (vi_f.x<v_threshold_H*-1) vi_f.x=v_threshold_H*-1;
//          if (vi_f.y>v_threshold_H) vi_f.y=v_threshold_H;
//          else if (vi_f.y<v_threshold_H*-1) vi_f.y=v_threshold_H*-1;
//          if (vj_f.x>v_threshold_H) vj_f.x=v_threshold_H;
//          else if (vj_f.x<v_threshold_H*-1) vj_f.x=v_threshold_H*-1;
//          if (vj_f.y>v_threshold_H) vj_f.y=v_threshold_H;
//          else if (vj_f.y<v_threshold_H*-1) vj_f.y=v_threshold_H*-1;         
//          if (vi_f.x<v_threshold_L && vi_f.x>0) vi_f.x=v_threshold_L;
//          else if (vi_f.x>v_threshold_L*-1 && vi_f.x<0) vi_f.x=v_threshold_L*-1;
//          if (vi_f.y<v_threshold_L && vi_f.y>0) vi_f.y=v_threshold_L;
//          else if (vi_f.y>v_threshold_L*-1 && vi_f.y<0) vi_f.y=v_threshold_L*-1;
//          if (vj_f.x<v_threshold_L && vj_f.x>0) vj_f.x=v_threshold_L;
//          else if (vj_f.x>v_threshold_L*-1 && vj_f.x<0) vj_f.x=v_threshold_L*-1;
//          if (vj_f.y<v_threshold_L && vj_f.y>0) vj_f.y=v_threshold_L;
//          else if (vj_f.y>v_threshold_L*-1 && vj_f.y<0) vj_f.y=v_threshold_L*-1;

          //update the velocity         
          cellBananza.get(i).xVel = vi_f.x;
          cellBananza.get(i).yVel = vi_f.y;
          cellBananza.get(j).xVel = vj_f.x;
          cellBananza.get(j).yVel = vj_f.y;

          //pull out the balls to avoid overlaping
          float pullMag = abs(distance-(cellBananza.get(i).radius+cellBananza.get(j).radius));
          cellBananza.get(i).xPos -= pullMag*center1.x;
          cellBananza.get(i).yPos -= pullMag*center1.y;
          cellBananza.get(j).xPos += pullMag*center1.y;
          cellBananza.get(j).yPos += pullMag*center1.y;
        }
      }
    }
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
// http://www.openprocessing.org/sketch/1794

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
    xPos = x; // x coordinate
    yPos = y; //y coordinate
    radius = random(10, 70); //float s is the radius
    xVel = random(-3, 3); //speed of the cell
    yVel = random(-3, 3); //speed of the cell
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
    if (xPos > (width) - radius/2) {
      xVel = xVel * -1;
    } else if (xPos < 0 + radius/2) {
      xVel = xVel * -1;
    } else if (yPos > (height) - radius/2) {
      yVel = yVel * -1;
    } else if (yPos < 0 + radius/2) {
      yVel = yVel * -1;
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



