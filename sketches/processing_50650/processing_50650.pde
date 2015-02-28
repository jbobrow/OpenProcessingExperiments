
import picking.*; // this is a library that allows for 3d object "picking" (or hit tests on objects). here i also use it for 2D picking
import processing.opengl.*;

// declare object arrays
Photograph[] photographs = new Photograph[21];
Structure[] structures = new Structure[21];
PhotoPrint[] photoPrints = new PhotoPrint[4];

// declare objects
Picker picker;
Grid grid;
Radial radial;
Linear linear;
Linear3D linear3D;
Grid3D grid3D;
Scatterplot scatterplot;
Viewport viewport; // stores x, y, z coordinates and rotation angles for the current viewport

// declare arrays
String[] sorts = { "year taken", "business name", "city" }; // stores lables for all available sorts the user can perform. they are keyed in to actual datafields in a function below.

// initialize globals
int sortKey = 0; // the index of the selected sort
String view = "grid"; // stores selected view
Boolean isDragged = false; // stores whether view has been dragged
PFont caption;
PFont label;

// initialize program constants
float thumbW = 130; // thumbnail width
float fullW = 350; // full image width
float rowH = 250; // row height
float leftMargin = 21; // left margin
float topMargin = 21; // top margin
float spacing = 12; // pixels between each grid cell
float damping = 0.1; // damping to make the transitions look more natural
int cols = 7; // number of columns in grid

