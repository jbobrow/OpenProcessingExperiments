

  //////////////////////////////////////
  //                                  //
  //  A-Life Elemental Simulation by  //
  //           Colin Willson          //
  //                                  //
  //////////////////////////////////////
  
int gridSize = 20;
//ArrayList<Element> gridIndex;

Element[][] gridIndex;
// Variables which control how much of each element to start with at the beginning
int plantStart = 1000;
int waterStart = 100;
int fireStart = 100;
int frameDelay = 10;

Element myElement;



void setup() {
  size(800, 800);
  gridIndex = new Element[width / gridSize][height / gridSize];

  // Makes the grid and fills it with 'blank' elements
  //gridIndex = new ArrayList<Element>((width/gridSize) + (height / gridSize));
  for (int i = 0; i < gridIndex.length; i++) {
    for (int j = 0; j < gridIndex[i].length; j++) {
      Element newEl = new Element(j, i);

      //println(newEl.xPos, newEl.yPos);
      gridIndex[newEl.xPos][newEl.yPos] = newEl;
    }
  }




  // Makes a bunch of plant elements, and puts them in random spots on the grid (replacing whatever was at that spot before)
  for (int i = 0; i < plantStart; i++) {
    Plant newEl = new Plant(int(random(0, width / gridSize)), int(random(0, height / gridSize)));

    //println(newEl.xPos, newEl.yPos);
    gridIndex[newEl.xPos][newEl.yPos] = newEl;
  }


  // Makes a bunch of water elements, and puts them in random spots on the grid (replacing whatever was at that spot before)  
  for (int i = 0; i < waterStart; i++) {


    Water newEl = new Water(int(random(0, width / gridSize)), int(random(0, height / gridSize)));

    gridIndex[newEl.xPos][newEl.yPos] = newEl;
  }

  // Makes a bunch of fire elements, and puts them in random spots on the grid (replacing whatever was at that spot before)
  for (int i = 0; i < fireStart; i++) {


    Fire newEl = new Fire(int(random(0, width / gridSize)), int(random(0, height / gridSize)));

    gridIndex[newEl.xPos][newEl.yPos] = newEl;
  }
  
  noStroke();
}




void draw() {
  background(0);


  // Update 100 random tiles
  for (int i = 0; i < 100; i++) {
    gridIndex[int(random(0, width / gridSize))][int(random(0, height / gridSize))].checkNeighbors();
  }

  // Goes through and displays each element in each individual spot
  for (int i = 0; i < gridIndex.length; i++) {
    for (int j = 0; j < gridIndex[i].length; j++) {
      //Element el = gridIndex.get(i);

      // Call the checkNeighbors() method within the element object to see what elements are next to it

      //println(i + j);
      if (gridIndex[i][j] != null) {
        //gridIndex[i][j].checkNeighbors();

        // Draws the element in the corresponding spot
        gridIndex[i][j].display();
      }
    }
  }

  // Draws the grid lines over everything else
  //grid();

  // Calls the function below and passes the milliseconds to delay the draw loop

  statusDisplay();
  delayTimer(frameDelay);
}


// A function which controls the pace of the draw loop so that it doesn't go to fast. Takes a parateter for the ammount of milliseconds to delay
void delayTimer(int delayMill) {

  int startTime = millis();

  while (millis () < startTime + delayMill) {
  }
}


// Draws the grid lines
void grid() {

  stroke(255);
  for (int i = 0; i < width; i+=gridSize) {
    line(i, 0, i, height);
  } 

  for (int i = 0; i < height; i+=gridSize) {
    line(0, i, width, i);
  }
}

// Prints the current status (ammount of elements/frames) of the program on the console
void statusDisplay() {

  int elCount = 0;
  int fireCount = 0; 
  int waterCount = 0;
  int plantCount = 0;

  for (int i = 0; i < gridIndex.length; i++) {
    for (int j = 0; j < gridIndex[i].length; j++) {
      Element el = gridIndex[i][j];

      if (el.type != "blank") {
        elCount++;
      }
      if ( el.type == "fire") {
        fireCount ++;
      }
      if ( el.type == "water") {
        waterCount ++;
      }
      if ( el.type == "plant") {
        plantCount ++;
      }
    }
  }
  println("Frame: " + frameCount +"  Total Elements: " + elCount +  " Fire: " + fireCount + "  Water: " + waterCount + "  Plants: " + plantCount);
}

