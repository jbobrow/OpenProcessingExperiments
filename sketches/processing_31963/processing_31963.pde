

PImage bg;
int a; 

void setup() 
{
  size(1024, 1311);
  frameRate(30);
  //image inside Data
  bg = loadImage("Bayside_Blacktexture.jpeg");
}

void draw() 
{
  background(bg);

  PFont font;

  // Load Futura Ligh font

    font = loadFont("FuturaTEE-Ligh-48.vlw"); 
  textFont(font); 
  fill(139, 131, 120);
  text("For Thine is...", 35, 100);
  text("Life is", 35, 250);
  text("For Thine is the", 35, 300);
  text("This is the way the world ends", 35, 450);
  text("This is the way the world ends", 35, 500);
  text("This is the way the world ends", 35, 650);
  text("Not with a bang but a whimper.", 35, 700);
  text("-T. S. Eliot.", 430, 850);
}


/*
// Console Text
void text()
println("For Thine is");
println("Life is");
println("For Thine is");

println("This is the way the world ends");
println("This is the way the world ends");
println("This is the way the world ends");
println("Not with a bang but a whimper.");
}
*/

