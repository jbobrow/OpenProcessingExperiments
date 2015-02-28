
/*
Lines with random size circles
adalau85@gmail.com
October 4, 2009
*/

float ranCircle;

void setup() {
  size(500,500);
  background(0);
  smooth();
};

void draw() {
  
  //press delete will refresh the screen
  if(keyCode==BACKSPACE) {
    background(0);
  };
  
  //line will be drawn when mouse is pressed
  if(mousePressed) {
    //draw lines
    stroke(255,20,147,50);
    line(100,100,mouseX,mouseY);
    stroke(255,255,0,10);
    line(240,100,mouseX,mouseY);
    stroke(255,20,120,50);
    line(400,250,mouseX,mouseY);
    stroke(173,255,47,50);
    line(100,400,mouseX,mouseY);
    stroke(255,255,0,50);
    line(250,400,mouseX,mouseY);
    stroke(230,230,250,50);
    line(400,100,mouseX,mouseY);
    stroke(233,233,240,50);
    line(100,250,mouseX,mouseY);
    stroke(255,255,0,50);
    line(400,400,mouseX,mouseY); 
  }
};

void mouseMoved(){
  
  ranCircle = random(30);
 //when mouse move, a transparent white circle
 //will display in the center
 fill(255,255,255,50);
 ellipse(mouseX,mouseY,ranCircle,ranCircle); 
 
};


