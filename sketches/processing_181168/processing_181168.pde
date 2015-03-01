
String kingdomFeatures[]; //this array contains data on the names of each characteristic of the kingdom i.e. Kingdom Age, Population, etc. //<>//
int kingdomValues[]; //this array contains data on the values of each characteristic of the kingdom

PImage villagebuttons[] = new PImage[4]; //this array contains the image sprites of the village highlight button
PImage townbuttons[] = new PImage[4]; //this array contains the image sprites of the town highlight button
PImage citybuttons[] = new PImage[4]; //this array contains the image sprites of the city highlight button
PImage resetbuttons[] = new PImage[2]; //this array contains the image sprites of the rest button
PImage savebuttons[] = new PImage[3]; //this array contains the image sprites for the save buttons

float[] villageXRandomPlacement; //this array contains all the randomly generated x positions of the villages
float[] villageYRandomPlacement; //this array contains all the randomly generated y positions of the villages

float[] townXRandomPlacement; //this array contains all the randomly generated x positions of the towns
float[] townYRandomPlacement; //this array contains all the randomly generated y position of the towns

float[] cityXRandomPlacement; //this array contains all the randomly generated x positions of the cities
float[] cityYRandomPlacement; //this array contains all the randomly generated y positions of the cities

float[] LcityXRandomPlacement; //this array contains all the randomly generated x positions of the large cities
float[] LcityYRandomPlacement; //this array contains all the randomly generated y position of the large cities

PFont header; //the Kingdom title font
PFont font; //the kingdom features and values font

boolean Saved; // this boolean will check to see if the map has been saved or not
boolean villageHighlight = false; //this boolean will check to see if the villages are highlighted or not
boolean townHighlight = false; //this boolean will check to see if the towns are highlighted or not
boolean cityHighlight = false; //this boolean will check to see if the cities and large cities are highlight or not

float regionX; //this is the x position of the corner of the initial region grid rectangle
float regionY; //this is the y position of the corner of the initial region grid rectangle
float regionWidthScaled; //this is the amount in which the grid width is scaled in relation to the width of the kingdom

String[] kingdomNames; //this array contains all the possible names that may be chosen randomly to be the kingdom name
String kingdomName; //this is the randomly generated name of the Kingdom


Table table; //this is the table that is exported to the .csv file

void setup() {
  size(900, 620); 
  imageMode(CENTER);
  Saved =false; //the save value is initially false to ensure nothing is saved
  kingdomFeatures = loadStrings("Kingdom_Features.txt"); //initialization of the names of the kingdom characteristics from text file
  kingdomValues = new int[kingdomFeatures.length]; //creation of the kingdom value array equating size equal to size of the kingdom characteristics array
  kingdomNames = loadStrings("Kingdom_Name.txt"); //initialization of the kingdom names from text file
  kingdomName = kingdomNames[int(random(0, kingdomNames.length))];  //the selection of randomly selected kingdom name
  frame.setTitle("Random Kingdom Generator - " +kingdomName); //changes the frame title to the randomly selected kingdom name



  header = loadFont("TrajanPro3-Bold-50.vlw"); //loads the header font
  font = loadFont("SansSerif-12.vlw"); //loads the regular font

    villageTownCityValues(); //declares all the Village, Town and City button sprite arrays
  kingdomValueEquations(); //declares, equates, and executes the randomly generated kingdom values, and equates subsequent related values



    resetbuttonValue(); //declares the reset button sprite arrays
  savebuttonValue(); //declares the save button sprite arrays

  regionWidthScaled = 500/sqrt (kingdomValues[5]); //scales the width of the regions to fit within a 500 pixel square
  regionX = 2*(width/3)-275; //positions the x-origin of the first region in the top corner of the map
  regionY = height/2-250; //positions the y-origin of the first region in the top corner of the map

  villageXRandomPlacement = new float[kingdomValues[17]]; //create the length of the arrays the x position of all the village markers
  villageYRandomPlacement = new float[kingdomValues[17]]; //create the length of the arraysthe y position of the all the village marker

  townXRandomPlacement = new float[kingdomValues[18]]; //create the length of the arrays the x position of all the town markers
  townYRandomPlacement = new float[kingdomValues[18]]; //create the length of the arrays the y position of all the town markers

  cityXRandomPlacement = new float[kingdomValues[19]]; //create the length of the arrays the x position of all the city markers
  cityYRandomPlacement = new float[kingdomValues[19]]; //create the length of the arrays the y position of all the city markers

  LcityXRandomPlacement = new float[kingdomValues[20]]; //create the length of the arrays the x position of all the large city markers
  LcityYRandomPlacement = new float[kingdomValues[20]]; //create the length of the arrays the y position of all the large city markers


  for (int i=0; i<villageXRandomPlacement.length; i++) {
    villageXRandomPlacement[i] = random(regionX, regionX+500); //sets the x position of all the village markers
    villageYRandomPlacement[i] = random(regionY, regionY+500); //set the y position of all the village markers
  }
  for (int i=0; i<townXRandomPlacement.length; i++) {
    townXRandomPlacement[i] = random(regionX, regionX+500); //set the x position of all the town markers
    townYRandomPlacement[i] = random(regionY, regionY+500); //set the y position of all the town markers
  }
  for (int i=0; i<cityXRandomPlacement.length; i++) {
    cityXRandomPlacement[i] = random(regionX, regionX+500); //set the x position of all the city markers
    cityYRandomPlacement[i] = random(regionY, regionY+500); //set the y position of all the city markers
  }
  for (int i=0; i<LcityXRandomPlacement.length; i++) {
    LcityXRandomPlacement[i] = random(regionX, regionX+500); //set the x position of all the city markers
    LcityYRandomPlacement[i] = random(regionY, regionY+500); //set the y position of all the city markers
  }

  table = new Table(); //initialize and create the table

  TableRow newRow = table.addRow(); //initialize the second row of the table
  for (int i =0; i<kingdomValues.length; i++) {
    table.addColumn(kingdomFeatures[i]); //contructs the columns and inputs the characteristic names as the data values
    newRow.setInt(kingdomFeatures[i], kingdomValues[i]); //contructs the row and inputs the values as the data values
  }
}