void setup() {
  size(1024, 768, OPENGL);
  frameRate(60);
  smooth();
  
  // load font
  caption = loadFont("HelveticaNeue-Bold-11.vlw");
  label = loadFont("HelveticaNeue-Bold-15.vlw");

  // initialize 3D picker
  picker = new Picker(this);
  
  // initialize viewport
  viewport = new Viewport();

  // Structure(String businessName_, String structureType_, String country_, String city_, float yearBuilt_) {
  structures[0] = new Structure("Acme, inc.", "Water Tower", "USA", "New York", 1920);
  structures[1] = new Structure("Widget Corp", "Water Tower", "USA", "Los Angeles", 1934);
  structures[2] = new Structure("123 Warehousing", "Water Tower", "USA", "Chicago", 1901);
  structures[3] = new Structure("Demo Company", "Water Tower", "USA", "Houston", 1922);
  structures[4] = new Structure("Smith and Co.", "Water Tower", "USA", "Philadelphia", 1943);
  structures[5] = new Structure("Foo Bars", "Water Tower", "USA", "Phoenix", 1960);
  structures[6] = new Structure("ABC Telecom", "Water Tower", "USA", "San Antonio", 1933);
  structures[7] = new Structure("Fake Brothers", "Water Tower", "USA", "San Diego", 1934);
  structures[8] = new Structure("QWERTY Logistics", "Water Tower", "USA", "Dallas", 1942);
  structures[9] = new Structure("Demo, inc.", "Water Tower", "USA", "San Jose", 1957);
  structures[10] = new Structure("Sample Company", "Water Tower", "USA", "Jacksonville", 1967);
  structures[11] = new Structure("Sample, inc", "Water Tower", "USA", "Indianapolis", 1966);
  structures[12] = new Structure("Acme Corp", "Water Tower", "USA", "San Francisco", 1948);
  structures[13] = new Structure("Allied Biscuit", "Water Tower", "USA", "Austin", 1962);
  structures[14] = new Structure("Ankh-Sto Associates", "Water Tower", "USA", "Columbus", 1910);
  structures[15] = new Structure("Extensive Enterprise", "Water Tower", "USA", "Fort Worth", 1920);
  structures[16] = new Structure("Galaxy Corp", "Water Tower", "USA", "Charlotte", 1952);
  structures[17] = new Structure("Globo-Chem", "Water Tower", "USA", "Detroit", 1973);
  structures[18] = new Structure("Mr. Sparkle", "Water Tower", "USA", "El Paso", 1961);
  structures[19] = new Structure("Globex Corporation", "Water Tower", "USA", "Memphis", 1922);
  structures[20] = new Structure("LexCorp", "Water Tower", "USA", "Baltimore", 1970);
  
  // Photograph(int yearTaken_, String format_, Structure structure_, String url_, float thumbWidth_, float fullWidth_, float x_, float y_) {
  photographs[0] = new Photograph(1980, "black-and-white", structures[0], "BechersWaterTower_1.png", thumbW, fullW, width/2, height/2, 0);
  photographs[1] = new Photograph(1981, "black-and-white", structures[1], "BechersWaterTower_2.png", thumbW, fullW, width/2, height/2, 0);
  photographs[2] = new Photograph(1982, "black-and-white", structures[2], "BechersWaterTower_3.png", thumbW, fullW, width/2, height/2, 0);
  photographs[3] = new Photograph(1983, "black-and-white", structures[3], "BechersWaterTower_4.png", thumbW, fullW, width/2, height/2, 0);
  photographs[4] = new Photograph(1984, "black-and-white", structures[4], "BechersWaterTower_5.png", thumbW, fullW, width/2, height/2, 0);
  photographs[5] = new Photograph(1985, "black-and-white", structures[5], "BechersWaterTower_6.png", thumbW, fullW, width/2, height/2, 0);
  photographs[6] = new Photograph(1986, "black-and-white", structures[6], "BechersWaterTower_7.png", thumbW, fullW, width/2, height/2, 0);
  photographs[7] = new Photograph(1987, "black-and-white", structures[7], "BechersWaterTower_8.png", thumbW, fullW, width/2, height/2, 0);
  photographs[8] = new Photograph(1988, "black-and-white", structures[8], "BechersWaterTower_9.png", thumbW, fullW, width/2, height/2, 0);
  photographs[9] = new Photograph(1989, "black-and-white", structures[9], "BechersWaterTower_10.png", thumbW, fullW, width/2, height/2, 0);
  photographs[10] = new Photograph(1990, "black-and-white", structures[10], "BechersWaterTower_11.png", thumbW, fullW, width/2, height/2, 0);
  photographs[11] = new Photograph(1991, "black-and-white", structures[11], "BechersWaterTower_12.png", thumbW, fullW, width/2, height/2, 0);
  photographs[12] = new Photograph(1992, "black-and-white", structures[12], "BechersWaterTower_13.png", thumbW, fullW, width/2, height/2, 0);
  photographs[13] = new Photograph(1993, "black-and-white", structures[13], "BechersWaterTower_14.png", thumbW, fullW, width/2, height/2, 0);
  photographs[14] = new Photograph(1994, "black-and-white", structures[14], "BechersWaterTower_15.png", thumbW, fullW, width/2, height/2, 0);
  photographs[15] = new Photograph(1995, "black-and-white", structures[15], "BechersWaterTower_16.png", thumbW, fullW, width/2, height/2, 0);
  photographs[16] = new Photograph(1996, "duotone", structures[16], "BechersWaterTower_17.png", thumbW, fullW, width/2, height/2, 0);
  photographs[17] = new Photograph(1997, "black-and-white", structures[17], "BechersWaterTower_18.png", thumbW, fullW, width/2, height/2, 0);
  photographs[18] = new Photograph(1998, "black-and-white", structures[18], "BechersWaterTower_19.png", thumbW, fullW, width/2, height/2, 0);
  photographs[19] = new Photograph(1999, "duotone", structures[19], "BechersWaterTower_20.png", thumbW, fullW, width/2, height/2, 0);
  photographs[20] = new Photograph(2000, "duotone", structures[20], "BechersWaterTower_21.png", thumbW, fullW, width/2, height/2, 0);
  
  
  // PhotoPrint(int yearMade_, float w_, float h_, String format_, Photograph[] photographs_) {
  photoPrints[0] = new PhotoPrint(1990, 100, 100, "black-and-white", new Photograph[] { photographs[0], photographs[1], photographs[2], photographs[3], photographs[4], photographs[5] });
  photoPrints[1] = new PhotoPrint(1991, 100, 100, "black-and-white", new Photograph[] { photographs[6], photographs[7], photographs[8], photographs[9], photographs[10], photographs[11] });
  photoPrints[2] = new PhotoPrint(1992, 100, 100, "black-and-white", new Photograph[] { photographs[12], photographs[13], photographs[14], photographs[15], photographs[16], photographs[17] });
  photoPrints[3] = new PhotoPrint(1993, 100, 100, "duotone", new Photograph[] { photographs[17], photographs[19], photographs[20] });

  // load images and set stackOrder variable to determine the order to draw items in
  for (int i = 0; i < photographs.length; i++) {
    photographs[i].load();
    photographs[i].stackOrder = i; // set stackOrder variable to determine the order to draw items in
  }
  
  // intialize view
  initView();
}

void draw() {
  background(0);
  drawView();
}

void drawView() {
  
  // redraw view after sorting. first position objects, then display them. function arguments vary depending on the object class.
  
  if (view == "grid") {
    grid.position();
    grid.display(picker, viewport);
  }
  else if (view == "linear") {
    linear.position();
    linear.display(picker, viewport);    
  }
  else if (view == "radial") {
    radial.position();
    radial.display(picker, viewport);    
  }
  else if (view == "linear3D") {
    linear3D.position();
    linear3D.display(picker, viewport);    
  }
  else if (view == "grid3D") {
    grid3D.position();
    grid3D.display(picker, viewport);    
  }
  else if (view == "scatterplot") {
    scatterplot.position();
    scatterplot.display(picker, viewport);    
  }
}

