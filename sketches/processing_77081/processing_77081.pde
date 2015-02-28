
/**
Distribute 'x' points randomly
Find 'k' nearest neighbors
Make shape for each point using 
  k nearest neighbors as vertices
Make it pretty...
Philippe Moore 2012

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">NEIGHBORHOODSWHATUP</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://philippealmoore.com" property="cc:attributionName" rel="cc:attributionURL">http://philippealmoore.com</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
**/

ArrayList pnts;
int population, counter, fade;
float dr;

void setup() {
  size(500, 500);
  //size(screenHeight, screenHeight);
  pnts = new ArrayList();
  noCursor();
  noStroke();
  smooth();
  population = 20;
  dr = 3;
  fade = 255;
  counter = 200;
  populatePnts();
  findNeighbors();
  printNeighbors();
  //detectCollisions();
}

void draw() {
  //displayPnts();
  counter--;
  drawBg();
  makeShapes();
  driftPnts();
  //drawNeighbors();
}

void drawBg() {
  fill(240, fade);
  noStroke();
  rect(0, 0, width, height);  
}

void populatePnts() {
  for (int i=0; i<population; i++) {
    float x = random(width);
    float y = random(height);
    pnts.add(new Pnt(x, y));
    println("Pnt added at (" + x + ", " + y + ")");
  }
  for (int j=0; j<population; j++) {
    Pnt pnt = (Pnt) pnts.get(j);
    pnt.populateNeighbors();
  }
}

void detectCollisions() {
  for (int i=0; i<pnts.size()-1; i++) {
    Pnt pnt = (Pnt) pnts.get(i);
    for (int j=i+1; j<pnts.size(); j++) {
      Pnt temp = (Pnt) pnts.get(j);
      if ((pnt.pos.dist(temp.pos)-(pnt.w+temp.w))<0) {
        println("COLLISIONS");
      }
    }
  }
}

void displayPnts() {
  for (int i=0; i<pnts.size(); i++) {
    Pnt pnt = (Pnt)pnts.get(i);
    pnt.display();
  }
}

//find all neighbors
void findNeighbors() {
  //start from the beginning of the neighborhood
  for (int i=0; i<pnts.size()-1; i++) {
    Pnt first = (Pnt) pnts.get(i);
    //move from there to every other Pnt in neighborhood
    for (int j=i+1; j<pnts.size(); j++) {
      Pnt secondary = (Pnt) pnts.get(j);
      //compare distance from first Pnt to second Pnt against the distance
      //from first Pnt to each of its neighbors
      for (int k = 0; k<first.neighborhood; k++) {
        println("Comparing the " + i + "st/rd/th Pnt against the " + j + "Pnt and the " + k + "neighbor of " + i + "!!!");
        Pnt tertiary = (Pnt) first.neighbors.get(k);
        if (first.pos.dist(secondary.pos)<first.pos.dist(tertiary.pos)) {
          first.removeLargest(k);
          first.neighbors.add(secondary);
          println("Adding secondary neighbor at position " + secondary.pos);
        }
      }
    }
  }
}

void printNeighbors() {
  for (int i=0; i<pnts.size(); i++) {
    Pnt pnt = (Pnt) pnts.get(i);
    for (int j=0; j<pnt.neighbors.size(); j++) {
      Pnt pntr = (Pnt) pnt.neighbors.get(j);
      println(i + "Pnt " + j+ " " + pntr.pos);
    }
  }
}

void drawNeighbors() {
  for (int i=0; i<pnts.size(); i++) {
    Pnt pnt = (Pnt) pnts.get(i);
    for (int j=0; j<pnt.neighborhood; j++) {
      Pnt nbr = (Pnt) pnt.neighbors.get(j);
      line(pnt.pos.x, pnt.pos.y, nbr.pos.x, nbr.pos.y);
    }
  }
}

void makeShapes() {
  for (int i=0; i<pnts.size()-3; i++) {
    fill(random(255), random(255), random(255), 50);
    beginShape();
    Pnt pnt = (Pnt) pnts.get(i);
    vertex(pnt.pos.x, pnt.pos.y);
    for (int j=0; j<pnt.neighborhood; j++) {
      Pnt pntr = (Pnt) pnt.neighbors.get(j);
      vertex(pntr.pos.x, pntr.pos.y);
    }
    endShape(CLOSE);
  }
}

void driftPnts() {
  for (int i=0; i<pnts.size(); i++) {
    Pnt pnt = (Pnt) pnts.get(i);
    pnt.pos.add(new PVector(random(-dr, dr), random(-dr, dr)));
    if (pnt.pos.x>width || pnt.pos.x<0) {pnt.pos.x = random(width);}
    if (pnt.pos.y>height || pnt.pos.y<0) {pnt.pos.y = random(height);}
  }  
  
}

class Pnt {
  PVector pos;
  float w;
  ArrayList neighbors;
  int neighborhood;

  Pnt(float xPos, float yPos) {
    pos = new PVector(xPos, yPos);
    w = 5;
    neighborhood = 5;
    neighbors = new ArrayList();
  }

  void display() {
    ellipse(pos.x, pos.y, w, w);
  }

  void populateNeighbors() {
    println("Populating Neighbors");
     for (int i=0; i<neighborhood; i++) {
      neighbors.add(new Pnt(10000, 10000));
    }
  }
  
  
  //find the largest position and remove it from the list
  void removeLargest(int position) {
    float largest = 0;
    float prevLargest = 0;
    //start from the first instance of a position which is larger than a previous comparator
    int target = position;
    //iterate through the rest of the neighborhood
    for (int i=position; i<neighbors.size(); i++) {
      Pnt temp = (Pnt) neighbors.get(i);
      //compare this Pnt to the comparator position in neighbors
      if (this.pos.dist(temp.pos)>largest) {
        //if the distance fromthis point to the neighbor is greater than largest, 
        //set the position of pnt to be removed to the current position
        position = i;
        largest = this.pos.dist(temp.pos);
        println("Largest is at position: " + i + " and is " + largest);
      }
    }
    println("Removing Largest at position: " + position);
    this.neighbors.remove(position);  
  }

}




