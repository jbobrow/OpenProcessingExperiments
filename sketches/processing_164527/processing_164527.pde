
//creates a PFont object called myFont
PFont myFont; 

//creates a global string called printText
String printText = "\t Press 'q', 'w', or 'e' to display sketches.";

void setup() {
  size(700, 700);
  myFont = loadFont("GillSans-48.vlw"); //loads font Gill Sans
  textFont(myFont, 30);                //sets the font and point size
  smooth();                           //makes printed graphics smooth
}

void draw() {
  
  fill(0);                  //sets font color to black
  text(printText,100,100); //Prints the string at (100,100) on the screen
  
  if (key == 'q' || key == 'Q')
    closure(); 
  else if (key =='w' || key =='W')
    proximity();
  else if(key=='e' || key =='E')
    similarity();
}

void closure() {
  //determines background color based on mouse position
  background(mouseX, mouseY, 105);

  //draws an ellipse
  fill(250, 249, 197);
  noStroke();
  ellipse(350, 350, 600, 600);

  /*draws the outline of a rectangle
   stroke color is determined by mouse position */
  stroke(mouseY, mouseX, 105);
  rect(200, 200, 300, 300);

  //sets stroke weight to 50 
  strokeWeight(50);
  stroke(250, 249, 197);

  //prints two lines
  line(350, 100, 350, 600);
  line(100, 350, 600, 350);
}

void proximity() {

  int row = 0;
  int x = 100;
  int y = 100;
  int width = 100;
  int height = 100;

  background(45,64,94);

  /*prints 4 rows of 4 circles each. after two rows have been printed
   the y coordinate is increased by 200 for one row */
  while (row<=3) {
    fill(mouseX+2, mouseX, mouseX+4);
    noStroke();

    // prints a row of 4 circles
    for (int print=0;print<=3;print++) {
      ellipse(x, y, width, height);
      x=x+150; 
    }

    x = 100;

    if (row==1)
      y=y+200;
    else
      y=y+150;
    row++;
  }
}

void similarity() {
  int print = 0;
  int x = 100;
  int y = 100;
  int width = 100;
  int height = 100;

  background(20);  

  //prints a row of four ellipses
  while (print<=3) {

    //determines the fill and stroke weight of the ellipses
    if (print>1) {    
      noFill();
      strokeWeight(5);
      stroke(mouseY, mouseX, 197);
    } else {
      noStroke();
      fill(mouseX, mouseY, 197);
    }

    ellipse(x, y, width, height);
    x=x+150;
    print++;
  }
}



