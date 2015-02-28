
/*
Amy Findeiss
Green Slices with text
August 4th, 2011
*/

PFont myDisplayFont;

void setup() {
  size(150,120);
  background(10,255,110);
  smooth();
  myDisplayFont=loadFont("Knockout-HTF26-JuniorFlyweight-48.vlw");
  fill(69,153,135);
  textFont(myDisplayFont,42);
}

void draw(){  
  
//fill colors
  noStroke();
  fill(111,141,135); //color 2-army green
  rect(0,114,40,10);
  rect(105,64,53,45);
  rect(62,40,43,30);

  fill(130,170,133); //color 3-light army green
  rect(114,0,36,43);
  
  fill(76,81,84); //color 4-green black
  rect(17,0,100,42);
  rect(0,66,19,48);
  
  fill(115,236,30); //color 5-lime green
  rect(105,42,47,28);
  
  fill(75,166,101); //color 6-teal1
  rect(38,114,70,7);

  fill(69,143,135); //color 7-teal2
  rect(19,54,60,60);
  
  fill(196,245,78); //color 8-yellow
  rect(0,42,26,32);
  
  fill(69,153,135); //color 9-teal3
  rect(0,0,17,47);
  
  text("FARM CARPET",16,42);
}

