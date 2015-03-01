

// principal of recall 

boolean button = false;
PFont poopfont;
PShape poopshape;

void setup() {
  smooth(8);
  size(640, 844);
  background(0);
}

void draw() {
  
  shapeMode(CENTER);

  // on shape
  
  smooth(8);
  poopshape = loadShape("on.svg");
  shape(poopshape, width/2-110, height/2);

  // on shape 2

 smooth(8);
  poopshape = loadShape("off.svg");
  shape(poopshape, width/2+110, height/2);
 
 
}

// click on 

void mouseClicked() {
  
  float d = dist(mouseX, mouseY, width/2-110, height/2);
  if (d<=155) {
    if (button == false) {
      button = true;
      background(255);
      } else if (button == true) {
      button = false;
      background(255);
         
    }
  }
  
  // click off
  
  float d2 = dist(mouseX, mouseY, width/2+110, height/2);
  if (d2<=155) {
    if (button == false) {
      button = true;
      background(0);
    } else if (button == false) {
      button = true;
      background(255);
    }
  
}
}


