
int Unit; //unit element. every (translation-)movement will be a multiple of this Unit dimension.
int gridUnit; // min dist between Gridlines
ArrayList Shp;
int I = -1; //each Obj we draw has an index number. I helps point at the specific Obj, so that we can catch it and do things to it.
 
void setup() {
  /*size(int(displayWidth*.75),int(displayHeight*.75));*/ size(1000,600);
  smooth();
  noLoop();
  setupUnit();
  setupCanvas();
  setupColour();
  initialise();
}
 
void initialise() {
//this function is made separately from setup() so that the initialisation actions can be called by the user at any time.
//this, this is a handle where i can join the "calibration" programs to this one, and build a larger (user-data-driven) one.
  Shp = new ArrayList();
  textFont(loadFont("Monospaced-12.vlw"));
}
 
void draw() {
  background(grey[colourRange]);
  grid();
  for(int i=0; i <Shp.size(); i++) {
    Obj tempShp = (Obj) Shp.get(i);
    tempShp.drawShape();
  }
  //menu drawn on top of everyting else.
  menu();
}
 
// ------------------------- COLOUR -------------------------
 
color colourRange = 100; // must be an integer
color[] grey = new color[colourRange+1];
color colourChangeDir = +1; // can be (-1) if the user inverts colours.
 
void setupColour() {
  colorMode(RGB,colourRange);
  for(int i=0; i<=colourRange; i++)
    grey[i] = i;
}
 
// -------------------------  GRID  -------------------------
 
void setupUnit() {
  Unit = (min(width, height)/300);
    gridUnit = 3*Unit;
}
 
int grid_Show = +1; // +1 = Draw Grid && -1 = Draw Nothing
 
void grid() {
  //ensure that strokeWeight is 1;
  strokeWeight(1);
  //to show/hide grid, we fiddle with its Stroke.
  if(grid_Show == -1) noStroke();
  if(grid_Show == +1) stroke(grey[int(colourRange*0.95)]);
  //vertical grid-lines:
  for(int i=0; i<=width; i+=gridUnit)
    line(i, 0, i, height);
  //horizontal grid-lines:
  for(int i=0; i<=height; i+=gridUnit)
    line(0, i, width, i);
}
 
// ------------------------- CANVAS -------------------------
 
int canvasLeft, canvasRight, canvasTop, canvasBottom;
 
void setupCanvas() {
  canvasLeft = 0; canvasRight = width;
  canvasTop = menuHeight; canvasBottom = height;
}


// -------------------------  MENU  -------------------------
 
int menuHeight = 40; //preferably an int (this is, however, a subjective suggestion)
int menu_Show = +1;
 
void menu() {
  if(menu_Show == +1) {
    noStroke();
    rectMode(CORNER);
    fill(grey[colourRange]);
    rect(0, 0, width, canvasTop);
    //temp, till menuButtons() is fully developed
      String msg = "M: Menu •• G: Grid •• 1: New Obj •• 2: Refresh Obj •• 3: Sq/Cir •• DEL •• ±: Scale •• V,C: Colour •• I: Invert •• ↑←→↓: Nudge •• ][: Reorder";
      rectMode(CORNER);
      fill(grey[int(colourRange/2)]);
      textAlign(LEFT);
      textSize(12);
      text(msg, Unit*5, menuHeight*0.6);
    menuButtons();
    //show line separating menu() from the rest of the canvas()
      noFill();
      strokeWeight(3);
      stroke(grey[int(colourRange*0.9)]); //as grey as the gridlines
      line(0, menuHeight, width, menuHeight);
      strokeWeight(1); // return to strokeWeight(1) if it was called differently
      noStroke(); //return everything to noStroke() after every call to stroke()
  }
  if(menu_Show == -1) {
    noStroke();
    fill(grey[colourRange]);
  }
}
 
void menuButtons() {
  float menuCentre = menuHeight/2;
  noStroke();
  rectMode(CENTER);
  //button:grid
//  rect(20, menuCentre, 20, 20);
}


// ------------------------- MOUSE  -------------------------
 
float clickedX, clickedY;
float distX, distY;
 
