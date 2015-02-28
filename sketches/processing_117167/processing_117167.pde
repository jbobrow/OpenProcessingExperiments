

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
int numCols = 86;
int displayDay;


float marginX = .5;
int firstDay = 1;

ExpandingCircle circle;

void setup() {
  size(1024, 600);
  font = createFont("Arial",36); 
  //load the map
  days = loadShape("days.svg");
  parseMap();
  circle = new ExpandingCircle();

  smooth();
}

void draw() {
  background(225);
  circle.update();
  circle.CasaTresPatios();
  circle.EstacionP();
  circle.BlackSheep();
  circle.Campos();
  circle.BibliotecaEsp();
  circle.Periodista();
  circle.ParqueEnv();
  circle.mamm();
  circle.deseos();
  circle.paisa();
  circle.bus();
  circle.SonHabana();
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
    stroke(255, 220, 0);
    strokeWeight(.25);
    //fill(170);
    shape(routes[selectedRoute]);
  }
}
void drawMap() {
  for (int i = 0; i< numDays; i++) {
    noFill();
    stroke(0); 
    shape(routes[i]);
  }
}
void drawUI() {
  fill(225);
  noStroke();
  rect(0,0, width, 30);
  textFont(font, 14);
  fill(0);
  textAlign(CENTER);
  float dayX = 35 + (((width-60*marginX)*selDay)/(numCols-1));
  text("Days:", 25, 19);
  text(selDay+firstDay-1, dayX, 20);
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
//  noStroke();
//  textFont(font,12);
//  fill(0);
//  textAlign(LEFT);
//  text("Use Left and Right Arrow Keys to cycle through Days", 10, height-15);
//  text("N >", 980, height-15);
}


class ExpandingCircle {

  ExpandingCircle(){
  }
  
  void update() {
    noStroke();
    textFont(font,14);
    fill(225);
    rect(0, height-40, width, 40);
  }
  
  void CasaTresPatios() {
  fill(0, 109, 127);
  textAlign(LEFT);
  text("Casa Tres Patios", 15, height-30);
  ellipseMode(CENTER);
  ellipse(560, 238, selDay*15, selDay*15);
  }
  void EstacionP() {
    if (selDay > 2){
      fill(142, 32, 74);
      textAlign(LEFT);
      text("Estacion Poblado", 15, height-10);
      ellipseMode(CENTER);
      ellipse(348, 246, (selDay-2)*5, (selDay-2)*5);
    }  
  }
  void deseos() {
    if (selDay > 4){
      fill(193, 33, 95);
      textAlign(LEFT);
      text("Parque Deseos", 150, height-10);
      ellipseMode(CENTER);
      ellipse(584, 210, (selDay-2)*2,(selDay-2)*2);
    }
  }
  void mamm() {
    if (selDay > 4){
      fill(11, 155, 190);
      textAlign(LEFT);
      text("MAMM", 150, height-30);
      ellipseMode(CENTER);
      ellipse(396, 243, selDay,selDay);
    }
  }
    void paisa() {
    if (selDay > 7){
      fill(0, 196, 216);
      textAlign(LEFT);
      text("Wandering Paisa", 225, height-30);
      ellipseMode(CENTER);
      ellipse(477, 153, (selDay-6),(selDay-6));
    }
  }  
   void Campos() {
    if (selDay > 8){
      fill(23,226,226);
      textAlign(LEFT);
      text("Campos De Gutierrez", 355, height-30);
      ellipseMode(CENTER);
      ellipse(517, 445, (selDay-7)*3, (selDay-7)*3);
    }
  }
  void ParqueEnv() {
    if (selDay > 11) {
      fill(204, 62, 120);
      textAlign(LEFT);
      text("Parque Envigado", 275, height-10);
      ellipseMode(CENTER);
      ellipse(162, 274, 10+((selDay)*.3), 10+((selDay)*.3));
    }
   }
    void BlackSheep() {
      if (selDay > 14){
        fill(62,204,177);
        textAlign(LEFT);
        text("The Black Sheep", 515, height-30);
        ellipseMode(CENTER);
        ellipse(335, 270, (selDay-13)*3, (selDay-13)*3);
      }
    }
    void Periodista() {
      if (selDay > 17){
        fill(216, 68, 103);
        textAlign(LEFT);
        text("Parque Periodista", 410, height-10);
        ellipseMode(CENTER);
        ellipse(517, 256, (selDay-16)*5,(selDay-16)*5);
      }
  }
   void bus() {
    if (selDay > 24){
      fill(229, 23, 92);
      textAlign(LEFT);
      text("Terminal Norte", 550, height-10);
      ellipseMode(CENTER);
      ellipse(620, 173, (selDay-6)*.5,(selDay-6)*.5);
    }
   }
       void SonHabana() {
    if (selDay > 26){
      fill(107, 178, 164);
      textAlign(LEFT);
      text("Son Habana", 640, height-30);
      ellipseMode(CENTER);
      ellipse(475, 135, (selDay-6)*.5,(selDay-6)*.5);
    }
  }
     void BibliotecaEsp() {
    if (selDay > 54){
      fill(242, 48, 127);
      textAlign(LEFT);
      text("Biblioteca España", 670, height-10);
      ellipseMode(CENTER);
      ellipse(722, 261, 10, 10);
    }
  }

//    if (selDay > 51){
//      ellipse(162, 274, 20,20);
//    }
  }

 
 


