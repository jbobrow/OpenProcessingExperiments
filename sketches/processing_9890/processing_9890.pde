
/*
Jason Grotegut
 May 20, 2010
 Thought Bubble 1.1
 */

PFont font; //declare font variable

void setup() {
  size(450,450);
  background(0);
  smooth();
  font = loadFont("AmericanTypewriter-Bold-48.vlw"); //load the font
  textFont(font); //set font
}

// integer variables
int counter = 0;

void draw() {  
  noLoop();
  int gradient=height/1; // set background for loop fill
  noStroke();
  for (int i = gradient; i>0; i=i-1) {
    fill(i);
    ellipse(width/2, height/2, i*3, i*3);
  }
  loop();
  thought();
}

void mouseClicked() {
  counter++; //incremental clicks
}

void thought() {
  noFill();
  switch(counter) { //Ray Elder for help changing it to switch case
  case 0: // Initial thought
    strokeWeight(3);
    textSize(18); //font size
    textAlign(CENTER); //font postioning
    stroke(255);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(255);
    text("Hello World", mouseX - 110, mouseY - 105); 
    break;

  case 1: // 1st click
    stroke(0, 255, 0);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(0, 255, 0);
    text("How Am I?", mouseX - 110, mouseY - 105); 
    break;
  case 2: // 2nd click
    stroke(100, 100, 255);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(50, 50, 255);
    text("I Am Fine.", mouseX - 110, mouseY - 105); 
    break;
  case 3: // 3rd click
    stroke(255, 0, 0);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(255, 0, 0);
    text("Now That", mouseX - 110, mouseY - 115); 
    text("You Asked.", mouseX - 110, mouseY - 95);
    break;
  case 4: // 4th click
    stroke(255, 0, 255);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(255, 0, 255);
    text("Can You", mouseX - 110, mouseY - 115); 
    text("Hear Me?", mouseX - 110, mouseY - 95);
    break;
  case 5: // 5th click
    stroke(255, 255, 0);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(255, 255, 0);
    text("Oh There", mouseX - 110, mouseY - 115); 
    text("You Are.", mouseX - 110, mouseY - 95);
    break;
  case 6: // 6th click
    stroke(0, 255, 255);
    ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
    ellipse(mouseX - 30, mouseY - 30, 14, 11);
    ellipse(mouseX - 45, mouseY - 45, 16, 12);
    ellipse(mouseX - 110, mouseY - 110, 180, 120);
    fill(0, 255, 255);
    text("Bullocks!", mouseX - 110, mouseY - 105); 
    break;
  case 7: // return to zero
    counter = 0;
    noFill(); //reset screen
    noStroke();
    break;
  }
}