void initView() {
  
  // initialize individual view objects. this needs to be done (obviously) before methods for any of the views can be invoked.
  
  if (view == "grid") {
    // Grid(Photograph[] photographs_, int cols_, float originX_, float originY_) {
    grid = new Grid(photographs, cols, width/2, topMargin);
  }
  else if (view == "linear") {
    // Linear(Photograph[] photographs_, float offsetX_, float offsetY_) {
    linear = new Linear(photographs, leftMargin + thumbW/2, height/2);
  }
  else if (view == "radial") {
    // Radial(Photograph[] photographs_, float centerX_, float centerY_, float r_) {
    radial = new Radial(photographs, width/2, height/2, height/2.75);
  }
  else if (view == "linear3D") {
    // Linear3D(Photograph[] photographs_, float centerX_, float centerY_) {
    linear3D = new Linear3D(photographs, width/2, height/2);
  }
  else if (view == "grid3D") {
    // Grid3D(Photograph[] photographs_, int cols_, float centerX_, float centerY_) {
    grid3D = new Grid3D(photographs, 5, width/2, height/2);
  }
  else if (view == "scatterplot") {
    // Scatterplot(Photograph[] photographs_, float originX_, float originY_) {
    scatterplot = new Scatterplot(photographs, 100, 100, width-150, height-200, "year taken", "year built");
  }
}


void changeStackOrder(int selectedPhotoIndex) {
  if (selectedPhotoIndex > -1) {
    
    if (!photographs[selectedPhotoIndex].isZoomed) {
      photographs[selectedPhotoIndex].isZoomed = true;
      
      /*
        update stack order to move selected item to the top of the drawing stack.
        this includes changing the stackOrder variable for the selected photo, and updating all photos to close the gap in the stack order
        this is conceptually similar to The Snake example in the Shiffman book
      */
      int prevIndex = photographs[selectedPhotoIndex].stackOrder; // first, get old index

      // loop from the previous index position to length of array - 2, and update stackOrder variable for each photo in that range
      int stackIndex = prevIndex;
      while (stackIndex < photographs.length - 1) {
        
        // loop through photos to get corresponding index
        for (int i = 0; i < photographs.length; i++) {
          if (photographs[i].stackOrder == stackIndex + 1) {
            
            photographs[i].stackOrder = stackIndex; // set stack order to previous index in the array, to shuffle array objects.
            photographs[i].isZoomed = false; // zoom out of other photos
            break;
          }
        }
        
        stackIndex++;
      }
      
      // set stack index for selected photo to length of array
      photographs[selectedPhotoIndex].stackOrder = photographs.length - 1;
    
    } else {
      photographs[selectedPhotoIndex].isZoomed = false;
    }
  }
}

void keyPressed() {
  // test whether a key has been pressed and change sort order
  String previousView = view;
  
  if (key == '1') { // remember: Char uses single quotes! (only String uses double quotes)
    view = "grid";
  } else if (key == '2') {
    view = "radial";
  } else if (key == '3') {
    view = "linear";
  } else if (key == '4') {
    view = "linear3D";
  } else if (key == '5') {
    view = "grid3D";
  } else if (key == '6') {
    view = "scatterplot";
  } else { // if any other key pressed
    sortKey = (sortKey + 1) % sorts.length; // cycle through sort order array
  }
  
  // sort view
  Arrays.sort(photographs, new SortObjects(sorts[sortKey]));
  
  // clear the selected object only when switching views
  if (!previousView.equals(view)) {
    // when switching views
    for (int i = 0; i < photographs.length; i++) {
      photographs[i].isZoomed = false;
    }
    
    initView(); // initialize view object
  }
  else {
    // when not switching views
    drawView();
  }
}

void mouseReleased() {
  if (!isDragged) { // this is necessary so dragging over objects doesn't fire a click on the object
  
    // test whether mouse clicked and zoom in to full object image
    if (view == "grid") {
      grid.onMousePressed(picker);
    }
    else if (view == "linear") {
      linear.onMousePressed(picker);
    }
    else if (view == "radial") {
      radial.onMousePressed(picker);
    }
    else if (view == "linear3D") {
      linear3D.onMousePressed(picker);
    }
    else if (view == "scatterplot") {
      scatterplot.onMousePressed(picker);
    }
  } else { // if dragged is in fact true, set back to false
    isDragged = false;
  }
}

void mouseDragged() {
  isDragged = true;
  
  // below are all the views that allow for panning
  if (view == "linear") {
    linear.onMouseDragged();
  }
  else if (view == "linear3D") {
    linear3D.onMouseDragged();
  }
  else if (view == "grid3D") {
    grid3D.onMouseDragged();
  }
}


