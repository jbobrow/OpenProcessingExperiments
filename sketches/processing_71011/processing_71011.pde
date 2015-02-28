
/*****************************************
 * Assignment 02
 * Name:         Colin M Reilly
 * E-mail:       creilly@haverford.edu
 * Course:       CS 110 - Section ##
 * Submitted:    19 September 2012
 * 
 * Starry Night, Cloud Cover and Distant Campfires in the Catskills. This is a simple program: stars are randomly
generated, and clicking on the mountains will produce a campfire, whereas clicking in the sky will produce a cloud.

***********************************************/



void setup() {
  size(500, 500);
  smooth();
  drawBackground();
  
}

void draw() { }

void drawBackground() {

  background(00,00,50);
  
 //stars
 fill(255);
 int j = 500;
 int a = int(random(50));
 for (j = 0; j <= 500; j = a + j) {
   
   fill(255);
   ellipse (j,random(500), 2,2);
 }
 
  
//MOUNTAINS
  ellipseMode(CENTER);
  noStroke();
  fill(0,150,0);
    ellipse(250,500,400, 400);
  fill(50,200,50);
    ellipse(500,500,600,500);
    ellipse(0,500, 800, 300);
  fill(50,150,50);
    ellipse(250,500, 800,150);
  
  
  //ALDER LAKE
  fill(100,100,250);
  ellipse(250,500, 500, 130);
}

//CLOUD & CAMPFIRE

void mousePressed() {
  if (mouseY < 240) {
    fill(150,150,200);
    ellipse(mouseX, mouseY, (105),(20));
    ellipse(mouseX, mouseY - 20, (50), (60));
    ellipse(mouseX - 20, mouseY - 15, 30,30);
  } else if (mouseY > 340 && mouseY < 450) {
    fill(255, 100, 0);
    ellipse(mouseX, mouseY, 5,5);
    ellipse(mouseX, mouseY - 5, 3,10);
   
  }
    
 
  
}

//but why would you want to erase it?
void keyPressed() {
  drawBackground ();
}
