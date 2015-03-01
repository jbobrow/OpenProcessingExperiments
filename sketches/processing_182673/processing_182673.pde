
//This is a sketch about TEXT STRINGS -- #1 of 3
//Story text is determined by mouse position

PFont a; //size 24

String helloEMP = "Hello Emergent Media Production!";
String[] helloEMP2 = {"Hello", "Emergent", "Media", "Production!"};

String beginning = "This is a ";
String[] adjectives = {"happy", "sad", "sneaky", "delicious"};
String end = " story...";

int whatstory;

void setup()
{
  size(500, 500);
  
  //MAKE SCREEN RESIZABLE 
  if (frame != null) {
    frame.setResizable(true);
  }
  
  //SET UP FONT STYLE 
  a = loadFont("GoudyBookletter1911-24.vlw");
}


void draw()
{
  
  //DRAW BACKGROUND:
  background(0);
  rectMode(CORNER);
  fill(0);
  rect(0, 0, width, height/2);
  fill(255);
  rect(0, height/2, width, height);
  rectMode(CENTER);
  fill(175);
  rect(width/2, height/2, 300, 100);
  
  //DETERMINE VARIABLE "whatstory" BASED ON MOUSE POSITION
  if (mouseX < width/2 && mouseY > height/2) {
    whatstory = 0;
  } else if (mouseX < width/2 && mouseY < height/2) {
    whatstory = 1;
  } else if (mouseX > width/2 && mouseY > height/2) {
    whatstory = 2;
  } else {
    whatstory = 3;
  }
  
  //WRITE THE TEXT IN CENTER OF SCREEN
  fill(0);
  textFont(a, 24);
  textAlign(CENTER);
  text(beginning + adjectives[whatstory] + end, width/2, height/2);
}



