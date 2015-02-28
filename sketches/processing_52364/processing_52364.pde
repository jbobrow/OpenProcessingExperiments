
import picking.*; // this is a library that allows for 3d object "picking" (or hit tests on objects). here i also use it for 2D picking
import processing.opengl.*;

// declare object arrays
Flannel[] flannel = new Flannel[30];
Info[] info = new Info[30];
Category[] categories;

// declare objects
Picker picker;
Grid grid;

Linear linear;
Viewport viewport; // stores x, y, z coordinates and rotation angles for the current viewport

//arrays
String[] sorts = { "primColor", "cut", "date" }; // contains all possible sorts to cycle through on keyPressed
ArrayList categoryLabels = new ArrayList();


// initialize globals
int sortKey = 0; // the index of the selected sort
String view = "grid"; // stores selected view
Boolean isDragged = false; // stores whether view has been dragged
PFont caption;
PFont label;
PFont biglabel;


// initialize program constants
float thumbW = 65; // thumbnail width
float fullW = 350; // full image width
float rowH = 65; // row height
float leftMargin = 42; // left margin
float topMargin = 60; // top margin
float categoryTopMargin = 65; // top margin for category list

float spacing = 0; // pixels between each grid cell
float damping = 0.3; // damping to make the transitions look more natural
int cols = 15; // number of columns in grid
int rows = 2;
int categorySpacing = 35;


