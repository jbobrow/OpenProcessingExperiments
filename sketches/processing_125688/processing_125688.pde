
//By: Chris Jimenez & Noris Onea
//Extra Credit Assignment
//Observational Astronomy
//Transit visualization
//last update: 12-15-13

import controlP5.*;

ControlP5 cp5;

//values that control size of canvas
int screenWidth = 900;
int screenHeight = (int)(0.75 * screenWidth);

//boolean value displays all text boxes and title
boolean showAll = true;

//for unique font used
PFont font;

//values used for visualizations
float mAngle = 0;
float mStarRadius;
float mOrbitalRadius;
float mPlanetRadius;

float angle = 0;

//STAR VALUES
float starMass = 0;
float starRadius = 0;

//EXOPLANET VALUES
float planetRadius = 0;
float orbitalRadius = 0;
float orbitalPeriod = 0;


//TRANSIT CALCULATIONS
float G = 6.67384E-11;//in N(m/kg)^2
float transitTime;
float brightnessDip;

//CONVERSION CALCULATIONS
// 1 solar mass = 1.9891E30 kg
float solarMasstoKg = 1.9891E30;
//1 SOlar radius = 696000 km
float solarRadiusToKm = 696000;
//1 AU = 149 597 871 km
float auToKm =149597871;


//==================================================================
void setup() {
  size(screenWidth, screenHeight, P3D);

  //unique font used for program
  font = loadFont("SynchroLET-48.vlw");

  //create new cp5 object
  cp5 = new ControlP5(this);

  displayForm();

  frameRate(30);
  smooth();
}//===============================================================


//==================================================================
//displays forms on the left
void displayForm() {

  //start button.................
  cp5.addBang("START")
    .setPosition(width - width/5 +48, 600)
      .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  //end of start button.................

  //input field for radius of star...............
  cp5.addTextfield("Radius of Star")
    .setPosition(width - width/5 +35, 275)
      .setSize(100, 20)
        .setAutoClear(false);
  //end of radius of star input field...................

  //input field for mass of star...............
  cp5.addTextfield("Mass of Star")
    .setPosition(width - width/5 +35, 335)
      .setSize(100, 20)
        .setAutoClear(false);
  //end mass of star input field...................

  //input field for radius of exoplanet....
  cp5.addTextfield("Radius of Exoplanet")
    .setPosition(width - width/5 +35, 395)
      .setSize(100, 20)
        .setAutoClear(false);
  //end radius of exoplanet input field.......

  //input field for orbital radius....
  cp5.addTextfield("Orbital radius of Exoplanet")
    .setPosition(width - width/5 +35, 455 )
      .setSize(100, 20)
        .setAutoClear(false)
          .setVisible(true);
  //end orbital radius input field.......
}//=================================================================


//===================================================================
//
void controlEvent(ControlEvent theEvent) {

  if (theEvent.controller().name()=="START") {
    starRadius = float(cp5.get(Textfield.class, "Radius of Star").getText());
    starMass = float(cp5.get(Textfield.class, "Mass of Star").getText());
    planetRadius = float(cp5.get(Textfield.class, "Radius of Exoplanet").getText());
    orbitalRadius = float(cp5.get(Textfield.class, "Orbital radius of Exoplanet").getText());
  }
}//=========================================================================


//==================================================================
//displays the graph in the middle
void displayStarAndPlanet() {

  //map all values for visualization
  //orbital period in years
  mAngle = map(orbitalPeriod*365, 0, 880, 5, 0);
  //star radius in solar radius units
  mStarRadius = map(starRadius, 0.1, 5, 150, 300);
  //orbital radius is in AU
  mOrbitalRadius = map(orbitalRadius, 0, 1, mStarRadius + 20, 400);
  //planet radius in km
  mPlanetRadius = map(planetRadius, 0, 1000000, 10, 50);

  //translate origin to draw spheres
  pushMatrix();
  //move the origin to specified location
  translate(width/2 - 90, height/2 - 30, 0);
  fill(255, 204, 0);
  rotateY(radians(angle));
  if(mAngle > 0){
  angle += mAngle;
  }else{
    angle++;
  }
  sphere(mStarRadius);
  translate(mOrbitalRadius, 0, 0);
  fill(255);
  noStroke();
  //this second sphere is the exoplanet that is transiting
  sphere(mPlanetRadius);
  popMatrix(); // put the origina back at the top left corner of the canvas
}//=================================================================

