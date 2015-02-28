
//Carter Nelson
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section B
//Sept. 9, 2012
//Due: Thursday Sept. 13, 2012

float randomDiameter = 100;      //global variable - float - diameter
int growingDiameter = 50;     //global variable - int - diameter
int randomRed = 0;     //global variable - float - color
boolean boolGrowing = false; //global variable - boolean - to grow or not to grow... that is the question
//*Boolean can be true or false
int value = 0;
int value2 = 255;

void setup() {

  size(1200, 600);     //screen size for ass. 1b
  background(0);
}

void draw() {
  
  //noFill();
  //stroke(255, 102, 0);
  //line(1190, 10, 10, 10);
  //line(10, 590, 1190, 590);
  //stroke(0, 0, 0);
  //bezier(1190, 10, 900, 200, 900, 400, 1190, 590);

//for(int i=2; i<300; i=i+6)

{  
  
  stroke(value2,value,value);
  line(300, 50, pmouseX, mouseY); 
  println(mouseX + " : " + pmouseX);

  stroke(value2,165,value);
  line(900, 50, pmouseX, mouseY); 
  println(mouseX + " : " + pmouseX);
  
  stroke(value2,value2,value);
  line(50, 300, pmouseX, mouseY); 
  println(mouseX + " : " + pmouseX);
  
  stroke(value,value2,value);
  line(1150, 300, pmouseX, mouseY); 
  println(mouseX + " : " + pmouseX);
  
  stroke(value,value,value2);
  line(300, 550, pmouseX, mouseY); 
  println(mouseX + " : " + pmouseX);

  stroke(148,value,value2);
  line(900, 550, pmouseX, mouseY); 
  println(mouseX + " : " + pmouseX);

}

  //fill(255,25);
  //rect(0,0,width,height);

  strokeWeight(1);
  smooth();     //andti-aliasing
  randomRed = int(random(255));     //int() for random float to int
  stroke(randomRed + 150, 0, 0);
  fill(randomRed, 0, 0);     //random red color
  //randomDiameter = random(50);     //random # generator for diameter
  //ellipse(mouseX, mouseY, randomDiameter, randomDiameter);     //ellipse drawn under mouse
  //rect(mouseX, mouseY, growingDiameter, growingDiameter);

  if (boolGrowing == true) {     //is boolGrowing equal to TRUE?, if not, ignore...
    if (growingDiameter < 50) {

      growingDiameter++;     //growingDiameter is assigned to growingDiameter + 1
    }

    else {

      growingDiameter = 0;     //restarts
    }
  }

  //ellipse(mouseX, mouseY, growingDiameter, growingDiameter);     //ellipse drawn under mouse
}

void mouseClicked() {

  
  
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }


 if (value2 == 255) {
    value2 = 0;
  } else {
    value2 = 255;
  }

 

  //  if (boolGrowing == false) {

  //    boolGrowing = true;
  //  }

  //  else {

  //    boolGrowing = false;
  //  }


  //^ same as
  boolGrowing = !boolGrowing;     //! means "not"
}







void keyPressed() {
  if (key == 's') {
    save("carterNelson.png");
  }
}
