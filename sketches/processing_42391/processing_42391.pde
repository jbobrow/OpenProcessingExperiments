
PFont toggleFont;
String hey;
color ballOne;
color ballTwo;

void setup( ) {
  size (600, 600);
  toggleFont = loadFont ("toggleFont_80.vlw");
  hey = "Hey there!";
  ballOne = color(#5A30D1);
  ballTwo = color (0, 240, 25);
  
}


void draw ( ) {
 
  background (20, 100, 50);
  stroke (8);
  textFont (toggleFont, 60); 
  text (hey, mouseX, 200); 
  if (mouseY > 200) {
    hey =  "What?";
  }else{
    hey = "Hey there!";
  }
   if (mousePressed) {
  hey = "I can't hear you!";
}
fill (ballOne);
ellipse (400, 400, 100, 100);

if (dist (mouseX, mouseY, 400, 400) < 50) {
  ballOne = color (200, 10, 70); 
}else{ ballOne = color (#5A30D1); }

  
  fill (ballTwo);
  ellipse (200, 500, 150, 150);
  if (dist (mouseX, mouseY, 200, 500) < 50) {
    ballTwo = color (200, 10, 70);
  }else{ ballTwo = color(0, 240, 25); }
  
  

}


                
                
