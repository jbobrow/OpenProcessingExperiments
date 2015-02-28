
XMLElement file; //declares XML element named file
String[] quotesAboutPunishment; //declare array
int numCrimes;
int counter = 0;
int i;
PFont f;
PImage bg;
float random;




void setup() {
 size(800, 500); //size of viewer/canvas
 bg = loadImage ("vintage-kids.jpg");
 background (bg);
 file = new XMLElement (this,"punishment.xml");//file equals punishment.xml
 numCrimes = file.getChildCount();  //get count of root child file "Crimes"
 quotesAboutPunishment= new String [numCrimes];  //once number of Crimes is available, fill in variables for array.
 for (int i = 0; i < numCrimes; i++) {  //for loop: find number of crimes
   XMLElement crime = file.getChild(i);// gets child of punishment.xml named "crime" 
   XMLElement quote = crime.getChild(0); //gets first child under crime, <quote>
   //XMLElement punishment= crime.getChild(1);
   //XMLElement sex= crime.getChild(2);
   quotesAboutPunishment[i]= quote.getContent();  //get array data
  }
   f = loadFont("STSong-22.vlw"); // STEP 3  Load Font 
    textFont(f,22); 
}

void draw() {
  background(bg);
  fill(50);  
  textAlign (CENTER);
        text(quotesAboutPunishment[counter], width/2, 100);
    fill(55);
  triangle(730,430, 770, 410, 730,390);   
    fill(55);
  triangle(70,430, 30, 410, 70,390);   
   
}

void mousePressed(){

if((mouseX > 730) && (mouseX < 770) && (mouseY > 390) && (mouseY<430)){
  counter = min(counter+1,quotesAboutPunishment.length-1);
}
if((mouseX >30) && (mouseX<70) && (mouseY > 390) && (mouseY< 430)){
  counter = max(counter-1, 0);
}
  
 

}











/*
if((mouseX > 730) && (mouseX < 770) && (mouseY > 390) && (mouseY<430)){
  counter = counter+1;
}
if((mouseX >30) && (mouseX<70) && (mouseY > 390) && (mouseY< 430)){
  counter = counter-1;
}

if(counter > quotesAboutPunishment.length-1){
  counter = quotesAboutPunishment.length-1;
}

if(counter < 0){
  counter = 0;
}
*/
  