void setup() {
  size(1024, 768, OPENGL);
  frameRate(60);
  smooth();
  
  // load font
  caption = loadFont("HelveticaLTStd-Light-11.vlw");
  label = loadFont("HoeflerText-BlackItalic-17.vlw");
  biglabel = loadFont("HoeflerText-BlackItalic-25.vlw");
  
  // initialize 3D picker
  picker = new Picker(this);
  
  
   // initialize viewport
  viewport = new Viewport();
  
//Info(String brandName_, String shirtSize_, String cut_, String date_, String bough_, String material, String live_, String from_) {  // Info(String brandName_, String size, String shirtColor, String cut_, String date) {
  
 
  info[0] = new Info("American Eagle Outfitters", "Small", "Athletic Fit", "2008", "rag.png", "100cotton.png", "DANF_0001.png", "china.png");
  info[1] = new Info("Gap", "Small", "Fitted Fit", "2008", "new.png", "100cotton.png", "DANF_0002.png", "china.png");
  info[2] = new Info("Monticello", "Small", "Normal Cut", "2009", "buffalo.png", "65rodel.png", "DANF_0000.png", "china.png");

  info[3] = new Info("Obey Propaganda", "Medium", "Fitted Fit", "2010", "buffalo.png", "2spandex.png", "DANF_0003.png", "china.png");
  info[4] = new Info("Ben Sherman.", "Large", "Normal Cut", "2010", "rag.png", "100cotton.png", "DANF_0004.png", "thailand.png");
  info[5] = new Info("Wesc", "Small", "Normal Cut", "2008", "buffalo.png", "100cotton.png", "DANF_0005.png", "china.png");
  info[6] = new Info("Arizona","Small",  "Western Cut", "2008", "rag.png", "100cotton.png", "DANF_0006.png", "india.png");
  info[7] = new Info("American Eagle Outfitters", "Small", "Normal Cut", "2009", "new.png", "100cotton.png", "DANF_0007.png", "china.png");
  info[8] = new Info("Old Navy", "Small", "Western Cut", "2009", "new.png", "100cotton.png", "DANF_0008.png", "china.png");
  info[9] = new Info("Converse One Star", "Large",  "Normal Cut", "2010", "buffalo.png", "100cotton.png", "DANF_0009.png", "china.png");
  
  info[10] = new Info("Heath", "Large", "Normal Cut", "2011", "new.png", "100cotton.png", "DANF_0010.png", "china.png");
  info[11] = new Info("Banana Republic", "Medium", "Normal Cut", "2012", "new.png", "100cotton.png", "DANF_0011.png", "china.png");
  info[12] = new Info("Divided", "Medium",  "Fitted Fit", "2009", "urban.png", "79cotton.png", "DANF_0012.png", "vietnam.png");
  info[13] = new Info("Wrangler", "Medium", "Fitted Western Cut", "2010", "buffalo.png", "100cotton.png", "DANF_0013.png", "south korea.png");
  info[14] = new Info("Pendleton", "Large", "Normal Cut", "2011", "buffalo.png", "100wool.png", "DANF_0014.png", "oregon.png");
  info[15] = new Info("Divided", "Medium", "Normal Cut", "2012", "urban.png", "100cotton.png", "DANF_0015.png", "bangladesh.png");
  info[16] = new Info("Campus", "Medium", "Normal Cut", "2012", "buffalo.png", "100cotton.png", "DANF_0016.png", "bangladesh.png");
  info[17] = new Info("Levi", "Large", "Western Cut", "2010", "used.png", "100cotton.png", "DANF_0017.png", "china.png");
  info[18] = new Info("Paul Frank", "Large", "Normal Cut",  "2010", "new.png", "100cotton.png", "DANF_0018.png", "vietnam.png");
  info[19] = new Info("Wrangler", "Medium", "Western Cut",  "2009", "used.png", "100cotton.png", "DANF_0019.png", "south korea.png");
  info[20] = new Info("Vip", "Medium", "Western Cut",  "2012", "new.png", "65cotton.png", "DANF_0020.png", "china.png");
  
  info[21] = new Info("Levi", "Large", "Normal Cut",  "2011", "buffalo.png", "100cotton.png", "DANF_0021.png", "china.png");
  info[22] = new Info("Salt Valley", "Medium", "Fitted Western Cut",  "2012", "buffalo.png", "100cotton.png", "DANF_0022.png", "india.png");
  info[23] = new Info("A Cheap Flannel", "Large", "Western Cut",  "2012", "buffalo.png", "65cotton.png", "DANF_0023.png", "vietnam.png");
  info[24] = new Info("Quicksilver", "Medium", "Normal Cut",  "2011", "new.png", "100cotton.png", "DANF_0024.png", "china.png");
  info[25] = new Info("Salt Valley", "Medium", "Fitted Western Cut",  "2012", "buffalo.png", "100cotton.png", "DANF_0025.png", "india.png");
  info[26] = new Info("Levi", "Medium", "Normal Cut",  "2012", "used.png", "100cotton.png", "DANF_0026.png", "china.png");
  info[27] = new Info("Stapleford", "Medium", "Western Cut", "2012", "used.png", "100cotton.png", "DANF_0027.png", "oregon.png");
  info[28] = new Info("Ambiguous", "Medium", "Normal Cut", "2012", "rag.png", "2spandex.png", "DANF_0028.png", "india.png");
  info[29] = new Info("Lobo by Pen West", "Medium", "Normal Cut", "2012", "used.png", "100cotton.png", "DANF_0029.png", "bangladesh.png");
 
 /* 
   blue = 1
  red = 2
  green = 3
  grey = 4
  white = 5
  brown = 6
  black = 7
   
  */ 
  // Flannel(int yearTaken_, String format_, Structure structure_, String url_, float thumbWidth_, float fullWidth_, float x_, float y_) {
  flannel[0] = new Flannel(info[0], 1, "Flannel_0000.png", thumbW, fullW, width/2, height/2, 1);
 
 
  flannel[1] = new Flannel(info[1], 6, "Flannel_0001.png", thumbW, fullW, width/2, height/2,0);
  flannel[2] = new Flannel(info[2], 5, "Flannel_0002.png", thumbW, fullW, width/2, height/2,0);
  flannel[3] = new Flannel(info[3], 2, "Flannel_0003.png", thumbW, fullW, width/2, height/2,0);
  flannel[4] = new Flannel(info[4], 7, "Flannel_0004.png", thumbW, fullW, width/2, height/2,0);
  flannel[5] = new Flannel(info[5], 6, "Flannel_0005.png", thumbW, fullW, width/2, height/2,0);
  flannel[6] = new Flannel(info[6], 3, "Flannel_0006.png", thumbW, fullW, width/2, height/2,0);
  flannel[7] = new Flannel(info[7], 1, "Flannel_0007.png", thumbW, fullW, width/2, height/2,0);
  flannel[8] = new Flannel(info[8], 6, "Flannel_0008.png", thumbW, fullW, width/2, height/2,0);
  flannel[9] = new Flannel(info[9], 1, "Flannel_0009.png", thumbW, fullW, width/2, height/2,0);
 
  flannel[10] = new Flannel(info[10], 2, "Flannel_0010.png", thumbW, fullW, width/2, height/2,0);
  flannel[11] = new Flannel(info[11], 1, "Flannel_0011.png", thumbW, fullW, width/2, height/2,0);
  flannel[12] = new Flannel(info[12], 2, "Flannel_0012.png", thumbW, fullW, width/2, height/2,0);
  flannel[13] = new Flannel(info[13], 5, "Flannel_0013.png", thumbW, fullW, width/2, height/2,0);
  flannel[14] = new Flannel(info[14], 2, "Flannel_0014.png", thumbW, fullW, width/2, height/2,0);
  flannel[15] = new Flannel(info[15], 2, "Flannel_0015.png", thumbW, fullW, width/2, height/2,0);
  flannel[16] = new Flannel(info[16], 3, "Flannel_0016.png", thumbW, fullW, width/2, height/2,0);
  flannel[17] = new Flannel(info[17], 2, "Flannel_0017.png", thumbW, fullW, width/2, height/2,0);
  flannel[18] = new Flannel(info[18], 2, "Flannel_0018.png", thumbW, fullW, width/2, height/2,0);
  flannel[19] = new Flannel(info[19], 1, "Flannel_0019.png", thumbW, fullW, width/2, height/2,0);
  /*
   blue = 1
  red = 2
  green = 3
  grey = 4
  white = 5
  brown = 6
  black = 7
  purple = 8
   */
  
  flannel[20] = new Flannel(info[20], 2, "Flannel_0020.png", thumbW, fullW, width/2, height/2,0);
  flannel[21] = new Flannel(info[21], 6, "Flannel_0021.png", thumbW, fullW, width/2, height/2,0);
  flannel[22] = new Flannel(info[22], 8, "Flannel_0022.png", thumbW, fullW, width/2, height/2,0);
  flannel[23] = new Flannel(info[23], 2, "Flannel_0023.png", thumbW, fullW, width/2, height/2,0);
  flannel[24] = new Flannel(info[24], 7, "Flannel_0024.png", thumbW, fullW, width/2, height/2, 0);
  flannel[25] = new Flannel(info[25], 1, "Flannel_0025.png", thumbW, fullW, width/2, height/2, 0);
  flannel[26] = new Flannel(info[26], 1, "Flannel_0026.png", thumbW, fullW, width/2, height/2, 0);
  flannel[27] = new Flannel(info[27], 2, "Flannel_0027.png", thumbW, fullW, width/2, height/2, 0);
  flannel[28] = new Flannel(info[28], 7, "Flannel_0028.png", thumbW, fullW, width/2, height/2, 0);
  flannel[29] = new Flannel(info[29], 6, "Flannel_0029.png", thumbW, fullW, width/2, height/2, 0);

  // SecondP(String from_, String url_, String material_, String flannelface_, String music_, float x_, float y_, float w_) 
 for (int i = 0; i < info.length; i++) {
    
    // check for duplicates
    Boolean duplicate = false;
    
    if (categoryLabels.size() > 0) { // execute only if ArrayList has at least one item
      
      // loop through ArrayList and check for duplicates
      for (int n = 0; n < categoryLabels.size(); n++) {
        String label = (String) categoryLabels.get(n);
        
        if (info[i].date.equals(label)) {
          duplicate = true;
        }
      }
      
      if (!duplicate) {
        categoryLabels.add(info[i].date); // only add category to ArrayList if not a duplicate
      }
    }
    else { // if ArrayList has 0 items, add the first
      categoryLabels.add(info[i].date);
    }
  }
 
 
  
  // init categories
  categories = new Category[categoryLabels.size()];
  
  for (int i = 0; i < categoryLabels.size(); i++) {
    String label = (String) categoryLabels.get(i);
    float posX = 735+ i * categorySpacing * 1.5;
    float posY = 50;

    // Category(String name_, float x_, float y_) {
    categories[i] = new Category(label, posX, posY);
    
  }

  // load images and set stackOrder variable to determine the order to draw items in
  for (int i = 0; i < flannel.length; i++) {
    flannel[i].load();
    flannel[i].stackOrder = i; // set stackOrder variable to determine the order to draw items in
  }
  
  // intialize view
  initView();
}

