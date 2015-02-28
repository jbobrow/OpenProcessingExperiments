
PFont font;
float y = 0.0;
float x = 25;
float x2 = 15;
float x3 = 0;
float y2 = 0.0;
//variables

void setup(){
  size(250,250);
  smooth();
  font=loadFont("HelveticaCY-Oblique-48.vlw");
  background(255);
  textFont(font);
}

void draw(){
  fill(0,12);
  rect(0,0,width,height);
  //black background
  
  noFill();
  strokeWeight(0.5);
  x += 20;
  x2 += 10;
  x3 += 5;
  y2+=-5;
  //increasing values of variables
 
  stroke(200,y);
  ellipse(pmouseX, pmouseY, x, x);
   
  stroke(150,y);
  ellipse(pmouseX, pmouseY, x2, x2);
   
  stroke(100,y);
  ellipse(pmouseX, pmouseY, x3, x3);
  //circles expanding around postal code 
  
  fill(y,y,y,100);
  textSize(20);
  text("M2H1J1",mouseX-30,mouseY);
  //postal code following the mouse

}

void mouseMoved(){
  y=random(0,200);
  //fill of the text is randomized when moved
  x = 0;
  x2 = 0;
  x3 = 0;
  //when mouse is moved, circle starts from the centre again

}


