
// L-System Implementation for Generating tree-like graphic structures. 
// [ based on: http://en.wikipedia.org/wiki/L-system ]
// 12/10/2009
//static final String COMP_TITLE = "Plants From L-Systems"; 

PlantSystem sys;
boolean writeSystem = false;
String destinationFile = "nX.txt";
String axiom = "X";

PlantRenderer plant;
String BUILD_FILEPATH = "n7.txt";

int bg = color(0);

void setup() {
  size(800, 600);
  frameRate(8);
  //frame.setTitle(COMP_TITLE);
  background(bg);
  smooth();
  
  if(writeSystem) {
    sys = new PlantSystem(destinationFile, axiom);
    sys.updateTo(6);                              
    sys.draw();
    sys.finish();
  } else {
    plant = new PlantRenderer(BUILD_FILEPATH, new Point2D(width/2, height+500), radians(26), 5, 1f);
  }
}

void draw() {
  if(!writeSystem) {
    plant.draw();
  }
  noLoop();
}

void keyPressed() {
  switch(key) {
    
  case 's':
  case 'S':
    //saveFrame(COMP_TITLE + " -####.png");
    break;
  case ' ':
    redraw();
    break;  
  default:
    break;  

  }
}