void draw() {
  background(255); //white
  mapDropShadow(); //draw the map's box and drop shadow of the box
  drawGrid(); //draws the grid of the map
  VillageTownCityButtonHitTests(); //draws the highlight buttons for the villages, towns, and cities, as well as conducts hittests in addition to switching highlight booleans to true if mouse is pressed
  kingdomHeader(kingdomName, regionX+250, regionY-12.5); //writes the kingdom name above the map 
  drawKingdomFeatures();  //writes/draws the kingdom characteristic names to the left of the map
  drawVillagesTownsCitiesLCities(); //writes/draw the kingdom values to the left of the map
  SaveButtonHitTest(); //draw the save button as well as conducts hittests in addition to switching the save boolean to true if mouse pressed as well as saving a png and csv file
  resetButtonHitTest(); //creates a new map
}

//write/draw the kingdom characteristics and respective values
void drawKingdomFeatures() {
  float kingdomFeatureX = 210;
  float kingdomFeatureY = 90;
  float kingdomFeatureSpacing = 20;
  for (int i = 0; i<kingdomFeatures.length; i++) {
    textFont(font, 12);
    textAlign(RIGHT);
    text(kingdomFeatures[i], kingdomFeatureX, i*kingdomFeatureSpacing+kingdomFeatureY); //kingdom characteristics
    textAlign(LEFT);
    text(kingdomValues[i], kingdomFeatureX+10, i*kingdomFeatureSpacing+kingdomFeatureY); //kingdom values
  }
}

//draws the map grid
void drawGrid() {
  //draws the regional grid
  for (int x = 0; x < sqrt (kingdomValues[5]); x++ ) {
    for (int y = 0; y< sqrt (kingdomValues[5]); y++) {
      stroke(240);
      noFill();
      rect(regionX+x*regionWidthScaled, regionY+y*regionWidthScaled, regionWidthScaled, regionWidthScaled); //Regional Grid
    }
  }
}

//draws the village town and city markers
void drawVillagesTownsCitiesLCities() {
  for (int i=0; i<villageXRandomPlacement.length; i++) {
    createVillages(villageXRandomPlacement[i], villageYRandomPlacement[i]); //draws a village marker at a random point
  }
  for (int i=0; i<townXRandomPlacement.length; i++) {
    createTowns(townXRandomPlacement[i], townYRandomPlacement[i]); //draws a town marker at a random point
  }
  for (int i=0; i<cityXRandomPlacement.length; i++) {
    createCities(cityXRandomPlacement[i], cityYRandomPlacement[i]); //draws a city marker at a random point
  }
  for (int i=0; i<LcityXRandomPlacement.length; i++) {
    createLargeCities(LcityXRandomPlacement[i], LcityYRandomPlacement[i]); //draws a large city marker at a random point
  }
}

