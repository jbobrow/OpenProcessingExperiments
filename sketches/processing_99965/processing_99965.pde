
PImage pencil;
PImage park;
PImage school;
int x, y; //used to determine and change position of ellipse drawing tool
color strokecolor;
int strokesize;
//used in keyPressed and keyReleased to move ellipse
//set at false for now to keep ellipse from moving
boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;
boolean drawEllipse; //used to create/delete an ellipse used as drawing tool
PFont strokeFont; //used later to create a text title


void setup() {
  size(600, 600);
  background(255);
  strokeFont = createFont("Arial", 30, true);//font used for text later on
  stroke(0);
  strokeWeight(5);
  park = loadImage("park.jpeg");
  school = loadImage("schoolbackground.jpg");
  pencil = loadImage("pencilsprite1.png");

  cursor(pencil, mouseX, mouseY); //sets the cursor as a pencil
  x = width/2; //used for ellipse drawing tool position
  y = height/2;//^
}
// used later in mouseClicked() to determine distance from mouse to palettes/ellipses
float Distance(float x1, float x2, float y1, float y2) {
  float d = (float)Math.sqrt((x2 - x1)*(x2-x1) + (y2 - y1)*(y2-y1));
  return d;
} //learned from Andy Toy, who learned from a website (keyPressed and keyReleased)
//if key is released, set boolean to false to stop moving ellipse
void keyReleased() {
  if (key == CODED) {
    if (keyCode == DOWN) down = false;
    if (keyCode == RIGHT) right = false;
    if (keyCode == LEFT) left = false;
    if (keyCode == UP) up = false;
  }
}
//if key is pressed, set boolean to true to move ellipse
void keyPressed() {
  if (key== CODED) {
    //strokeWeight(5);
    if (keyCode == DOWN) down = true;  
    if (keyCode == RIGHT) right = true;
    if (keyCode == UP)  up = true;
    if (keyCode == LEFT) left = true;
  }
}
void mouseClicked() {
  frameRate(1000);
  //check if mouse close enough to palette by using Distance method
  //if yes, click on palette to change color and stroke size
  if (Distance(30, mouseX, 80, mouseY) <= 25) strokecolor = color(255,0,0); 
  if (Distance(80, mouseX, 80, mouseY) <= 25) strokecolor = color(255, 165, 0);
  if (Distance(130, mouseX, 80, mouseY) <= 25) strokecolor = color(255, 255, 0);
  if (Distance(180, mouseX, 80, mouseY) <= 25) strokecolor = color(0, 128, 0);
  if (Distance(230, mouseX, 80, mouseY) <= 25) strokecolor = color(0, 0, 255);
  if (Distance(280, mouseX, 80, mouseY) <= 25) strokecolor = color(128, 0, 128);
  if (Distance(330, mouseX, 80, mouseY) <= 25) strokecolor = color(165, 42, 42);
  if (Distance(380, mouseX, 80, mouseY) <= 25) strokecolor = color(0);
  if (Distance(430, mouseX, 80, mouseY) <= 25) strokecolor = color(255);
  if (Distance(530, mouseX, 100, mouseY) <= 25) strokesize = 3;
  if (Distance(530, mouseX, 140, mouseY) <= 25) strokesize = 7;
  if (Distance(530, mouseX, 180, mouseY) <= 25) strokesize = 12;


  if (keyPressed == true) {
    if (key == 'c') {
      strokeWeight(strokesize);
      stroke(strokecolor);
      ellipse(mouseX, mouseY, 70, 70);
    }
    else if (key == 'b') {
      strokeWeight(strokesize);
      stroke(strokecolor);
      rect(mouseX, mouseY, 70, 70);
    }
    else if ( key == 't') {
      strokeWeight(strokesize);
      stroke(strokecolor);
      triangle(mouseX+50,mouseY-50, mouseX-50, mouseY+50,mouseX-50,mouseY-50);
    }
  }
}  


