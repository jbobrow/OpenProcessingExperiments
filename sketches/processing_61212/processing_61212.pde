
PShape usa;
PShape michigan;
PShape ohio;
PShape maine;
PShape newHampshire;
PShape vermont;
PShape massachusetts;
PShape newYork;
PShape pennsylvania;
PShape rhodeIsland;
PShape connecticut;
PShape newJersey;
PShape deleware;
PShape maryland;
PShape virginia;
PShape districtOfColumbia;
PShape westVirginia;
PShape kentucky;
PShape tennessee;
PShape arkansas;
PShape missouri;
PShape northCarolina;
PShape southCarolina;
PShape georgia;
PShape florida;
PShape alabama;
PShape mississippi;
PShape louisiana;
PShape arizona;
PShape texas;
PShape oklahoma;
PShape kansas;
PShape nebraska;
PShape southDakota;
PShape northDakota;
PShape montana;
PShape wyoming;
PShape idaho;
PShape utah;
PShape alaska;
PShape indiana;
PShape illinois;
PShape iowa;
PShape minnesota;
PShape wisconsin;
PShape newMexico;
PShape colorado;
PShape nevada;
PShape california;
PShape oregan;
PShape washington;
PShape hawaii;

PImage statecolors;

int x = 1100;
PFont fontA;

int MmouseX, MmouseY;

int strongDemAlpha = 255;
color strongDem = color(0, 51, 102, strongDemAlpha);

int weakDemAlpha = 255;
color weakDem = color(60, 150, 240, weakDemAlpha);

int barelyDemAlpha = 255;
color barelyDem = color(149, 203, 255, barelyDemAlpha);

int barelyRepAlpha = 255;
color barelyRep = color(240, 150, 150, barelyRepAlpha);

int weakRepAlpha = 255;
color weakRep = color(235, 42, 42, weakRepAlpha);

int strongRepAlpha = 255;
color strongRep = color(153, 0, 0, strongRepAlpha);


