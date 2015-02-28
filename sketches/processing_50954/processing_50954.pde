
//Nicole Lewis: Homework Assignment 2 2/2/12
//Code Reference (font): http://processing.org/reference/text_.html
//Code Reference (points): http://processing.org/reference/point_.html
//Code Reference (continuous lines): http://processing.org/learning/topics/continuouslines.html

void setup() {
  smooth();
  size(400, 400);
  background(255);
    PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Monospaced-15.vlw"); 
fill(0,0,0);
textFont(font, 15); 

//connect the dots
text("Connect The Dots!", 120, 200);
text("1",200,135);
text("2", 240,65);
text("3",300,65);
text("4",350,125);
text("5",350,190);
text("6",300,240);
text("7",250,290);
text("8",200,340);
text("9",150,290);
text("10",100,240);
text("11",50,190);
text("12",50,125);
text("13",100,65);
text("14",160,65);
}

void draw() {
  stroke(0,0,0);
  strokeWeight(10);

//heart
point(240,75);
point(300,75);
point(350,135);
point(350, 200);
point(300, 250);  
point(250, 300);
point(200, 350);
point(150, 300);
point(100, 250);
point(50, 200);
point(50,135);
point(100,75);
point(160,75);
point(200,145);

  stroke(214,22,105);
  smooth();
  strokeWeight(5);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  }
}