//==================================================================
//displays the graph in the middle
void displayGraph() {

  float graphW = 400;
  float graphH = 160;

  pushMatrix();
  translate(50, height - 200, 0);
  //transparent rectangle
  fill(255, 255, 255, 50);
  rect(0, 0, graphW, graphH);
  //fill for lines
  fill(255, 0, 0);

  //y axis start line
  line(0, 160, -10, 160);
  text("0.8", -40, 160);

  //x axis start line
  line(0, 160, 0, 170);
  text("0", 0, 170);

  //TITLES....................
  textSize(13);
  //rotate lumnisoty title
  pushMatrix();
  rotate(PI/2);
  //text("LUMINOSITY(FLUX)", 30, 40);
  popMatrix();

  //display time title
  text("TIME(DAYS)", 190, 180);
  //END OF TITLE.......................

  //POINTS FOR THE GRAPH
  textSize(11);
  //end of y axis
  line(400, 160, 400, 170);
  text(orbitalPeriod*365, 380, 175);
  //mark 1
  text("1.000", -40, 10);
  line(0, 10, -10, 10);

  //1.00 corresponds to 150 on graph
  //0.8 corresponds to 0 on graph
  //map dip
  float dip = map(brightnessDip, 0, 0.2, 10, 160);
  //mark dip
  line(0, dip, -10, dip);
  text(1.000 - brightnessDip, -45, dip);

  //map dt
  float dt = map(transitTime, 0, (orbitalPeriod*365), 0, graphW);
  //test
  noStroke();
  fill(0, 255, 0);
  stroke(0, 255, 0);
  ellipse(0, 10, 5, 5);
  line(0, 10, graphW/2 - dt, 10);
  ellipse(graphW/2 - dt, 10, 5, 5);
  line(graphW/2 - dt, 10, graphW/2 - dt, dip);
  ellipse(graphW/2 - dt, dip, 5, 5);
  line(graphW/2 - dt, dip, graphW/2 + dt, dip);
  ellipse(graphW/2 + dt, dip, 5, 5);
  line(graphW/2 + dt, dip, graphW/2 + dt, 10);
  ellipse(graphW/2 + dt, 10, 5, 5 );
  line(graphW/2 + dt, 10, graphW, 10);
  popMatrix();
}//=================================================================


//=========================================================================
//
void makeCalculations() {

  //calculated in years
  orbitalPeriod = sqrt(pow(orbitalRadius, 3)/starMass);

  //calculate brightness dip
  //convert solar radius to km
  brightnessDip = sq(planetRadius/(starRadius*solarRadiusToKm));


  //calculate transit time
  //radius in solar radius units
  //radius and orbit radius in km
  //period in days
  transitTime = 365 * ((orbitalPeriod)/PI)* ((starRadius*solarRadiusToKm)/(orbitalRadius*auToKm));
}//================================================================================

//================================================================
//
void displayData() {
  fill(255, 0, 0);
  noFill();
  stroke(255, 0, 0);
  rect(470, height - 200, 220, 160);
  line(570, height - 200, 570, height - 40);
  stroke(255, 0, 0, 100);
  for (int i = 0; i < 10;i++) {
    line(470, height - 200+(i*16), 690, height - 200 +(i*16));
  }

  //DATA!
  //text seperated by 16 pixels
  fill(0, 255, 0);
  text("SOLAR MASS ", 473, height - 188);
  text("SOLAR RADIUS", 473, height - 172);
  text("PLANET RADIUS", 473, height - 140);
  text("ORBITAL PERIOD", 473, height - 124);
  text("ORBITAL RADIUS", 473, height - 92);
  text("TRANSIT TIME", 473, height - 76);
  text("BRIGHTNESS DIP", 473, height - 60);
  text("RADIUS RATIO", 473, height - 44);

  text(starMass + " M", 573, height - 188);
  text(starRadius + " R", 573, height - 172);
  text((starRadius*solarRadiusToKm) + " KM", 573, height - 156);
  text(planetRadius + " KM", 573, height - 140);
  text(orbitalPeriod + " YRS", 573, height - 124);
  text(orbitalPeriod*365 + " DAYS", 573, height - 108);
  text(orbitalRadius + " AU", 573, height - 92);
  text(transitTime + " DAYS", 573, height - 76);
  text(brightnessDip, 573, height - 60);
  text(planetRadius/(starRadius*solarRadiusToKm), 573, height - 44);
}

//==================================================================
//displays title
void displayTitleAndSides() {
  fill(255);
  textSize(40);
  textFont(font);
  text("Transit of Exoplanets", width/2 - 370, 50);

  stroke(0, 191, 255);
  fill(0, 191, 255, 50);
  rect(width - width/5, 0, width, height);//right side area

  fill(255);
  textSize(12);
  text("Welcome to the exoplanet", width - 170, 40);
  text("simulator! Data values", width - 170, 55);
  text("will be displayed below", width - 170, 70);
  text("once you put in your", width-170, 85);
  text("values.", width-170, 100);

  //display solar radius unit
  text("R", width - width/5 +150, 290);
  ellipse(width - width/5 +160.0, 290, 5.0, 5.0);

  //display solar mass unit
  text("M", width - width/5 +150, 355);
  ellipse(width - width/5 +160.0, 355, 5.0, 5.0);

  //Let the Radius of Exoplanet always have KM
  text("KM", width - width/5 +150, 410);

  //Let the orbital radius be in km
  text("AU", width - width/5 +150, 470);
}//================================================================



//================================================================================
//draw() function
void draw() {
  background(0);

  makeCalculations();
  displayData();
  displayGraph();
  displayStarAndPlanet();

  if (showAll) {
    displayTitleAndSides();
  }
}



