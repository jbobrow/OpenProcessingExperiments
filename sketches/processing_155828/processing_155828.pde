
/*
Day01_Assignment_By_Katherine_Louise_Boehm
 Creating a Simple Character
 Space Fisherman
 */


//NEW CODE!!!!!!

float moonX = 500;
float moonY = 800;
int moonWidth = 600;
int moonHeight = 600;
//int moonX;
int strokeColor = 0;
int strokeWeight = 0;

//CRATERS

float crater1X = 400;
float crater1Y = 600;
int crater1Width = 50;
int crater1Height = 40;

//float crater2X = 300;
//float crater2Y = 725;
//int crater2Width = 70;
//int crater2Height = 50


//NEW CODE!!!!!
  color c = color(0, 244, 255);
  color d = color(255);

int change = 5;


////NEW CODE!!!!!!!!
  void setup() {
  size(1000, 800);
  

  frameRate(30);
}


//NEW CODE!!!!!!!
void draw() {
  background(255);

  //NEW CODE!!!!!!!
  println("It worked! Way to go Homeslice!");

  //Draw the moon
  //NEW CODE!!!!!!!!!!

stroke(strokeColor, strokeColor/2, strokeColor/4);
strokeWeight(mouseX*0.1);
fill(227, 227, 227);
ellipse(moonX, moonY, moonWidth, moonHeight); 
//  stroke(52, 49, 49);
//  strokeWeight(10);
//  smooth();
//  ellipse(500, 800, 600, 600);

//NEW CODE!!!!!!!!!
moonX += change;
println(moonX);
moonY = moonY + change*1.3;
moonWidth = moonWidth + change*7;
moonHeight = moonHeight + change;

strokeColor = strokeColor += change/1;
strokeWeight = strokeWeight + change/1;

  //Moon Craters

  //NEW CODE!!!!!
  fill(c);
  //stroke(d);
  //fill(52, 49, 49);
  ellipse(crater1X, crater1Y, crater1Width, crater1Height);
  //ellipse(400, 600, 50, 40);
  //ellipse(crater2X, crater2Y, crater2Width, crater2Height);
  ellipse(300, 725, 70, 50);
  ellipse(600, 675, 70, 50);
  ellipse(675, 800, 100, 80);
  ellipse(600, 550, 30, 20);

//CRATER 1
crater1X += change;
println(crater1X);
crater1Y = crater1Y + change*0.1;
crater1Width = crater1Width + change;
crater1Height = crater1Height + change;

//CRATER 2
//crater2X += change;
//println(crater2X);
//crater2Y = crater2Y + change*0.1;
//crater2Width = crater2Width + change;
//crater2Height = crater2Height + change;

  //NEW CODE!!!!!!!! ANIMATION

  //Draw the Astronaut Body

  //Body
  fill(229, 227, 227);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!!!!!
  ellipse(mouseX, mouseY, 220, 180);
  //ellipse(500, 410, 220, 180);

  //Left Button

  fill(136, 209, 116);
  stroke(255);
  strokeWeight(2);
  //NEW CODE!!!!!!!
  ellipse(mouseX - 25, mouseY + 40, 25, 25);
  //ellipse(475, 450, 25, 25);

  //Right Button

  fill(136, 209, 116);
  stroke(255);
  strokeWeight(2);
  //NEW CODE!!!!!!
  ellipse(mouseX + 25, mouseY + 40, 25, 25);
  //ellipse(525, 450, 25, 25);

  //Line

  fill(255);
  stroke(136, 209, 116);
  strokeWeight(4);
  //NEW CODE!!!!!!!
  rect(mouseX - 15, mouseY + 30, 30, 20);
  //rect(485, 440, 30, 20);


  //Draw the Astronaut Feet

  //Left Foot

  fill(191, 187, 187);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!!!!
  ellipse(mouseX - 50, mouseY + 90, 30, 60);
  //ellipse(450, 500, 30, 60);

  //color

  noFill();
  stroke(136, 209, 116);
  strokeWeight(3);
  smooth();
  //NEW CODE!!!!!!!!
  ellipse(mouseX - 50, mouseY + 90, 25, 55);
  //ellipse(450, 500, 25, 55);

  //Right Foot

  fill(191, 187, 187);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!!!!!
  ellipse(mouseX + 50, mouseY + 90, 30, 60);
  //ellipse(550, 500, 30, 60);

  //color

  noFill();
  stroke(136, 209, 116);
  strokeWeight(3);
  smooth();
  //NEW CODE!!!!!
  ellipse(mouseX + 50, mouseY + 90, 25, 55);
  //ellipse(550, 500, 25, 55);


  //Draw Astronaut Arms

  //Left Arm

  fill(229, 227, 227);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!!!
  ellipse(mouseX - 125, mouseY - 10, 50, 40);
  //ellipse(375, 400, 50, 40);

  //color

  noFill();
  stroke(136, 209, 116);
  strokeWeight(3);
  smooth();
  //NEW CODE!!!!!!!
  ellipse(mouseX - 125, mouseY - 10, 45, 35);
  //ellipse(375, 400, 45, 35);

  //Right Arm

  fill(229, 227, 227);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!!!!
  ellipse(mouseX + 125, mouseY - 10, 50, 40);
  //ellipse(625, 400, 50, 40);

  //color

  noFill();
  stroke(136, 209, 116);
  strokeWeight(3);
  smooth();
  //NEW CODE!!!!!!!!!
  ellipse(mouseX + 125, mouseY - 10, 45, 35);
  //ellipse(625, 400, 45, 35);


  //Draw Astronaut Head

  //Helmet

  fill(229, 227, 227);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!!
  ellipse(mouseX, mouseY - 110, 250, 250);
  //ellipse(500, 300, 250, 250);

  //Helmet Stripe

  stroke(136, 209, 116);
  strokeWeight(3);
  //NEW CODE!!!!!!
  ellipse(mouseX, mouseY - 110, 245, 245);
  //ellipse(500, 300, 245, 245);

  //Helmet Glass

  fill(239, 208, 207);
  stroke(111, 102, 102);
  strokeWeight(6);
  smooth();
  //NEW CODE!!!!
  ellipse(mouseX, mouseY - 110, 215, 215);
  //ellipse(500, 300, 215, 215); 


  //Draw Astronaut Face

  //Left Eye

  fill(255);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  //NEW CODE!!!!!
  ellipse(mouseX - 50, mouseY - 130, 75, 100);
  //ellipse(450, 280, 75, 100);

  //Left Pupil

  fill(3, 1, 0);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  //NEW CODE!!!!!!!
  ellipse(mouseX - 50, mouseY - 105, 35, 45);
  //ellipse(450, 305, 35, 45);

  //Right Eye
  fill(255);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  //NEW CODE!!!!!!!
  ellipse(mouseX + 50, mouseY - 130, 75, 100);
  //ellipse(550, 280, 75, 100);

  //Right Pupil

  fill(3, 1, 0);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  //NEW CODE!!!!!!!!
  ellipse(mouseX + 50, mouseY - 105, 35, 45);
  //ellipse(550, 305, 35, 45);

  //Mouth

  fill(3, 1, 0);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  //NEW CODE!!!!!!!!!!
  ellipse(mouseX - 25, mouseY - 50, 50, 25);
  //ellipse(475, 360, 50, 25);


  //Draw Fisherman Pole

  strokeWeight(5);
  //NEW CODE!!!!!!
  line(mouseX + 150, mouseY - 10, 800, 200);
  //line(650, 400, 800, 200);

  //Fisherman Line
  strokeWeight(1);
  //NEW CODE!!!!!
  //line(mouseX + 300, mouseY - 210, 800, 800);
  line(800, 200, 800, 800);
}

//EXTRA MOUTH 
//NEW CODE!!!!!
void keyPressed() {
  noStroke();
  fill(255, 0, 30);
  stroke(255, 0, 3, 0);
  strokeWeight(4);
  ellipse(mouseX - 25, mouseY - 50, 70, 50);
  
//EXTRA PUPILS

//Left Eye

  fill(255);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  ellipse(mouseX - 50, mouseY - 105, 45, 55);
  
  //Right Pupil

  fill(255);
  stroke(3, 1, 0);
  strokeWeight(4);
  smooth();
  ellipse(mouseX + 50, mouseY - 105, 45, 55);
  
}