void mousePressed() {
  clickedX = mouseX;
  clickedY = mouseY;
  //first, deselect any selected object
    I=-1;
  //did the user click on the Menu bar?
   
  //else, did he click on an object? ..let's check which Obj the user clicked on:
//  else {
    for(int i= Shp.size()-1; i>=0; i--) { //begin with the top-most Obj
      Obj tempShp = (Obj) Shp.get(i);
      if(clickedX >= tempShp.posX-(tempShp.dimension/2) && clickedX <= tempShp.posX+(tempShp.dimension/2)) {
        if(clickedY >= tempShp.posY-(tempShp.dimension/2) && clickedY <= tempShp.posY+(tempShp.dimension/2)) {
          I = i;
          break; //the for-loop breaks running once we find the shape we clicked on
    }  }  }
    Obj tempShp = (Obj) Shp.get(I);
    distX = tempShp.posX - clickedX;
    distY = tempShp.posY - clickedY;
//  }
}
 
void mouseDragged() {
  Obj tempShp = (Obj) Shp.get(I);
  tempShp.posX = mouseX + distX;
  tempShp.posY = mouseY + distY;
  isTheObjStillOnTheCanvas();
  redraw();
}


int shapeType_max = 2;
  // 0 - circle
  // 1 - rectangle
  // .: max 2 types of shapes. can add more, and change this number suitably.
 
class Obj {
  //all the data below are called 'properties'.
  //all have to be of the same datatype, since Shp.change() applies to all of them.
    int shapeType = int(random(0,shapeType_max));
    float dimension;
    float posX, posY;
    float angle;
    color colour;
 
  //Default constructor
  Obj() {
    dimension = int(random(50, 200));
    posX = int(random(width/3, width*2/3));
    posY = int(random(height/3, height*2/3));
    // angle = random(radians(0),radians(360));
      angle = 0;
    colour = grey[int(random(0,colourRange))];
  }
 
  //Copy constructor
  Obj(Obj temp) {
    this.shapeType = temp.shapeType;
    this.dimension = temp.dimension;
    this.posX = temp.posX;
    this.posY = temp.posY;
    this.angle = temp.angle;
    this.colour = temp.colour;
  }
   
  //functions
  void drawShape() {
    noStroke();
    fill(colour);
    if(shapeType == 0) {
      ellipseMode(CENTER);
      ellipse(posX, posY, dimension, dimension);
    }
    if(shapeType == 1) {
      rectMode(CENTER);
      rect(posX, posY, dimension, dimension);
    }
  }
}


// ------------------------- KEYPRS -------------------------
 
