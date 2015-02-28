
//53463247 Young Hiu Ting Assignment 1

int x, y; //declare x and y are integers
float colorR, colorG, colorB, alpha; //declare colorR, colorG, colorB and alpha are floating-point numbers
PFont font; //locate the font in the sketch

void setup(){
  //background setting
  size(600, 600);
  background(255);
  frameRate(10); //set the speed of frame moving
  noStroke();
  smooth();
  
  font=loadFont("Monospaced-32.vlw"); //Create Font
  textAlign(CENTER); //make the align point of the font to be center
  textFont(font, 20); //set font size
}

void draw() {
  //raise a question to ask people to click the screen
  fill(0);
  text("If something is going to happen,", width/2, height/2);
  text("do you have guts to click?", width/2, 330);
  
  fill(255, 150);
  rect (0, 0, width, height);
  
  //set the color and the size of object when a mouse button is pressed
  if (mousePressed == true){
    noStroke();
    
    //use those variables to draw the ellipse with random values
    x = floor(random(200)); 
    y = floor(random(200));
    colorR = random(255);
    colorG = random(255);
    colorB = random(255);
    alpha = random(255);
    fill(colorR, colorG, colorB, alpha);
  }else {
    fill(255); //the color of the object will be white when the mouse is not pressed
  }
  //set the location of ellipse
  ellipse (150, 150, x, y);
  ellipse (450, 150, x,y);
  ellipse (150, 450, x,y);
  ellipse (450, 450, x,y);
}


