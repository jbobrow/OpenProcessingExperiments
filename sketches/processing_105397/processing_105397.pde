
//Star Drawings by Henry Zhu
//August 2nd, 2013 
//Contact me at henry.david.zhu@gmail.com !

//Code
//Specifies Properties of Sketching Background

void setup() {
  size(1000, 1000);
  background(0);
  text(" 'Stars' by Henry Zhu", 20, 20);
  text("\n Press C to Clear/Unclear Screen", 20, 20);
  smooth();
}


//Defines sizes of ellipses.
//Ellipses format (x, y [center point], default width, default size)
//Ellipse Properties
int ellipse_height = 30;
int ellipse_width = 30;

//Defines clear screen variable
boolean displayDrawings = false;
//Defines resizing properties for ellipses
int factorA = 8;
int factorB = 1;
int factorC = 2;
int factorD = 3;

//Draws ellipses
void draw() {
  if (mousePressed == true) {
    float ellipse_locationX = mouseX;
    float ellipse_locationY = mouseY;
    ellipse_locationX -= 0.5;
    ellipse_locationY -= 0.5;

    fill(255);


    factorA += 1;
    if (factorA > 15) {                                                                                                
      factorA = 8;
    }
    factorB += 1;
    if (factorB > 5) {
      factorB = 2;
    }
    factorC += 1;
    if (factorC > 6) {
      factorC = 2;
    }
    factorD += 1;
    if (factorD > 20) {
      factorD = 2;
    }

    fill(random(100), random(100), random(100));
    ellipse(ellipse_locationX, ellipse_locationY, ellipse_width/factorA, ellipse_height*factorB);
    ellipse(ellipse_locationY, ellipse_locationX, ellipse_width/factorA, ellipse_height*factorC);  
    ellipse((ellipse_locationY - ellipse_locationX)/2 + ellipse_locationX, (ellipse_locationX -         ellipse_locationY)/2 + ellipse_locationY, ellipse_width/factorA, ellipse_height*factorD);
    ellipse(ellipse_locationX, ellipse_locationY, ellipse_width/10, ellipse_height/10);
    ellipse(ellipse_locationY, ellipse_locationX, ellipse_width/10, ellipse_height/10);
    ellipse((ellipse_locationY - ellipse_locationX)/2 + ellipse_locationX, (ellipse_locationX - ellipse_locationY)/2 + ellipse_locationY, ellipse_width/10, ellipse_height/10);
    ellipse(ellipse_locationX, ellipse_locationY, ellipse_width*10, ellipse_height/factorA);
    ellipse(ellipse_locationY, ellipse_locationX, ellipse_width*10, ellipse_height/factorA);
    ellipse((ellipse_locationY - ellipse_locationX)/2 + ellipse_locationX, (ellipse_locationX -      ellipse_locationY)/2 + ellipse_locationY, ellipse_width*10, ellipse_height/factorA);
    frameRate(20);
  }
  //Control System
  //Executes after keyReleased() checks, and resets the background
  if (displayDrawings == true) {
    background(0);
    text(" 'Stars' by Henry Zhu", 20, 20);
    text("\n Press C to Clear/Unclear Screen", 20, 20);    
  }
}
//Sets ellipse



//Checks for c button to be pressed
void keyReleased() {
  if (key == 'c') {
    displayDrawings = !displayDrawings;
    fill(255);
    text(" 'Stars' by Henry Zhu", 20, 20);
    text("\n Press C to Clear/Unclear Screen", 20, 20);
  }
}

