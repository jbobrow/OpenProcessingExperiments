
//Nicole Strang
//ITGM 315 Processing
//Assignment 1 Part 3
//Odeer the Tiger-Deer
//
//9.12.2012: Allowed coordinates to change based on mouse position.
//9.14.2012: Added ability to change Odeer's coat color by mouse position.
//           Also changed dark grey color in eyes, hooves, and stripes to darker color.
//           During the code, color mode changes from RGB to HSB and back. The reason 
//           is that I wished to control the saturation and brightness of the colors 
//           so that the color scheme for the coat will be generally appealing.
//
//9.24.2012: Fixed problem with code not running. See comments at the end of the script.


int c1;
int c2;

void setup() {
  size(512,512);
  
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  colorMode(RGB);

}


void draw() {
  
  background(255,255,153);
  
  //Coat color variables
    //Print statements after running the program confirm c1 will always run the range of 0-255.
    //Due to Odeer's size, c2 doesn't have to follow these rules, as ideally the legs would not be hidden.
  c1 = mouseX/2;
  c2 = mouseY;
  //print("mouseX="+mouseX+" c1="+c1 +" "+"\n");
  //print("mouseY="+mouseY+" c2="+c2 +" "+"\n");
  
  //Ears
  stroke(225,225,225);
  fill(225,225,225);
  ellipse(mouseX-60,mouseY-90,mouseX-20,mouseY-50);
  ellipse(mouseX+30,mouseY-90,mouseX+70,mouseY-50);
  
  
  //START Change coat color
    //stroke(255,204,102); This is the old color
    //fill(255,204,102); This is the old color
  colorMode(HSB);
  stroke(c2,55,225);
  fill(c2,55,225);
  colorMode(RGB);
  //END Change coat color
  
  
  //Neck
  rect(mouseX+20,mouseY+20,mouseX+30,mouseY+60);
  
  //Front leg
  rect(mouseX+30,mouseY+110,mouseX+40,mouseY+190);
  rect(mouseX+30,mouseY+190,mouseX+60,mouseY+250);
  
  //Back leg
  rect(mouseX+100,mouseY+110,mouseX+130,mouseY+130);
  rect(mouseX+110,mouseY+130,mouseX+120,mouseY+190);
  rect(mouseX+110,mouseY+190,mouseX+140,mouseY+250);
  
  
  //START Change coat color
      //stroke(255,153,51); This is the old color
      //fill(255,153,51); This is the old color
  colorMode(HSB);
  stroke(c1,100,200);
  fill(c1,100,200);
  colorMode(RGB);
  //END Change coat color
  
  
  //Tail
  rect(mouseX+120,mouseY+40,mouseX+150,mouseY+70);
  
  //Head
  rect(mouseX-60,mouseY-70,mouseX+70,mouseY+20);
  
  //Body
  rect(mouseX+20,mouseY+60,mouseX+130,mouseY+110);
  
  //Hooves
  stroke(80);
  fill(80);
  rect(mouseX+20,mouseY+250,mouseX+60,mouseY+270);
  rect(mouseX+100,mouseY+250,mouseX+140,mouseY+270);
  
  //Stripes, from top left to bottom left
  line(mouseX-60,mouseY-50,mouseX-20,mouseY-50);
  line(mouseX-60,mouseY-40,mouseX-20,mouseY-40);
  line(mouseX+30,mouseY-50,mouseX+70,mouseY-50);
  line(mouseX+30,mouseY-40,mouseX+70,mouseY-40);
  
  line(mouseX+60,mouseY+60,mouseX+60,mouseY+80);
  line(mouseX+70,mouseY+60,mouseX+70,mouseY+80);
  line(mouseX+80,mouseY+60,mouseX+80,mouseY+80);
  line(mouseX+90,mouseY+60,mouseX+90,mouseY+80);
  
  
  //Eyes
  stroke(225);
  ellipse(mouseX-50,mouseY+10,mouseX-30,mouseY-10);
  ellipse(mouseX+50,mouseY+10,mouseX+30,mouseY-11);
  
  /*Why is the right eye larger?
  
  Take a look at that last call to ellipse.
  
  For the final variable, mouseY-10 does not work at all. This seems to be only true for mouseY-10.
  
  For example:
  
  The original line of code reads ellipse(mouseX+50,mouseY+10,mouseX+30,mouseY-10);
  
  This will cause the program to not work at all.
  
  However, either ellipse(mouseX+50,mouseY+10,mouseX+30,mouseY-10); or
  ellipse(mouseX+50,mouseY+10,mouseX+30,mouseY-10); will work instead. In fact, any other number will
  work. mouseY-20 works.*/
  
}