//draws save button, checks for hit tests, saves png and csv
void SaveButtonHitTest() {
  float buttonSize = 30;
  float buttonX =  2*(width/3)+180+buttonSize;
  float buttonY =  height/2+250+buttonSize;
  
  imageMode(CENTER);
  rectMode(CENTER);

//hit tests
  if (rectHitTest(mouseX, mouseY, buttonX, buttonY, buttonSize, buttonSize) == true) {
    if (mousePressed) {
      if (Saved == false) {
        image(savebuttons[2], buttonX, buttonY, buttonSize, buttonSize); //set sprite to checkmark "saved" sprite
        PImage img  =get(int(regionX)-5, 0, 510, height-55); //sets image-to-be-saved's region to over the map
        img.save(kingdomName+".png"); //saves a png of the map
        saveTable(table, kingdomName+".csv"); //saves the table to a csv file. ->this can later be used to make an excel spreadsheet with the map image
        
        textAlign(RIGHT);
        text("Files have been saved and are in the Sketch folder", buttonX-75,buttonY+5);
        textAlign(LEFT);
        
        Saved = true; //the save has been conducted and no saves can be made afterward
      }
    } else if (!mousePressed) {
      if (Saved == false) {
        image(savebuttons[1], buttonX, buttonY, buttonSize, buttonSize); //set sprite to down
      } else {
        image(savebuttons[2], buttonX, buttonY, buttonSize, buttonSize); //set sprite to saved
        textAlign(RIGHT);
        text("Files have been saved and are in the Sketch folder", buttonX-75,buttonY+5);
        textAlign(LEFT);
      }
    }
  } else {
    if (Saved == false) {
      image(savebuttons[0], buttonX, buttonY, buttonSize, buttonSize); //set sprite to up
    } else {
      image(savebuttons[2], buttonX, buttonY, buttonSize, buttonSize); //set sprite to saved
    }
  }

  rectMode(CORNER);
  textAlign(CORNER);
}


void resetButtonHitTest() {

  float buttonSize = 30;
  float buttonX =  2*(width/3)+143+buttonSize;
  float buttonY =  height/2+250+buttonSize;
  imageMode(CENTER);
  rectMode(CENTER);

  if (rectHitTest(mouseX, mouseY, buttonX, buttonY, buttonSize, buttonSize) == true) {
    if (mousePressed) {
      image(resetbuttons[1], buttonX, buttonY, buttonSize, buttonSize); //set sprite to down

      setup(); //restart program
    } else if (!mousePressed) {
      image(resetbuttons[1], buttonX, buttonY, buttonSize, buttonSize); //set sprite to down
    }
  } else {

    image(resetbuttons[0], buttonX, buttonY, buttonSize, buttonSize); //set sprite to up
  } 
  
  rectMode(CORNER);
  textAlign(CORNER);
}