class Element {
  int xPos;
  int yPos;
  color thisColor;
  String type;
  //int arrayIndex;
  int motivation;

  float age = 0;

  Element(int _xPos, int _yPos) {

    xPos = _xPos;
    yPos = _yPos;

    //arrayIndex = xPos + ((yPos - 1) * (width/gridSize));
    type = "blank";

    motivation = 8;
  }

  //  Element(int _index) {
  //
  //    arrayIndex = _index;
  //    xPos = _index % (width/gridSizegrid);
  //    yPos = _index/(width/gridSize);
  //    type = "blank";
  //    motivation = 8;
  //  }

  void display() {


    fill(0);
    rect(xPos * gridSize, yPos * gridSize, gridSize, gridSize);

    //fill(255);
    //text(arrayIndex, xPos * gridSize + 5, yPos * gridSize + 15);

    //println(thisColor);
  }

  void checkNeighbors() {
    //println("check....");
  }

  // Check the left side if the element
  Element checkLeft() {
    // If it isn't the leftmost space in the row return the object in that space
    if (xPos > 0) {
      return gridIndex[xPos - 1][yPos];
    } 
    else { 
      return null;
    }
  }

  Element checkRight() {
    if (xPos < (width/gridSize)-1) {
      return gridIndex[xPos + 1][yPos];
    }
    else {
      return null;
    }
  }
  Element checkUp() {
    if (yPos > 0) {
      return gridIndex[xPos][yPos - 1];
    }
    else {
      return null;
    }
  }
  Element checkDown() {
    if (yPos < (height / gridSize)-1) {
      return gridIndex[xPos][yPos + 1];
    }
    else {
      return null;
    }
  }


  void deleteElement(int thisX, int thisY) {
    gridIndex[thisX] [thisY] = new Element(thisX, thisY);
  }
  
}

class Fire extends Element {
  //color thisColor;
  //String elementType;
  //int arrayIndex;

  Fire(int _xPos, int _yPos) {
    super(_xPos, _yPos);
    thisColor = color(255, 0, 0);

    motivation = 8;
    type = "fire";
  }

  //  Fire(int index) {
  //    super(index);
  //    thisColor = color(255, 0, 0);
  //
  //    motivation = 8;
  //
  //    type = "fire";
  //  }

  void display() {
    
    age += .1;
        fill(red(thisColor)-((255/10)*age), green(thisColor)-((255/10)*age), blue(thisColor)-((255/10)*age));

    //super.display();
    rect(xPos * gridSize, yPos * gridSize, gridSize, gridSize);
    if ( age >= 10) {
      deleteElement(xPos, yPos);
    }
  }


