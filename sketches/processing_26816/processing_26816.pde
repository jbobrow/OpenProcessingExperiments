
//Louisa McMullan z3292111 2011


//DECLARATIONS
int r, g, b;
int value = 0;
Boolean cloud;

//INITIAL SETTINGS
void setup() {
  size(600, 400);
  frameRate(30);
  smooth();
  r = 0;
  g = 20;
  b = 50;
  cloud= false;
}

//REPEAT
void draw() { 
  //draw a background that changes colour for night and day
  background(r, g, b);
  b = int(map(mouseX, 0, width, 10, 255));
  g = int(map(mouseX, 0, width, 0, 255));
    
  // mouse to left hand side = moon appears and background gets dark
  if(mouseX < width/2) {
   fill(value);
    noStroke();
    ellipse (200, 100, 80, 80);
    
  //place stars and make them twinkle using random colours
    if(mouseX < 450) {
    drawStars();
}
    
  //mouse to right hand side = sun appears (cloud appears when clicked and is cleared when key pressed)
  } else if (mouseX> width/2){
    fill(255, 217, 0);
    smooth();
    noStroke ();
    drawSun();
    if (cloud==true){
    drawCloud();
    
  }
  }
}

//EVENT HANDLERS

   void mousePressed(){
  cloud= true; 
}
  
  void keyPressed(){
  cloud= false;  
  }
  
void mouseMoved() {
  value = value + 5;
if (value > 255) {
    value = 254;
  }
}

  
//CUSTOM FUNCTIONS
//Draw functions for the sun
void drawSun(){
ellipse(400, 100, 80, 80);
}

//Draw functions for the cloud
void drawCloud(){
 fill(255);
 noStroke();
 ellipse(mouseX, mouseY, 60, 60);
 ellipse(mouseX-60, mouseY-10, 60, 60);
 ellipse (mouseX-20,mouseY-20,60,60);
 ellipse(mouseX-40,mouseY+10 ,60,60);
 ellipse(mouseX-85, mouseY, 50,50);
}
void drawStars(){
  stroke(100 + random(156));
point(30, 320);
point(50, 90);
point(404, 389);
point(230, 50);
point(565, 294);
point(256, 253);
point(497, 183);
point(190, 320);
point(472, 286);
point(115, 126);
point(356, 108);
point(274, 303);
point(121, 282);
point(565, 83);
point(427, 77);
point(342, 205);
}