void keyPressed() {
  //menu_Show
    if(key == 'm' || key == 'M')
      menu_Show *= -1;
  //grid_Show
    if(key == 'g' || key == 'G')
      grid_Show *= -1;
  //Nudge (Translate)
    if(key == CODED) {
      Obj tempShp = (Obj) Shp.get(I);
      if(keyCode == RIGHT)
        tempShp.posX += Unit;
      if(keyCode == LEFT)
        tempShp.posX -= Unit;
      if(keyCode == UP)
        tempShp.posY -= Unit;
      if(keyCode == DOWN)
        tempShp.posY += Unit;
      isTheObjStillOnTheCanvas();
    }
  //scale
    if(key == '=') {
      Obj tempShp = (Obj) Shp.get(I);
      tempShp.dimension += Unit;
    }
    if(key == '+') {
      Obj tempShp = (Obj) Shp.get(I);
      tempShp.dimension += (10*Unit);
    }
    if(key == '-') {
      Obj tempShp = (Obj) Shp.get(I);
      tempShp.dimension -= Unit;
    }
    if(key == '_') {
      Obj tempShp = (Obj) Shp.get(I);
      tempShp.dimension -= (10*Unit);
    }
  //re-order (move objects above or below each other)
    if(key == ']' || key == '}') {
      if(key == ']') {
        //move UP one step at a time
        Obj tempShp_this = (Obj) Shp.get(I);
        Obj tempShp_above= (Obj) Shp.get(I+1);
        Shp.set(I, tempShp_above);
        Shp.set(I+1, tempShp_this);
        I++;
      }
      if(key == '}') {
        //move UP to the TOP immediately
        Obj tempShp_this = (Obj) Shp.get(I);
        Obj tempShp_top  = (Obj) Shp.get(Shp.size()-1);
        Shp.add(Shp.size(), new Obj(tempShp_this));
        Shp.remove(I);
        I = Shp.size()-1;
      }       
    }
    if(key == '[' || key == '{') {
      if(key == '[') {
        //move DOWN one step at a time
        Obj tempShp_this = (Obj) Shp.get(I);
        Obj tempShp_below= (Obj) Shp.get(I-1);
        Shp.set(I, tempShp_below);
        Shp.set(I-1, tempShp_this);
        I--;
      }
      if(key == '{') {
        //move DOWN to the BOTTOM immediately
        Obj tempShp_this  = (Obj) Shp.get(I);
        Obj tempShp_bottom= (Obj) Shp.get(0);
        Shp.add(0, new Obj(tempShp_this));
        Shp.remove(I+1);
        I = 0;
      }
    }
  //make new object
    if(key == '1') {
      Shp.add(I+1, new Obj());
      I++;
    }
  //refresh an object (i.e., re-generate it)
    if(key == '2') {
      Obj tempShp = (Obj) Shp.get(I);
      Shp.set(I, new Obj());
    }
  //change the object type
    if(key == '3') {
      Obj tempShp = (Obj) Shp.get(I);
      tempShp.shapeType++;
      if(tempShp.shapeType >= shapeType_max)
        tempShp.shapeType = 0;
    }
  //delete object
    if(key == BACKSPACE || key == DELETE) {
      Shp.remove(I);
      I--; //once we delete an object, the one below it gets selected.
    }
  //change colour of selected object
    if(key == 'v' || key == 'V') {
      Obj tempShp = (Obj) Shp.get(I);
      if(key == 'v') tempShp.colour += colourChangeDir;
      else if(key == 'V') tempShp.colour += 10*colourChangeDir;
      isTheColourStillInRange();
    }
    if(key == 'c' || key == 'C') {
      Obj tempShp = (Obj) Shp.get(I);
      if(key == 'c') tempShp.colour -= colourChangeDir;
      else if(key == 'C') tempShp.colour -= 10*colourChangeDir;
      isTheColourStillInRange();
    }
  //invert colours (of the entire composition)
    if(key == 'i' || key == 'I') {
      //invert colours themselves
      for(int i=0; i<=colourRange; i++)
        grey[i] = colourRange - grey[i];
      //invert colourChangeDir, so user can work in inverted_colours mode.
      colourChangeDir *= -1;
      //invert colour of all Objs:
      for(int i=0; i<Shp.size(); i++) {
        Obj tempShp = (Obj) Shp.get(i);
        tempShp.colour = colourRange - tempShp.colour;
      }
    }
  //redraw() at the end
  redraw();
}
 
// ------------------------- CHECKS -------------------------
 
void isTheObjStillOnTheCanvas() {
  //check to see if the shape has been dragged out of the canvas itself
  Obj tempShp = (Obj) Shp.get(I);
  if(tempShp.posX > canvasRight) tempShp.posX = canvasRight;
  if(tempShp.posX < canvasLeft) tempShp.posX = canvasLeft;
  if(tempShp.posY < canvasTop) tempShp.posY = canvasTop;
  if(tempShp.posY > canvasBottom) tempShp.posY = canvasBottom;
}
 
void isTheColourStillInRange() {
  Obj tempShp = (Obj) Shp.get(I);
  if(tempShp.colour > colourRange)
    tempShp.colour = colourRange;
  if(tempShp.colour < 0)
    tempShp.colour = 0;
}


/*
 
************************* TO-DO LIST *************************
 
for drawing shapes, refer to: http://www.openprocessing.org/sketch/60524
further: create and delete user-built shapes
 
duplicate shape
 
menu bar:
provide buttons (square areas on the screen)
on mouseClick on those areas, diff tools get activated.
i.e., clicking on those areas (buttons!) is like pressing a key
+
give greater control in choosing what kind of an obj gets made
e.g. L makes a circle && M makes a rect
+
show/hide menubar (keep a button when it gets hidden)
 
snap-to-grid
 
a status bar.
e.g. when the user is moving an object, the posX and posY get displayed below.
 
selection areas for circles are still rectangular.
make them precise.
&/OR
make a rect bounding box around alleach shape..
(box appears when shape is selected)
..and use it as a mouse-handle for scale && rotate.
 
play in full-screen, and define a canvas.
the canvas should be another class, and (maybe also) editable.
 
export to PDF:
so that students can print out their compositions for teachers
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*/