  void checkNeighbors() {

    if (checkLeft() != null) {
      if (checkLeft().type == "plant" && random(1, 10) < checkLeft().age) {
        Fire tempEl = new Fire(xPos - 1, yPos);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }

    if (checkRight() != null) {
      if (checkRight().type == "plant" && random(1, 10) < checkRight().age) {
        Fire tempEl = new Fire(xPos + 1, yPos);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }


    if (checkUp() != null) {
      if (checkUp().type == "plant" && random(1, 10) < checkUp().age) {
        Fire tempEl = new Fire(xPos, yPos - 1);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }

    if (checkDown() != null) {
      if (checkDown().type == "plant" && random(1, 10) <  checkDown().age) {
        Fire tempEl = new Fire(xPos, yPos + 1);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }
  }

  /*
  Element checkLeft()
   Element checkRight()
   Element checkUp()
   Element checkDown()
   
   */
}

class Plant extends Element {
  //color thisColor;
  //String elementType;
  //int arrayIndex;

  //color thisColor;
  Plant(int _xPos, int _yPos) {
    super(_xPos, _yPos);
    thisColor = color(0, 255, 0);

    motivation = 3;
    type = "plant";

    //age = 0;
  }
  //  Plant(int index) {
  //    super(index);
  //    thisColor = color(0, 255, 0);
  //
  //    motivation = 9;
  //    type = "plant";
  //
  //    //age = 0;
  //  }

  void display() {
    age += .1;

    fill(red(thisColor)+((255/10)*age), green(thisColor), 0);
    rect(xPos * gridSize, yPos * gridSize, gridSize, gridSize);
    //println(red(thisColor)+((255/10)*age));

    //super.display();
    //println("overloaded");
    //age = millis();
  }


  void checkNeighbors() {

      if (checkLeft() != null) {
        if (checkLeft().type == "water" && random(1, 10) > age) {
          Plant tempEl = new Plant(xPos - 1, yPos);
          gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
        }
      }

      if (checkRight() != null) {
        if (checkRight().type == "water" && random(1, 10) > age) {
          Plant tempEl = new Plant(xPos + 1, yPos);
          gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
        }
      }


      if (checkUp() != null) {
        if (checkUp().type == "water" && random(1, 10) > age) {
          Plant tempEl = new Plant(xPos, yPos - 1);
          gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
        }
      }

      if (checkDown() != null) {
        if (checkDown().type == "water" && random(1, 10) > age) {
          Plant tempEl = new Plant(xPos, yPos + 1);
          gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
        }
      }
    
  }

  /*
  Element checkLeft()
   Element checkRight()
   Element checkUp()
   Element checkDown()
   
   */
}

class Water extends Element {
  //color thisColor;
  //String elementType;
  //int arrayIndex;

  Water(int _xPos, int _yPos) {
    super(_xPos, _yPos);

    thisColor = color(0, 0, 255);

    motivation = 8;

    type = "water";
  }

  //  Water(int index) {
  //    super(index);
  //    thisColor = color(0, 0, 255);
  //
  //    motivation = 9;
  //
  //    type = "water";
  //
  //    //age = 0;
  //  }

  void display() {

    fill(thisColor);
    rect(xPos * gridSize, yPos * gridSize, gridSize, gridSize);
  }


  void checkNeighbors() {

    if (checkLeft() != null) {
      if (checkLeft().type == "fire" && random(1, 10) < motivation) {
        Water tempEl = new Water(xPos - 1, yPos);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }

    if (checkRight() != null) {
      if (checkRight().type == "fire" && random(1, 10) < motivation) {
        Water tempEl = new Water(xPos + 1, yPos);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }


    if (checkUp() != null) {
      if (checkUp().type == "fire" && random(1, 10) < motivation) {
        Water tempEl = new Water(xPos, yPos - 1);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }

    if (checkDown() != null) {
      if (checkDown().type == "fire" && random(1, 10) < motivation) {
        Water tempEl = new Water(xPos, yPos + 1);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }





    if (checkLeft() != null) {
      if (checkLeft().type == "blank") {
        Water tempEl = new Water(xPos - 1, yPos);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }

    if (checkRight() != null) {
      if (checkRight().type == "blank") {
        Water tempEl = new Water(xPos + 1, yPos);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }


    if (checkUp() != null) {
      if (checkUp().type == "blank") {
        Water tempEl = new Water(xPos, yPos - 1);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }

    if (checkDown() != null) {
      if (checkDown().type == "blank") {
        Water tempEl = new Water(xPos, yPos + 1);
        gridIndex[tempEl.xPos][tempEl.yPos] = tempEl;
      }
    }
  }

//    if (checkLeft().type == "blank" && random(1, 10) > motivation) {
//      Water tempEl = new Water(arrayIndex - 1);
//      gridIndex.set(checkLeft().arrayIndex, tempEl);
//    }
//
//    if (checkRight().type == "blank" && random(1, 10) > motivation) {
//      Water tempEl = new Water(arrayIndex + 1);
//      gridIndex.set(checkRight().arrayIndex, tempEl);
//    }
//
//    if (checkUp().type == "blank" && random(1, 10) > motivation) {
//      Water tempEl = new Water(arrayIndex - (width/gridSize));
//      gridIndex.set(checkUp().arrayIndex, tempEl);
//    }
//
//    if (checkDown().type == "fire" && random(1, 10) > motivation) {
//      Water tempEl = new Water(arrayIndex + (width/gridSize));
//      gridIndex.set(checkDown().arrayIndex, tempEl);
//    }


/*
  Element checkLeft()
 Element checkRight()
 Element checkUp()
 Element checkDown()
 
 */
}
class Wind extends Element {
  //color thisColor;
  //String elementType;
  //int arrayIndex;

  Wind(int _xPos, int _yPos) {
    super(_xPos, _yPos);

    thisColor = color(0, 255, 0);
    type = "wind";
  }

//  void display() {
//
//    fill(thisColor);
//    rect(xPos * gridSize, yPos * gridSize, gridSize, gridSize);
//  }


  void checkNeighbors() {

    if (checkLeft().type == "water") {
    }
    if (checkLeft().type == "fire") {
    }
  }

  /*
  Element checkLeft()
   Element checkRight()
   Element checkUp()
   Element checkDown()
   
   */
}



