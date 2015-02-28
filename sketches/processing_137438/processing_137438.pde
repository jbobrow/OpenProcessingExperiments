
PFont blackoak;
PFont arial;
float x = 0;
float myscale = 1;
float myscalespeed = 0.01;
float xspeed =1;
float rad = 0;
boolean runOnce = false;
PImage sparta;
float j = 0.2; //for for <span class="k14j9d2c" id="k14j9d2c_14">rotation</span>


PImage Spartan;

void setup()
{
  size (600, 600);
  
  arial = createFont("Arial",32);
  blackoak = createFont("Blackoak Std", 32);
  sparta = requestImage ("background.jpg");
  println ("x: " + mouseX + " y: " + mouseY);
}

void draw()
{
  image (sparta, 0, 0, width, height);
  filter(GRAY);
  
  pushMatrix();
  translate (300, 25);
  fill(#FFFFFF);
  textFont(arial);
  textAlign (CENTER, TOP);
  textSize(32);
  text("Seizing Our Glory", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 100);
  fill(#FFFFFF);
  textFont(arial);
  textAlign (CENTER, TOP);
  textSize (30);
  text("Spiritual Development", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(300, 200);
  fill(#FFFFFF);
  textFont(blackoak);
  textAlign(CENTER, TOP);
  textSize(23);
  text("Fight for Honor", 0,0);
  popMatrix();
  
  pushMatrix();
  translate(300, 400);
  textFont(blackoak);
  textAlign(CENTER, TOP);
  fill(#FFFFFF);
  textSize(22);
  text("To embetter ourselves", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 0);
  textFont(blackoak);
  textAlign(CENTER, TOP);
  fill(#FFFFFF);
  textSize (20);
  text("Are We All Fighters?", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 350);
  textFont (blackoak);
  textAlign(CENTER, TOP);
  fill(#FFFFFF);
  textSize (20);
  text("We fight for loved one", 0,0);
  popMatrix();
  
  pushMatrix();
  translate (300, 250);
  textFont (arial);
  textAlign (CENTER, TOP);
  fill(#FFFFFF);
  textSize (28);
  text("We fight for Pride", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 300);
  textFont (blackoak);
  textAlign(CENTER, TOP);
  fill(#FFFFFF);
  textSize (20);
  text ("We fight for Excellence ", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 450);
  textFont (arial);
  textAlign(CENTER, TOP);
  fill(#000000);
  textSize(28);
  text("Overall, Fighting is a Way of Life", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 500);
  textFont(arial);
  textAlign(CENTER, TOP);
  fill(#000000);
  textSize(28);
  text("Fighing is the foundation of Life", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (300, 550);
  textFont(blackoak);
  textAlign(CENTER, TOP);
  fill(#000000);
  textSize(20);
  text("We All are Fighters", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (70, 100);
  rotate(radians(j++)); //rotate letters
  textFont (arial);
  textAlign(CENTER, TOP);
  fill(#FFFFFF);
  textSize(18);
  text("fighter within us", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate (530, 80);
  rotate(radians(j++));
  textFont (arial);
  textAlign(CENTER, TOP);
  fill(#FFFFFF);
  textSize(18);
  text("fighter within us", 0, 0);
  popMatrix();
}


  