void VillageTownCityButtonHitTests() {

  float buttonSize = 30;
  float villagebuttonX =  2*(width/3)-250+buttonSize-buttonSize-buttonSize/4;
  float townbuttonX =  2*(width/3)-250+buttonSize;
  float citybuttonX =  2*(width/3)-250+buttonSize+buttonSize+buttonSize/4;
  float allbuttonY = height/2+250+buttonSize;

  rectMode(CENTER);

  //village
  if (rectHitTest(mouseX, mouseY, villagebuttonX, allbuttonY, buttonSize, buttonSize) == true) {
    if (mousePressed) {
      if (villageHighlight ==false) {
        villageHighlight=true; //sets highlight to true subsequently highlighlighting the villages
        image(villagebuttons[3], villagebuttonX, allbuttonY, buttonSize, buttonSize); //set sprite to "X" up
      } else if (villageHighlight ==true) {
        villageHighlight=false; //set highlight to false subsequently unhighlighting the villages
        image(villagebuttons[2], villagebuttonX, allbuttonY, buttonSize, buttonSize); //set sprite to "X" down
      }
    } else if (!mousePressed) {
      if (villageHighlight ==false) {
        image(villagebuttons[1], villagebuttonX, allbuttonY, buttonSize, buttonSize); //set sprite to "O" down
      } else { 
        image(villagebuttons[2], villagebuttonX, allbuttonY, buttonSize, buttonSize); //set sprite to "X" down
      }
    }
  } else if (villageHighlight ==false) {
    image(villagebuttons[0], villagebuttonX, allbuttonY, buttonSize, buttonSize); //set to sprite to "O" up
  } else {
    image(villagebuttons[3], villagebuttonX, allbuttonY, buttonSize, buttonSize); //set sprite to "X" up
  }
  //towns
  if (rectHitTest(mouseX, mouseY, townbuttonX, allbuttonY, buttonSize, buttonSize) == true) {

    if (mousePressed) {
      if (townHighlight ==false) {
        townHighlight=true;//sets highlight to true subsequently highlighlighting the towns
        image(townbuttons[3], townbuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" up
      } else if (townHighlight ==true) {
        townHighlight =false;//set highlight to false subsequently unhighlighting the towns
        image(townbuttons[2], townbuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" down
      }
    } else if (!mousePressed) {
      if (townHighlight == false) {
        image(townbuttons[1], townbuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "O" down
      } else {
        image(townbuttons[2], townbuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" down
      }
    }
  } else if (townHighlight == false) {
    image(townbuttons[0], townbuttonX, allbuttonY, buttonSize, buttonSize);//set to sprite to "O" up
  } else {
    image(townbuttons[3], townbuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" up
  }

  //cities
  if (rectHitTest(mouseX, mouseY, citybuttonX, allbuttonY, buttonSize, buttonSize) == true) {
    if (mousePressed) {
      if (cityHighlight ==false) {
        cityHighlight=true;//sets highlight to true subsequently highlighlighting the city and large cities
        image(citybuttons[3], citybuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" up
      } else if (cityHighlight ==true) {
        cityHighlight=false;//set highlight to false subsequently unhighlighting the city and large cities
        image(citybuttons[2], citybuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" down
      }
    } else if (!mousePressed) {
      if (cityHighlight ==false) {
        image(citybuttons[1], citybuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "X" down
      } else {
        image(citybuttons[2], citybuttonX, allbuttonY, buttonSize, buttonSize);//set sprite to "O" down
      }
    }
  } else if (cityHighlight ==false) {
    image(citybuttons[0], citybuttonX, allbuttonY, buttonSize, buttonSize);//set to sprite to "O" up
  } else {
    image(citybuttons[3], citybuttonX, allbuttonY, buttonSize, buttonSize);//set to sprite to "X" up
  }
  rectMode(CORNER);
}



void createVillages(float x, float y) {
  if (villageHighlight == true) {
    stroke(#f44336); //redish
    strokeWeight(1); 
  } else {
    stroke(0); //black
    strokeWeight(0.5);
  }
  point(x, y); //village marker
  strokeWeight(1);
}
void createTowns(float x, float y) {
  if (townHighlight == true) {
    stroke(#009688); //greenish
    strokeWeight(3);
  } else {
    stroke(0); //black
    strokeWeight(2);
  }
  point(x, y); //town marker
  strokeWeight(1);
}
void createCities(float x, float y) {
  if (cityHighlight == true) {
    stroke(#ff9800); //yellow
    strokeWeight(5);
  } else {
    stroke(0); //black
    strokeWeight(4);
  }
  point(x, y); //city marker
  strokeWeight(1);
}
void createLargeCities(float x, float y) {
  if (cityHighlight == true) {
    stroke(#ff9800); //yellow
    strokeWeight(8);
  } else {
    stroke(0); //black
    strokeWeight(7);
  }
  point(x, y); //large city marker
  strokeWeight(1);
}
//setting array values
void resetbuttonValue() {
  resetbuttons[0] = loadImage("button_reset_false.png");
  resetbuttons[1] = loadImage("button_reset_true.png");
}

//setting array values
void savebuttonValue() {
  savebuttons[0] =loadImage("button_save_false.png");
  savebuttons[1] =loadImage("button_save_true.png");
  savebuttons[2] =loadImage("button_save_saved.png");
}

//setting array values
void villageTownCityValues() {
  villagebuttons[0] = loadImage("button_village_true.png");
  villagebuttons[1] = loadImage("button_village_hover_true.png");
  villagebuttons[2] = loadImage("button_village_hover_false.png");
  villagebuttons[3] = loadImage("button_village_false.png");

  townbuttons[0] = loadImage("button_town_true.png");
  townbuttons[1] = loadImage("button_town_hover_true.png");
  townbuttons[2] = loadImage("button_town_hover_false.png");
  townbuttons[3] = loadImage("button_town_false.png");

  citybuttons[0] = loadImage("button_city_true.png");
  citybuttons[1] = loadImage("button_city_hover_true.png");
  citybuttons[2] = loadImage("button_city_hover_false.png");
  citybuttons[3] = loadImage("button_city_false.png");
}

//setting array values
void kingdomValueEquations() {
  kingdomValues[0] = int((random(1000, 50000)/100)); //Kingdom Age
  kingdomValues[1] = int(random(10, 50)); //Population Density
  kingdomValues[2] = int(random(10000, 500000)); //Kingdom Area
  kingdomValues[3] = int(sqrt(kingdomValues[2])); //Kingdom Width
  kingdomValues[4] = int(kingdomValues[3]/5); //Distance Across in Days
  kingdomValues[5] = int(pow((kingdomValues[3] / 30), 2)); //Number of Regions
  kingdomValues[6] = 30; //Width of a Region
  kingdomValues[7] = 900; //Area of a Region

  //Percentage of Arable Land
  if (kingdomValues[1] <=10) {
    kingdomValues[8] = 14;
  } else if (kingdomValues[1] <=15) {
    kingdomValues[8] = 21;
  } else if (kingdomValues[1] <=20) {
    kingdomValues[8] = 28;
  } else if (kingdomValues[1] <=30) {
    kingdomValues[8] = 43;
  } else if (kingdomValues[1] <=40) {
    kingdomValues[8] = 57;
  } else if (kingdomValues[1] <=45) {
    kingdomValues[8] = 64;
  } else {
    kingdomValues[8] = 65;
  }

  kingdomValues[9] = kingdomValues[2] * kingdomValues[8]/100; //Total Amount of Arable Land
  kingdomValues[10] = kingdomValues[2] - kingdomValues[9]; //Total Amount of Wilderness
  kingdomValues[11] = kingdomValues[1] * kingdomValues[2]; //Total Population
  kingdomValues[12] = int(kingdomValues[11]*0.02); //Isolated Residents

  //Village People , Townfolk, Cityfolk, Large Cityfolk
  if (kingdomValues[11] <= 10000) {
    kingdomValues[13]=int(kingdomValues[11]*0.98); //Village People
  } else if (kingdomValues[11] <= 100000) {
    kingdomValues[14]=int(kingdomValues[11]*0.09); //Townfolk
  } else if (kingdomValues[11] <= 1000000) {
    kingdomValues[15]=int(kingdomValues[11]*0.03); //Cityfolk
  } else {
    kingdomValues[13]=int(kingdomValues[11]*0.89); //Village People
    kingdomValues[14]=int(kingdomValues[11]*0.06); //Townfolk
    kingdomValues[15]=int(kingdomValues[11]*0.025); //Cityfolk  
    kingdomValues[16]=int(kingdomValues[11]*0.005); //Large Cityfolk
  }

  kingdomValues[17] = round(kingdomValues[13]/500); //Number of Villages
  kingdomValues[18] = round(kingdomValues[14]/4000); //Number of Towns
  kingdomValues[19] = round(kingdomValues[15]/6000); //Number of Cities
  kingdomValues[20] = round(kingdomValues[16]/50000); //Number of Large Cities

  kingdomValues[21] = int(kingdomValues[11]/500000*sqrt(kingdomValues[0])); //Number of Castles
  kingdomValues[22] = int(kingdomValues[22]*0.66); //Active Castles
  kingdomValues[23] = int(kingdomValues[22] - kingdomValues[22]); //Abandon Castles
}

//writing header
void kingdomHeader(String Name, float x, float y) {
  textAlign(CENTER);
  fill(0);
  textFont(header, 50);
  text(Name, x, y); //writes the kingdom name
}

//all them hit tests
boolean rectHitTest(float pX, float pY, float rX, float rY, float rW, float rH) {
  float left = rX-(rW/2);
  float right = rX+(rW/2);
  float top = rY-(rH/2);
  float bottom = rY+(rH/2);

  boolean isHit =false;
  if ((pX>left) && (pX <right) && (pY >top) && (pY<bottom)) {
    isHit = true;
  } else {
    isHit = false;
  }
  return isHit;
}

//woooh pretty
void mapDropShadow() {
  fill(200); //greyish
  stroke(0);
  rect(regionX-4, regionY-2, 510, 510, 3);
  filter(BLUR, 2);

  fill(255); //white
  noStroke();
  rect(regionX-5, regionY-5, 511, 511, 3);
  filter(BLUR, 0);
}

//FINALLY DONE!


