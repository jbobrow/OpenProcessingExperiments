
PFont font; //declare font variable

void setup() {
  size(450,450);
  background(0);
  smooth();
  stroke(255);
  noFill();
  font = loadFont("AmericanTypewriter-Bold-48.vlw"); //load the font
  textFont(font); //set font
}

// integer variables
int counter = 0;

void draw() {
  background(0);
  ellipse(mouseX - 15, mouseY - 15, 12, 10); //thought bubbles
  ellipse(mouseX - 30, mouseY - 30, 14, 11);
  ellipse(mouseX - 45, mouseY - 45, 16, 12);
  ellipse(mouseX - 110, mouseY - 110, 180, 120);
  textSize(18); //font size
  textAlign(CENTER); //font postioning
  
  if(counter == 0) {
    stroke(255);
    text("Hello World", mouseX - 110, mouseY - 105); // initial thought
  }
  else if(counter == 1) {
    stroke(0, 255, 0);
    text("How Am I?", mouseX - 110, mouseY - 105); // 1st click
  }
  else if(counter == 2) {
    stroke(0, 0, 255);
    text("I Am Fine.", mouseX - 110, mouseY - 105); // 2nd click
  }
  else if(counter == 3) {
    stroke(255, 0, 0);
    text("Now That", mouseX - 110, mouseY - 115); // 3rd click
    text("You Asked.", mouseX - 110, mouseY - 95);
  }
  else if(counter == 4) {
    stroke(255, 0, 255);
    text("Can You", mouseX - 110, mouseY - 115); // 4th click
    text("Hear Me?", mouseX - 110, mouseY - 95);
  }
  else if(counter == 5) {
    stroke(255, 255, 0);
    text("Oh There", mouseX - 110, mouseY - 115); // 5th click
    text("You Are.", mouseX - 110, mouseY - 95);
  }
  else if(counter == 6) { 
    counter = 0; // return to zero
  }
}

void mouseClicked() {
  counter++; //incremental clicks
  
}