void setup() {
  size(640, 400);  
  usa = loadShape("usa-wikipedia.svg");
  michigan = usa.getChild("MI");
  ohio = usa.getChild("OH");
  maine = usa.getChild("ME");
  newHampshire = usa.getChild("NH");
  vermont = usa.getChild("VT");
  massachusetts = usa.getChild("MA");
  newYork = usa.getChild("NY");
  pennsylvania = usa.getChild("PA");
  rhodeIsland = usa.getChild("RI");
  connecticut = usa.getChild("CT");
  newJersey = usa.getChild("NJ");
  deleware = usa.getChild("DE");
  maryland = usa.getChild("MD");
  virginia = usa.getChild("VA");
  districtOfColumbia = usa.getChild("DC");
  westVirginia = usa.getChild("WV");  
  kentucky = usa.getChild("KY");
  tennessee = usa.getChild("TN");
  arkansas = usa.getChild("AR");
  missouri = usa.getChild("MO");
  northCarolina = usa.getChild("NC");
  southCarolina = usa.getChild("SC");
  georgia = usa.getChild("GA");
  florida = usa.getChild("FL");
  alabama = usa.getChild("AL");
  mississippi = usa.getChild("MS");
  louisiana = usa.getChild("LA");
  arizona = usa.getChild("AZ");
  texas = usa.getChild("TX");
  oklahoma = usa.getChild("OK");
  kansas = usa.getChild("KS");
  nebraska = usa.getChild("NE");
  southDakota = usa.getChild("SD");
  northDakota = usa.getChild("ND");
  montana = usa.getChild("MT");
  wyoming = usa.getChild("WY");
  idaho = usa.getChild("ID");
  utah = usa.getChild("UT");
  alaska = usa.getChild("AK");
  indiana = usa.getChild("IN");
  illinois = usa.getChild("IL");
  iowa = usa.getChild("IA");
  minnesota = usa.getChild("MN");
  wisconsin = usa.getChild("WI");
  newMexico = usa.getChild("NM");
  colorado = usa.getChild("CO");
  nevada = usa.getChild("NV");
  california = usa.getChild("CA");
  oregan = usa.getChild("OR");
  washington = usa.getChild("WA");
  hawaii = usa.getChild("HI");
  
  statecolors = loadImage("usa-wikipedia.jpg");
  image(statecolors, 10, 75);

  fontA = loadFont("Verdana-15.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 15);


  smooth();  
  //noLoop();
}

void draw() {
  scale (0.5, 0.5);  
  MmouseX = (int)2*mouseX;
  MmouseY = (int)2*mouseY;
  background(255);


  //fill(0);
  //text("x: "+MmouseX+" y: "+MmouseY, 50, 50);

  // Michigan
  michigan.disableStyle();
  fill(weakDem);
  noStroke();
  shape(michigan, 10, 75); 
  if (MmouseX > 634 && MmouseX < 707 && MmouseY > 194 && MmouseY < 277) {
  fill(0);
    text("50.3", 570, 700);
    text("39.0", 725, 700);
 }
 
  // Ohio
  ohio.disableStyle();
  fill(barelyDem);
  noStroke();
  shape(ohio, 10, 75);
  if (MmouseX > 676 && MmouseX < 736 && MmouseY > 286 && MmouseY < 337) {
  fill(0);
    text("45", 570, 700);
    text("41", 725, 700);
 }

  // Maine
  maine.disableStyle();
  fill(weakDem);
  noStroke();
  shape(maine, 10, 75);
  if (MmouseX > 883 && MmouseX < 936 && MmouseY > 114 && MmouseY < 209) {
  fill(0);
    text("55", 570, 700);
    text("37", 725, 700);
  }

  // New Hampshire
  newHampshire.disableStyle();
  fill(barelyDem);
  noStroke();
  shape(newHampshire, 10, 75);
  if (MmouseX > 871 && MmouseX < 889 && MmouseY > 169 && MmouseY < 218) {
  fill(0);
    text("46.5", 570, 700);
    text("43.0", 725, 700);
  }

  //Vermont 
  vermont.disableStyle();
  fill(strongDem);
  noStroke();
  shape(vermont, 10, 75);
  if (MmouseX > 846 && MmouseX < 865 && MmouseY > 182 && MmouseY < 227) {
  fill(0);
    text("58", 570, 700);
    text("33", 725, 700);
  }

  // Massachusetts
  massachusetts.disableStyle();
  fill(strongDem);
  noStroke();
  shape(massachusetts, 10, 75);
  if (MmouseX > 856 && MmouseX < 927 && MmouseY > 231 && MmouseY < 240) {
  fill(0);
    text("54.5", 570, 700);
    text("36.0", 725, 700);
  }

  // New York
  newYork.disableStyle();
  fill(strongDem);
  noStroke();
  shape(newYork, 10, 75);
  if (MmouseX > 766 && MmouseX < 855 && MmouseY > 195 && MmouseY < 247) {
  fill(0);
    text("58.3", 570, 700);
    text("33.3", 725, 700);
  }

  // Pennsylvania
  pennsylvania.disableStyle();
  fill(weakDem);
  noStroke();
  shape(pennsylvania, 10, 75);
  if (MmouseX > 751 && MmouseX < 833 && MmouseY > 273 && MmouseY < 300) {
  fill(0);
    text("46.0", 570, 700);
    text("39.0", 725, 700);
  }

  // Rhode Island 
  rhodeIsland.disableStyle();
  fill(strongDem);
  noStroke();
  shape(rhodeIsland, 10, 75);
  if (MmouseX > 883 && MmouseX < 893 && MmouseY > 242 && MmouseY < 249) {
  fill(0);
    text("54", 570, 700);
    text("37", 725, 700);
  }
  
  // Connecticut
  connecticut.disableStyle();
  fill(strongDem);
  noStroke();
  shape(connecticut, 10, 75);
  if (MmouseX > 856 && MmouseX < 883 && MmouseY > 247 && MmouseY < 260) {
  fill(0);
    text("53", 570, 700);
    text("37", 725, 700);
  }

  // New Jersey
  newJersey.disableStyle();
  fill(weakDem);
  noStroke();
  shape(newJersey, 10, 75);
  if (MmouseX > 841 && MmouseX < 859 && MmouseY > 266 && MmouseY < 312) {
  fill(0);
    text("50.3", 570, 700);
    text("38.3", 725, 700);
  }

  // Deleware
  deleware.disableStyle();
  fill(strongDem);
  noStroke();
  shape(deleware, 10, 75);
  if (MmouseX > 835 && MmouseX < 850 && MmouseY > 310 && MmouseY < 329) {
  fill(0);
    //text("", 570, 700);
    //text("", 725, 700);
  }

  // Maryland
  maryland.disableStyle();
  fill(strongDem);
  noStroke();
  shape(maryland, 10, 75);
  if (MmouseX > 799 && MmouseX < 838 && MmouseY > 311 && MmouseY < 336) {
  fill(0);
    //text("50.3", 570, 700);
    //text("38.3", 725, 700);
  }

  // Virginia
  virginia.disableStyle();
  fill(barelyDem);
  noStroke();
  shape(virginia, 10, 75);
  if (MmouseX > 774 && MmouseX < 843 && MmouseY > 343 && MmouseY < 370) {
  fill(0);
    text("47.5", 570, 700);
    text("44.3", 725, 700);
  }

  // Washington D.C
  districtOfColumbia.disableStyle();
  fill(strongDem);
  noStroke();
  shape(districtOfColumbia, 10, 75);

  // West Virginia
  westVirginia.disableStyle();
  fill(strongRep);
  noStroke();
  shape(westVirginia, 10, 75);
  if (MmouseX > 741 && MmouseX < 767 && MmouseY > 328 && MmouseY < 364) {
  fill(0);
    text("33", 570, 700);
    text("54", 725, 700);
  }

  // Kentucky
  kentucky.disableStyle();
  fill(weakRep);
  noStroke();
  shape(kentucky, 10, 75);
  if (MmouseX > 631 && MmouseX < 719 && MmouseY > 378 && MmouseY < 390) {
  fill(0);
    text("40", 570, 700);
    text("48", 725, 700);
  }

  // Tennessee
  tennessee.disableStyle();
  fill(weakRep);
  noStroke();
  shape(tennessee, 10, 75);
  if (MmouseX > 609 && MmouseX < 703 && MmouseY > 407 && MmouseY < 428) {
  fill(0);
    text("41", 570, 700);
    text("47", 725, 700);
  }

  // Arkansas
  arkansas.disableStyle();
  fill(strongRep);
  noStroke();
  shape(arkansas, 10, 75);

  

  // Missouri
  missouri.disableStyle();
  fill(weakRep);
  noStroke();
  shape(missouri, 10, 75);
  

  // North Carolina
  northCarolina.disableStyle();
  fill(barelyDem);
  noStroke();
  shape(northCarolina, 10, 75);
  

  // South Carolina
  southCarolina.disableStyle();
  fill(weakRep);
  noStroke();
  shape(southCarolina, 10, 75);

  // Georgia
  georgia.disableStyle();
  fill(weakRep);
  noStroke();
  shape(georgia, 10, 75);

  // Florida
  florida.disableStyle();
  fill(barelyDem);
  noStroke();
  shape(florida, 10, 75);

  // Alabama
  alabama.disableStyle();
  fill(strongRep);
  noStroke();
  shape(alabama, 10, 75);

  // Mississippi
  mississippi.disableStyle();
  fill(strongRep);
  noStroke();
  shape(mississippi, 10, 75);

  // Lousiana
  louisiana.disableStyle();
  fill(strongRep);
  noStroke();
  shape(louisiana, 10, 75);

  // Arizona
  arizona.disableStyle();
  fill(barelyRep);
  noStroke();
  shape(arizona, 10, 75);

  // Texas
  texas.disableStyle();
  fill(strongRep);
  noStroke();
  shape(texas, 10, 75);
if (MmouseX > 368 && MmouseX < 530 && MmouseY > 459 && MmouseY < 604) {
  fill(0);
    text("43", 570, 700);
    text("50", 725, 700);
  }
  
  // Oklahoma
  oklahoma.disableStyle();
  fill(strongRep);
  noStroke();
  shape(oklahoma, 10, 75);

  // Kansas
  kansas.disableStyle();
  fill(strongRep);
  noStroke();
  shape(kansas, 10, 75);

  // Nebraska
  nebraska.disableStyle();
  fill(strongRep);
  noStroke();
  shape(nebraska, 10, 75);

  // South Dakota
  southDakota.disableStyle();
  fill(weakRep);
  noStroke();
  shape(southDakota, 10, 75);

  // North Dakota
  northDakota.disableStyle();
  fill(weakRep);
  noStroke();
  shape(northDakota, 10, 75);

  // Montana
  montana.disableStyle();
  fill(barelyRep);
  noStroke();
  shape(montana, 10, 75);

  // Wyoming
  wyoming.disableStyle();
  fill(strongRep);
  noStroke();
  shape(wyoming, 10, 75);

  // Idaho
  idaho.disableStyle();
  fill(strongRep);
  noStroke();
  shape(idaho, 10, 75);

  // Utah
  utah.disableStyle();
  fill(strongRep);
  noStroke();
  shape(utah, 10, 75);

  // Alaska
  alaska.disableStyle();
  fill(strongRep);
  noStroke();
  shape(alaska, 10, 75);

  // Indiana
  indiana.disableStyle();
  fill(weakRep);
  noStroke();
  shape(indiana, 10, 75);
  //if MmouseX 

  // Illinois
  illinois.disableStyle();
  fill(strongDem);
  noStroke();
  shape(illinois, 10, 75);

  // Iowa
  iowa.disableStyle();
  fill(barelyDem);
  noStroke();
  shape(iowa, 10, 75);

  // Minnesota
  minnesota.disableStyle();
  fill(weakDem);
  noStroke();
  shape(minnesota, 10, 75);

  // Wisconsin
  wisconsin.disableStyle();
  fill(weakDem);
  noStroke();
  shape(wisconsin, 10, 75);

  // New Mexico
  newMexico.disableStyle();
  fill(strongDem);
  noStroke();
  shape(newMexico, 10, 75);

  // Colorado
  colorado.disableStyle();
  fill(weakDem);
  noStroke();
  shape(colorado, 10, 75);

  // Nevada
  nevada.disableStyle();
  fill(weakDem);
  noStroke();
  shape(nevada, 10, 75);

  // California
  california.disableStyle();
  fill(strongDem);
  noStroke();
  shape(california, 10, 75);
  if (MmouseX > 41 && MmouseX < 124 && MmouseY > 307 && MmouseY < 454) {
  fill(0);
    text("57.8", 570, 700);
    text("34.3", 725, 700);
  }

  // Oregan
  oregan.disableStyle();
  fill(weakDem);
  noStroke();
  shape(oregan, 10, 75);

  // Washington
  washington.disableStyle();
  fill(strongDem);
  noStroke();
  shape(washington, 10, 75);

  // Hawaii
  hawaii.disableStyle();
  fill(strongDem);
  noStroke();
  shape(hawaii, 10, 75);

  
  // Color Scale

  // Strong Dem
  fill(0, 51, 102);
  rect(1095, 587, 150, 25);

  //Weak Dem
  fill(60, 150, 240);
  rect(1095, 612, 150, 25);

  //Barely Dem
  fill(149, 203, 255);
  rect(1095, 637, 150, 25);

  //Barely Rep
  fill(240, 150, 150);
  rect(1095, 662, 150, 25);

  //Weak Rep
  fill(235, 42, 42);
  rect(1095, 687, 150, 25);


  //Strong Rep
  fill(153, 0, 0);
  rect(1095, 712, 150, 25);


  fill(0);
  text("Strong Democratic", x, 605);
  text("Weak Democratic", x, 630); 
  text("Barely Democratic", x, 655);
  text("Barely Repuplican", x, 680);
  text("Weak Repuplican", x, 705);
  text("Strong Repuplican", x, 730);
  
  text("2012 Presidential Election Predictions", 500, 50);
  text("Obama:", 500, 700);
  text("Romney:", 650, 700);
  
  text("Click to Select a Category", 875, 730);
}


void mousePressed() {
 
  //Strong Rep
  if (MmouseX > 1095 && MmouseX < 1095+150 && MmouseY > 712 && MmouseY < 712+25) {
    strongRepAlpha = 255;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 25;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 25;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 25;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 25;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 25;
    weakRep = color(235, 42, 42, weakRepAlpha);
  } 
   
   
  //Weak Rep
  else if (MmouseX > 1095 && MmouseX < 1095+150 && MmouseY > 687 && MmouseY < 687+25) {
    strongRepAlpha = 25;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 25;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 25;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 25;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 25;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 255;
    weakRep = color(235, 42, 42, weakRepAlpha);
  }
  
  //Barley Rep
  else if (MmouseX > 1095 && MmouseX < 1095+150 && MmouseY > 662 && MmouseY < 662+25) {
    strongRepAlpha = 25;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 25;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 25;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 25;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 255;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 25;
    weakRep = color(235, 42, 42, weakRepAlpha);
  }
  
    //Barley Dem
  else if (MmouseX > 1095 && MmouseX < 1095+150 && MmouseY > 637 && MmouseY < 637+25) {
    strongRepAlpha = 25;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 25;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 25;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 255;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 25;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 25;
    weakRep = color(235, 42, 42, weakRepAlpha);
  }
  
  //Weak Dem
  else if (MmouseX > 1095 && MmouseX < 1095+150 && MmouseY > 612 && MmouseY < 612+25) {
    strongRepAlpha = 25;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 25;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 255;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 25;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 25;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 25;
    weakRep = color(235, 42, 42, weakRepAlpha);
  }
  
   //Strong Dem
  else if (MmouseX > 1095 && MmouseX < 1095+150 && MmouseY > 587 && MmouseY < 587+25) {
    strongRepAlpha = 25;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 255;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 25;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 25;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 25;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 25;
    weakRep = color(235, 42, 42, weakRepAlpha);
  }

  //Normal Map
   else {   
    strongRepAlpha = 255;
    strongRep = color(153, 0, 0, strongRepAlpha);
    strongDemAlpha = 255;
    strongDem = color(0, 51, 102, strongDemAlpha);
    weakDemAlpha = 255;
    weakDem = color(60, 150, 240, weakDemAlpha);
    barelyDemAlpha = 255;
    barelyDem = color(149, 203, 255, barelyDemAlpha);
    barelyRepAlpha = 255;
    barelyRep = color(240, 150, 150, barelyRepAlpha);
    weakRepAlpha = 255;
    weakRep = color(235, 42, 42, weakRepAlpha);
  } 
}

