
PFont font;
float circle1X;
float circle1Y;
float circle2X;
float circle2Y; 
float diameter;
int value1;
int value2;
int xPos ;

void setup(){
  size(800,500);
 
  diameter=100;
  font = loadFont("AvenirNextCondensed-DemiBoldItalic-15.vlw");
  circle1X= width/4;
  circle1Y= 2*height/5;
  circle2X= 3*width/4;
  circle2Y= 2*height/5;
  xPos = 400;
  value1 = 0;
  value2 = 0;
}

void draw(){
    background(0);
  
   ellipse(circle1X, circle1Y, diameter, diameter);
   ellipse(circle2X, circle2Y, diameter, diameter);
  
  
  
  
  if(value2==2){

    
   fill(255);
   textAlign(CENTER);
   textFont(font);
   text("Your are dead",xPos,height/2);
   
  
    
  }
  else if (value1==1) { 
    
     fill(255);
     textAlign(CENTER);
     textFont(font);
     text("You are going to die", xPos,height/2);
  }
   
   fill(0);
   textAlign(CENTER);
   textFont(font);
   text("yes",200,200);
   
   fill(0);
   textAlign(CENTER);
   textFont(font);
   text("no",600,200);
   
    fill(255);
    textAlign(CENTER);
    textFont(font); 
    text ("Are you  alive ", width/2,50);
} 
void mousePressed(){
  
  //dist(x1, y1, x2, y2) calculates the distance btwn 2 points
  
  //if button one is off (i.e. value1 is equal to zero) AND the distance
  //between the center of circle1x and the mouse position, turn the first
  //button on (i.e. change value1 to 1) 
  if (value1 == 0 && dist(mouseX, mouseY, circle1X, circle1Y)<diameter/2) {
    value1 = 1;
  } 
  //if above conditional is false, turn the button off
  else {
    value1 = 0;
  }
  
  
  //this is the SAME logic as above, but it is for the second button
  if (value2 == 0 && dist(mouseX, mouseY, circle2X, circle2Y)<diameter/2) {
    value2 = 2;
  } else {
    value2 = 0;
  }
  
  
}


