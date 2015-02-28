
//Alex Nelson

//Drawing Machine

//Rules:
//1)Make a 500x500pixel page
//2)Make the background a light orange
//3)Make a horizontal line through the center of the page
//4)Disperse 10 lines randomly from the center point of the page with a random length from 0  
   // pixels to the height and width of the page in size and make the colors vary evenly 
   //between red, white, orange, green, and blue,white,red,orange, and green
//5)Make a light purple ellipse that is 180 pixels high and touches the center of the left and 
   //right side of
   //the page at its ends
//6)Make an arc that is 150 pixels high and touches the center of the left and right side of the
   //page at its ends
//7)Make another arc that mirrors the first one and fill the arcs with white
//8)Make a golden circle that touches the center of the arc at its height
//9)Make a black circle that is 1/3 the size of the golden circle
//10) Make it so that each time you click the mouse it adds 25 more lines from the center 
      // point

void setup() { 
  size(500, 500);
  background(250, 150, 100); //light orange
}

float center = 250;
float pupilSize = 50;
float lineCount = 0;
float lineNumber = 10;

void draw () {

  //size of horizontal line
  stroke(0);
  strokeWeight(2);

  //horizontal line at center of page
  line(0, center, width, center);


  //line size for the lashes
  stroke(0);
  strokeWeight(0);


  //white lashes  
  if (lineCount < lineNumber) {
    stroke(0);
    line(center, center, random(0, width), random(0, height));
  }

  //red lashes
  if (lineCount < lineNumber) {
    stroke(255, 50, 0);
    line(center, center, random(0, width), random(0, height));
  }

  //orange lashes  
  if (lineCount < lineNumber) {
    stroke(255);
    line(center, center, random(0, width), random(0, height));
  }

  //green lashes  
  if (lineCount < lineNumber) {
    stroke(50, 250, 0);
    line(center, center, random(0, width), random(0, height));
  }

  //blue lashes  
  if (lineCount < lineNumber) {
    stroke(0, 25, 255);
    line(center, center, random(0, width), random(0, height));
  }    

  lineCount++;


  //line size for the eye details
  stroke(0);
  strokeWeight(4);


  // light purple eyelids
  fill(200, 200, 255);
  ellipse(center, center, width/1.5, 180);


  fill(255);

  //top eye lid where lashes start
  arc(center, center, width/1.5, 150, PI/width/1.5, 2*PI);

  //bottom eye lid where lashes start
  arc(center, center, width/1.5, 150, PI/width/1.5, PI); 


  //eye ball
  fill(250, 200, 60);
  ellipse(center, center, 3*pupilSize, 3*pupilSize);


  //pupil
  fill(0);
  ellipse(center, center, pupilSize, pupilSize);
}

//redraw the composition
void mousePressed() {
  background(250, 150, 100); //light orange
  lineNumber=lineNumber+25; //add 25 more lines each time mouse is clicked
  lineCount=0;
}

