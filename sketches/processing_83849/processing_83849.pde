
//Rebecca Low
//Creative Computing - Ben Norskov - Fall 2012 - Section A
//Final project
//December 14, 2012


//int //Position of img Western/American
//int //Position of img South American
//int //Position of img African
//int //Position of img Eastern European
//int //Position of img Chinese
//int //Position of img Japanese
//int //Position of img Hindu

PImage imgworldmap;
PImage imgwesternamerica;
PImage imgsouthamerica;
PImage imgafrica;
PImage imgeasterneurope;
PImage imgchina;
PImage imgjapan;
PImage imghindu;

PFont font;

boolean imgOver = false;
//this is the way to do it, but you'll have to make one for each section of the map:
Boolean overWestern = false;
Boolean overSouthAmerica = false;
Boolean overAfrica = false;
Boolean overEastern = false;
Boolean overChina = false;
Boolean overJapan = false;
Boolean overHindu = false;


void setup() {
  size(1321, 785);
  imgworldmap = loadImage("worldmap.jpg");
  imgwesternamerica = loadImage("westernamerica.png");
  imgsouthamerica = loadImage("southamerica.png");
  imgafrica = loadImage("africa.png");
  imgeasterneurope = loadImage("easterneurope.png");
  imgchina = loadImage("china.png");
  imgjapan = loadImage("japan.png");
  imghindu = loadImage("hindu.png");

  smooth();
  font = loadFont("CenturyGothic-Bold-20.vlw");
  textFont(font);
}

void draw() {
  background(255);
  image(imgworldmap, 0, 0);//draw the background image first, then put the others on top of it
  image(imgwesternamerica, 0, 0);
  image(imgsouthamerica, 0, 0);
  image(imgafrica, 0, 0);
  image(imgeasterneurope, 0, 0);
  image(imgchina, 0, 0);
  image(imgjapan, 0, 0);
  image(imghindu, 0, 0);

  drawTheRollovers(); //I'm using a function to keep things neater. You don't have to if this is confusing
  checkWhereMouseIs(); //Same here. I'm putting the functions below the draw loop

  println(mouseX + " " + mouseY);//this line gives you the mouse Coordinates. It's helpful when setting up hit-boxes
}//————————————————————————————————————————————————— END OF DRAW LOOP
//
void drawTheRollovers() {
  fill(215, 1, 1);//fill red for the text
  //now you'll have one big else-if statement
  if (overWestern == true) {
    //if overWestern, then show the image of 'merica and west
    image(imgwesternamerica, 0, 0);
    //and put up the correct text
    textSize(20);
    text("WESTERN/AMERICAN", 35, 500);
    text("anger", 35, 520);
    text("courage", 35, 540);
    text("danger", 35, 560);
    text("desire", 35, 580);
    text("erotic", 35, 600);
    text("excitement", 35, 620);
    text("heat", 35, 640);
    text("love", 35, 660);
    text("passion", 35, 680);
  } 
  else if (overSouthAmerica == true) {
    //if america isn't shown, then check southAmerica
    //display the image and the text for south America
    image(imgsouthamerica, 0, 0);
    textSize(30);
    text("SOUTH AMERICAN", 35, 500);
    text("danger", 35, 520);
  } 
  else if (overAfrica == true) {
    //do the same for africa. You have to seperate each one like this.
    image(imgafrica, 0, 0);
    textSize(20);
    text("AFRICAN", 35, 500);
    text("anger", 35, 520);
    text("good luck", 35, 540);
  } 
  else if (overEastern == true) {
    //do the same for africa. You have to seperate each one like this.
    image(imgeasterneurope, 0, 0);
    textSize(20);
    text("EASTERN EUROPEAN", 35, 500);
    text("anger", 35, 520);
    text("courage", 35, 540);
    text("beauty", 35, 560);
    text("good luck", 35, 580);
    text("power", 35, 600);
    text("excitement", 35, 620);
    text("heat", 35, 640);
    text("love", 35, 660);
    text("passion", 35, 680);
  } 
  else if (overChina == true) {
    //do the same for africa. You have to seperate each one like this.
    image(imgchina, 0, 0);
    textSize(20);
    text("CHINESE", 35, 500);
    text("fertility", 35, 520);
    text("good luck", 35, 540);
    text("happiness", 35, 560);
    text("marriage", 35, 580);
    text("success", 35, 600);
  } 
  else if (overJapan == true) {
    //do the same for africa. You have to seperate each one like this.
    image(imgjapan, 0, 0);
    textSize(20);
    text("JAPANESE", 35, 500);
    text("anger", 35, 520);
    text("danger", 35, 540);
    text("desire", 35, 560);
    text("excitement", 35, 580);
    text("happiness", 35, 600);
    text("love", 35, 620);
    text("passion", 35, 640);
    text("repels evil", 35, 660);
    text("strength", 35, 680);
    text("success", 35, 700);
  } 
  else if (overHindu == true) {
    //do the same for africa. You have to seperate each one like this.
    image(imghindu, 0, 0);
    textSize(20);
    text("HINDU", 35, 500);
    text("energy", 35, 520);
    text("erotic", 35, 540);
    text("happiness", 35, 560);
    text("heat", 35, 580);
    text("marriage", 35, 600);
    text("passion", 35, 620);
  }
}//————————————————————————————————————————————————— END OF Rollover Checks
//
void checkWhereMouseIs() {
  //the simplist mouse detection is a circle. 
  //See the button code on my openProcessing profile for an example: http://www.openprocessing.org/sketch/69868
  if (dist(709, 471, mouseX, mouseY) < 100) {
    //same for Africa
    overAfrica = true;
  } 
  else if (dist(430, 540, mouseX, mouseY) < 100) {
    //same for SouthAmerica
    overSouthAmerica = true;
  }
  else if (dist(980, 400, mouseX, mouseY) < 100) {
    //same for SouthAmerica
    overChina = true;
  }
  else if (dist(1000, 450, mouseX, mouseY) < 100) {
    //same for SouthAmerica
    overJapan = true;
  }   
else if (dist(800, 250, mouseX, mouseY) < 100) {
  //same for SouthAmerica
  overEastern = true;
} 
else if ( (dist(259, 313, mouseX, mouseY) < 100) || (dist(1136, 607, mouseX, mouseY) < 100) ) {
  //if we are close to america
  //OR we are close to Austrailia (that's what the "||" is. You can add as many hit-boxes as you'd like this way)
  //change overWestern to True
  overWestern = true;
} 
else {
  //if we aren't over any of the continents, then change all Booleans to false
  overWestern = false;
  overSouthAmerica = false;
  overAfrica = false;
}
}

