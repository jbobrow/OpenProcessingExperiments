
XMLElement file; //declares XML element named file
String[] quotesAboutPunishment; //declare array
int numCrimes;
int counter = 0;
int i;
PFont f;
PImage bg, intro;
float offset;
boolean introPlayed;


void setup() {
  size(800, 500); //size of viewer/canvas
  bg = loadImage ("vintage-kids.jpg");
  intro = loadImage ("introtext.jpg");
  background(bg);
  file = new XMLElement (this, "punishment.xml");//file equals punishment.xml
  numCrimes = file.getChildCount();  //get count of root child file "Crimes"
  quotesAboutPunishment= new String [numCrimes];  //once number of Crimes is available, fill in variables for array.
  for (int i = 0; i < numCrimes; i++) {  //for loop: find number of crimes
    XMLElement crime = file.getChild(i);// gets child of punishment.xml named "crime" 
    XMLElement quote = crime.getChild(0); //gets first child under crime, <quote>
    //XMLElement punishment= crime.getChild(1);
    //XMLElement sex= crime.getChild(2);
    quotesAboutPunishment[i]= quote.getContent();   //get array data
  }
  f = loadFont("STSong-22.vlw"); // STEP 3  Load Font 
  textFont(f, 22); 
  textAlign (CENTER);
  introPlayed = false;
  
 }

void draw() {
  if (introPlayed) {
    image(bg,0,0);
  fill(40);
  text(quotesAboutPunishment[counter], width/2, 100);
  fill(55);
  triangle(720, 430, 770, 410, 720, 390);   
  fill(55);
  triangle(80, 430, 30, 410, 80, 390);
   } else {
      image(intro,0,0);
   }
}

 

void mousePressed() {
  if (introPlayed = true); 
  
    
  if ((mouseX > 730) && (mouseX < 770) && (mouseY > 390) && (mouseY<430)) {
    counter = min(counter+1, quotesAboutPunishment.length-1);
  }
  if ((mouseX >30) && (mouseX<70) && (mouseY > 390) && (mouseY< 430)) {
    counter = max(counter-1, 0);
  }
}













