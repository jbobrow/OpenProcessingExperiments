

//Graphic breakdown of multi day routes throughout the city of Medellin, Colombia. 
//Routes are hand-drawn for aesthetic effect, and so are also loaded as a SVG file. 
// Improvements
//control row in numCol dynamically instead of adjusting value every time a new day is added. 

PFont font;
PShape days;
PShape[] routes;
int numDays; //count number of days


String[] dayName;


int selectedRoute= 0;

//Some variables for graph
int selDay = 1;
int numCols = 14;
int displayDay;


int marginX = 5;
int firstDay = 1;


void setup() {
  size(800, 575);
  font = createFont("Arial",36); 
  //load the map
  days = loadShape("days.svg");

  parseMap();

  smooth();
}

void draw() {
  background(60);
  drawRef();
  drawMap();
  drawRoutes();
  drawUI();
}

void parseMap() {
  numDays = days.getChildCount(); //count number of Child routes
  routes = new PShape[numDays];
  dayName = new String [numDays];

  //make route object
  for(int i = 0; i < numDays; i++) {
    routes[i] = days.getChild(i);
    dayName[i] = routes[i].getName();
  }
}



void drawRoutes() {
  for (int i = 0; i< numDays; i++) {
    //disable style to allow for creation in processing
    routes[i].disableStyle();
    stroke(220);
    strokeWeight(.25);
    fill(170);
    shape(routes[selectedRoute]);
  }
}
void drawMap() {
  days = loadShape("days.svg");
  shape(days, 0, 0);
}
void drawUI() {
  textFont(font, 14);
  fill(220);
  textAlign(CENTER);
  float dayX = marginX + (((width-2*marginX)*selDay)/(numCols-1));
  text("Days:", 25, 19);
  text(selDay+firstDay-1, dayX, 20);
  //strokeWeight(2);
  //stroke(200);
  //line( dayX, 15, dayX, 10); 
  //draw the line chart of total visitors
  stroke(200);
  noFill();
  beginShape();
}
void keyPressed() {
  displayDay = selDay + firstDay;

  if (keyCode == RIGHT) {
    if (selDay == numCols-2) selDay = 1;
    else if (selDay < numCols-2) selDay = selDay+1;  //when moving right don't go further than num years
    selectedRoute= (selDay-1)%numDays;
  }
  else if (keyCode == LEFT) {                //when moving left don't go further than first year
    if (selDay == 1) selDay = numCols-2;
    else if (selDay > 1) selDay = selDay -1;
    selectedRoute= (selDay-1)%numDays;
  }
}
void drawRef() {
  //write the references information
  noStroke();
  textFont(font,12);
  fill(200);
  textAlign(LEFT);
  text("Use Left and Right Arrow Keys to cycle through Days", 10, height-15);
  text("N >", 750, height-15);
}



