
/* @pjs preload="cloud.png"; */ 
PImage cloud;  // Declare variable "a" of type PImage

float x, y;
int browsy = 245;

void setup() {
  size(600, 600);
  background(255);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  cloud = loadImage("cloud.png");  // Load the image into the program
  smooth(); 
} // End setup

void draw() {

  // Constants
  color skin = color(235,205,184);
  
  // Sky 
  fill(158,222,255); 
  noStroke();
  rect(0, 0, 600, 300);
  
  // Land 
  fill(178,161,100); 
  stroke(168,151,90);
  strokeWeight(3);
  rect(0, 300, 600, 300);
  
  // Shirt 
  fill(251,238,37); // yellow
  fill(25,179,58); // green
  strokeWeight(1);
  stroke(15,169,58);
  rect(100, 400, 400, 200, 100, 100, 0, 0);
  stroke(5,159,48);
  line(180, 525, 180, 600);
  line(420, 525, 420, 600);
  
  /* ----- HEAD & NECK -------- */
  
  // Head
  fill(skin);
  noStroke();
  ellipse(300, 250, 250, 300);
  
  // Hair
  stroke(205,175,154);
  noFill();
  strokeWeight(5);
  arc(300, 250, 250, 300, PI, TWO_PI);
  
  // Neck
  fill(skin);
  stroke(5,159,48);
  strokeWeight(5);
  ellipse(300, 415, 100, 60);
  noStroke();
  rect(255, 360, 90, 60);
  
  // Left Ear
  fill(skin);
  noStroke();
  ellipse(180, 265, 35, 75);
  
  // Right Ear
  fill(skin);
  noStroke();
  ellipse(420, 265, 35, 75);
  
  /* ----- FACE-------- */
  //Mouth
  fill(255);
  noStroke();
  ellipse(300, 330, 100, 60);
  
  fill(skin);
  noStroke();
  ellipse(300, 320, 110, 50);
  
  // Left Eye
  fill(255);
  noStroke();
  ellipse(255, 260, 40, 20);
  
  fill(102,113,100);
  noStroke();
  ellipse(255, 260, 20, 20);
  
  fill(0);
  noStroke();
  ellipse(255, 260, 5, 5);
  
  fill(255);
  noStroke();
  ellipse(257, 257, 3, 3);
  
  
  // Right Eye
  fill(255);
  noStroke();
  ellipse(345, 260, 40, 20);
  
  fill(102,113,100);
  noStroke();
  ellipse(345, 260, 20, 20);
  
  fill(0);
  noStroke();
  ellipse(345, 260, 5, 5);
  
  fill(255);
  noStroke();
  ellipse(347, 257, 3, 3);
  
  // Eye Brows
  stroke(115,79,93);
  strokeWeight(5);
  noFill();
  arc(255, browsy, 50, 20, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // Left
  arc(345, browsy, 50, 20, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // Right
  
  // Nostrils
  fill(205,175,154);
  noStroke();
  ellipse(283, 320, 12, 2); // Left
  ellipse(317, 320, 12, 2); // Right
  
  // Nose
  stroke(205,175,154);
  strokeWeight(1.5);
  noFill();
  arc(300, 315, 60, 40, PI+HALF_PI+QUARTER_PI, TWO_PI); // Left
  arc(300, 315, 60, 40, PI, PI+QUARTER_PI); // Right
  
  /* ----- CLOUDS-------- */
  // Movement from: http://processing.org/learning/basics/translate.html
  x = x + 0.1;
  
  if (x > width + 800) {
    x = 0;
  }
  translate(x, 0);
  image(cloud, -cloud.width, 10, cloud.width, cloud.height);
  image(cloud, -300, 0, cloud.width/2, cloud.height/2);
  image(cloud, -490, 40, cloud.width/1.5, cloud.height/1.5);
  image(cloud, -670, 30, cloud.width/2, cloud.height/2);
  image(cloud, -850, 5, cloud.width/1.5, cloud.height/1.5);

} // End draw

void mouseClicked() {
  if (browsy == 245) {
    browsy = 240;
  } else {
    browsy = 245;
  }
} // End mouseClicked