void draw() {
  background(220);
  drawBackground();

  applyFilters();
  drawView();
  drawCategories();
 
}
void drawBackground() {
  
  picker.stop(); // stop the picker so it doesn't interfere with the background
  
  stroke(0);
  line(20,65,998,65);
  line(20,738,998,738);
  textFont(biglabel,20);
  fill(20);
  text ("Flanimal.", 460, 50);
  
  
  noStroke();
  fill(200);
  rect(309,84,397,470);
  fill(190);
  rect(338,116,340,408);
  fill(0,0,255);
  
  
  fill(210);
  rect(width/4 - 201, height/2-40, 210, 210);
  rect(width/4 - 201, height/4-108, 210, 210);

  rect(width/2 + 238, height/2-40, 210, 210);
  rect(width/2 + 238, height/4-108, 210, 210);

  fill(100);
  text ("from.", 200, 270);
  //show country flag
  text ("material.", 171, 530);
  //show tree graph usually 100% cotton

  text ("owner.", 888, 270);
  //show photo of flannel being worn
  text ("made.", 890, 530);
  // scan over and play selected song*/

  
  picker.resume(); // resume the picker
}


void applyFilters() {
  // filter out balls based on the category selections, by setting "visible" data field to false
  for (int i = 0; i < flannel.length; i++) {
    
    for (int n = 0; n < categoryLabels.size(); n++) {
      
      // check if ball category equals the current category
      String label = (String) categoryLabels.get(n);
      if (flannel[i].info.date.equals(label)) {
        
        // show balls if category is selected; hide if not
        if (categories[n].selected == true) {
          flannel[i].visible = true;
        } else {
          flannel[i].visible = false;
        }
      }
    }
  }
}



