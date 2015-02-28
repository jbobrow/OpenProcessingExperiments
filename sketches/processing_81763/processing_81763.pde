
int currentScreen;  
//floats for data in csv
float[] nicotine = new float[15];
float[] lungs = new float[15];

int x = 450;

int ynic = 90;
int yblood = 215;
int yprof = 340;
int yabout = 465;
// x value contant, y changes
//width and height for buttons
int w = 150;
int h = 75;

PImage img;
//

void setup() { 
background(255); 
size(600, 600);  
noStroke();  
smooth();  
img = loadImage("profile.jpg");

//code to parse csv
 String[] data = loadStrings("projectstats.csv");
//uses array. gathers data one line at a time down columns
  for (int i=0;i<data.length;i++) {
    String[] newLine = split(data[i], ",");

    
    nicotine[i] = float(newLine[0]);
    lungs[i] = float(newLine[1]);
  }



}  
//button selection, break moves on to next statement. allows switch. 
void draw() {  
switch(currentScreen) {  
case 0: drawMainMenu(); break;  
case 1: drawNicotineLevels(); break;  
case 2: drawBloodPressure(); break;  
case 3: drawProfile(); break;  
case 4: drawAbout(); break;
default: background(0); break;  

  }  
}  
   
// mapping for mouse press location, makes buttons work
void mousePressed() {  

if (mouseX > x && mouseX < x+w && mouseY > ynic && mouseY < ynic+h) 
  {
    drawNicotineLevels();
  }
  if (mouseX > x && mouseX < x+w && mouseY > yblood && mouseY < yblood+h) 
  {
    drawBloodPressure();
  } 
  
  if (mouseX > x && mouseX < x+w && mouseY > yprof && mouseY < yprof+h) 
  {
    drawProfile();
  } 
  
  if (mouseX > x && mouseX < x+w && mouseY > yabout && mouseY < yabout+h) 
  {
    drawAbout();
  } 
}  
   


//
void drawNicotineLevels() {  

background(255);  





int x=0; 
for(int i=0;i<10;i++){ //number "10" is number of data items in data array 

//title 

PFont font; 
font = loadFont("Aharoni-Bold-38.vlw"); 
textFont(font); 
text("Nicotine Level for weeks 1 - 10", 25, 50); 

fill(0,131,57); // graph colour


//display data graph , calls array which gets csv data
float g = map(nicotine[i], 0,50,0,400); 
rect(x+20,height-g,30,g); 
fill(0); //title colour

//space between bars 
x+=40; 

} 

}
  
void drawBloodPressure() {  
//is actually lung capacity

background(255);  

//data for graph





int x=0; 
for(int i=0;i<10;i++){ //number "10" is number of data items in data array 

//title 

PFont font; 
font = loadFont("Aharoni-Bold-38.vlw"); 
textFont(font); 
text("Lung Capacity for weeks 1 - 10", 25, 50); 

fill(0,17,172); // graph colour


//display data graph 
float g = map(lungs[i], 0,450,0,400); 
rect(x+20,height-g,30,g); 
fill(0); //title colour

//space between bars 
x+=40; 
} 
}
  

   

void drawProfile() { 
 
background(255);

PFont font; 
PFont smallFont; 


image(img, 25, 75);

font = loadFont("Aharoni-Bold-38.vlw");
smallFont = loadFont("Aharoni-Bold-25.vlw");

textFont(font); 
text("Profile", 25, 50);

textFont(smallFont);
text("Name: Angela Hendry", 25, 275);
text("Age: 39", 25, 325);
text("Female", 25, 375);


} 

void drawAbout() {  
background(255);  

PFont font; 
font = loadFont("Aharoni-Bold-38.vlw"); 
textFont(font); 
text("About", 25, 50); 

PFont smallFont;
smallFont = loadFont("Aharoni-Bold-25.vlw");
textFont(smallFont);
text("This program was designed ", 25, 150);  
text("as a data gift for Angela Hendry.", 25, 180);
text("it displays a bar chart", 25, 210);
text("showing her nicotine levels",25, 240);
text("and lung capacity for the past .", 25, 270);
text("10 weeks. It is a way of", 25, 300);
text("visually seeing progress in a users", 25, 360);
text("attempt to cut down or quit ",25,390);
text("smoking.",25,420);
text("",25,390);
text("",25,390);
text("",25,390);
text("",25,390);
text("",25,390);
//y + 30 for every line
} 






//MAIN MENU
void drawMainMenu() {  
    
boolean buttonNicotine = false;
boolean buttonBlood = false;
boolean buttonProfile = false;
boolean buttonAbout = false;

PFont font; 
font = loadFont("Aharoni-Bold-38.vlw"); 
textFont(font); 
text("Nicotine Level", x, ynic-3);
text("Lung Capacity", x, yblood-3);
text("Profile", x, yprof-3);
text("About", x, yabout-3);

PFont smallFont;
smallFont = loadFont("Aharoni-Bold-38.vlw");
textFont(smallFont);



  
//nicotine button
  if (buttonNicotine) {
  } 
  
  fill(0);
  rect(x,ynic,w,h);
  noStroke(); 

//blood pressure button
  if (buttonBlood) {
} 
  
  fill(0);
  rect(x,yblood,w,h);
  noStroke(); 


//profile button
  if (buttonProfile) {
} 
  
  fill(0);
  rect(x,yprof,w,h);
  noStroke(); 
  
//about button
  if (buttonAbout) {
} 
  
  fill(0);
  rect(x,yabout,w,h);
  noStroke();
} 