void draw() {
  textFont(strokeFont, 38);
  fill(24, 167, 181);
  text("Stroke", 480, 30);
  text("Sizes", 485, 70);
  text("TASTE THE RAINBOW", 30,30);
  if ( drawEllipse ) { 
    fill(0);
    stroke(strokecolor); 
    strokeWeight(strokesize);
    ellipse(x, y, 15, 15);
  }

  if (keyPressed) {
    frameRate(50);
    //if ellipse x and y position is trying to go out of border, 
    //make it "seem" like it's stopping
    //learned from http://studio.processingtogether.com/sp/pad/export/ro.9bY07S95k2C2a/latest
    if(x > width ) x = width - width/1000;
    if(y > height) y = height - height/1000;
    if(x < width/1000) x = width/1000;
    if(y < height/1000) y = height/1000;
    
    
    //makes an ellipse to be used to draw with arrow keys if n is pressed
    if (key == 'n') drawEllipse = true;
    //deletes the ellipse if m is pressed
    if (key == 'm') drawEllipse = false;
    //moves ellipse diagonally northeast
    if (up == true && right == true ) {
      x++;
      y--;
    }
    //moves the ellipse diagonally northwest 
    else if (up == true && left == true) {
      x--;
      y--;
    }
    //moves the ellipse diagonally southwest
    else if (down == true && left == true) {
      x--;
      y++;
    }
    //moves the ellipse diagonally southeast
    else if (down == true && right == true) {
      x++;
      y++;
    }
    //moves the ellipse down
    else if (down == true) {
      y++;
    }
    //moves the ellipse up
    else if (up == true) {
      y--;
    }
    //moves the ellipse right
    else if (right == true) {
      x++;
    }
    //moves the elipse left
    else if (left == true) {
      x--;
    }
  }


  //ellipseMode(CENTER) sets the origin coordinates of the
  //ellipse to the center; used for Distance method
  //strokesize choice 1
  ellipseMode(CENTER);
  strokeWeight(1);
  stroke(0);
  fill(24, 167, 181);
  ellipse(530, 100, 20, 20);
  //strokesize choice 2
  ellipseMode(CENTER);
  stroke(0);
  fill(24, 167, 181);
  ellipse(530, 140, 30, 30);
  //strokesize choice 3
  ellipseMode(CENTER);
  stroke(0);
  fill(24, 167, 181);
  ellipse(530, 190, 40, 40);
  //red palette
  stroke(24, 167, 181);
  ellipseMode(CENTER);
  fill(255, 0, 0);
  ellipse(30, 80, 50, 50);
  //orange palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);  
  fill(255, 165, 0);
  ellipse(80, 80, 50, 50);
  //yellow palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);  
  fill(255, 255, 0);
  ellipse(130, 80, 50, 50);
  //green palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);
  fill(0, 128, 0);
  ellipse(180, 80, 50, 50);
  //blue palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);
  fill(0, 0, 255);
  ellipse(230, 80, 50, 50);
  //purple palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);
  fill(128, 0, 128);
  ellipse(280, 80, 50, 50);
  //brown palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);
  fill(165, 42, 42);
  ellipse(330, 80, 50, 50);
  //black palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);
  fill(0);
  ellipse(380, 80, 50, 50);
  //white palette
  ellipseMode(CENTER);
  stroke(24, 167, 181);
  fill(255);
  ellipse(430, 80, 50, 50);
  //draws lines at mouse position while mouse is pressed
  if (mousePressed == true) { 
   strokeWeight(strokesize); 
   stroke(strokecolor);
   line(pmouseX, pmouseY, mouseX, mouseY);
  }
//change background
  if (keyPressed == true) {
    if (key == 'a') {
      background(0);
    } 
    else if (key == 's') {
      background(park);
    }
    else if (key == 'd') {
      background(school);
    }
    else if (key == 'r') {
      background(255);
    }
  }
}


