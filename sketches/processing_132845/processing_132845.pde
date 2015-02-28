
PFont aFont;

String leftString = "You are clicking left";
String rightString = "You are clicking right";

void setup() {
  size(500, 350);
  aFont = createFont("Arial",40,true);
}

void draw() { 
  background(180,180,255);
  fill(0,0,120);
  textFont(aFont);         
 
 textSize(20);
 text("Click on either the left or right side",15,125);

      
  if(mousePressed) {
   fill(0,0,120);
   
   if (mouseX > 250) {
    fill(120,0,0);
    text(rightString,100,300);
    text(mouseX + "," + mouseY,mouseX,mouseY);
   }  else  {
     text(leftString,100,300);
     text(mouseX + "," + mouseY,mouseX,mouseY);
   }
   
 
  }
  
  // noLoop();
  
  }