void drawCategories() {
  for (int i = 0; i < categories.length; i++) {
     categories[i].display();
  }
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
}

void initView() {
  
  // initialize individual view objects. this needs to be done (obviously) before methods for any of the views can be invoked.
  
  if (view == "grid") {
    // Grid(flannel[] flannel_, int cols_, float originX_, float originY_) {
    grid = new Grid(flannel, cols, width/2, topMargin);
  }
  else if (view == "linear") {
    // Linear(flannel[] flannel_, float offsetX_, float offsetY_) {
    linear = new Linear(flannel, leftMargin + thumbW/2, height/2);
  }
}

void keyPressed() {
  // test whether a key has been pressed and change sort order
  String previousView = view;
  
  if (key == '1') { // remember: Char uses single quotes! (only String uses double quotes)
    view = "grid";
  } else if (key == '2') {
    view = "linear";

  } else { // if any other key pressed
    sortKey = (sortKey + 1) % sorts.length; // cycle through sort order array
  }
  
  // sort view
  Arrays.sort(flannel, new SortObjects(sorts[sortKey]));
  
  // clear the selected object only when switching views
  if (!previousView.equals(view)) {
    // when switching views
    for (int i = 0; i < flannel.length; i++) {
      flannel[i].isZoomed = false;
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
   
      if (view == "grid") {
      grid.onMousePressed(picker);
    }

    // test whether mouse clicked and zoom in to full object image
    if (view == "linear") {
      linear.onMousePressed(picker);
    }
    
  } else { // if dragged is in fact true, set back to false
    isDragged = false;
  }
}

void mouseDragged() {
  isDragged = true;
 
   if (view == "linear") {
    linear.onMouseDragged();
  }
}

void changeStackOrder(int selectedPhotoIndex) {
  if (selectedPhotoIndex > -1) {
    
    if (!flannel[selectedPhotoIndex].isZoomed) {
      flannel[selectedPhotoIndex].isZoomed = true;
      
      /*
        update stack order to move selected item to the top of the drawing stack.
        this includes changing the stackOrder variable for the selected photo, and updating all photos to close the gap in the stack order
        this is conceptually similar to The Snake example in the Shiffman book
      */
      int prevIndex = flannel[selectedPhotoIndex].stackOrder; // first, get old index

      // loop from the previous index position to length of array - 2, and update stackOrder variable for each photo in that range
      int stackIndex = prevIndex;
      while (stackIndex < flannel.length - 1) {
        
        // loop through photos to get corresponding index
        for (int i = 0; i < flannel.length; i++) {
          if (flannel[i].stackOrder == stackIndex + 1) {
            
            flannel[i].stackOrder = stackIndex; // set stack order to previous index in the array, to shuffle array objects.
            flannel[i].isZoomed = false; // zoom out of other photos
            break;
          }
        }
        
        stackIndex++;
      }
      
      // set stack index for selected photo to length of array
      flannel[selectedPhotoIndex].stackOrder = flannel.length - 1;
    
    } else {
      flannel[selectedPhotoIndex].isZoomed = false;
    }
  }
}


