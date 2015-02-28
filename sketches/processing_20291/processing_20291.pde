
void drawText () {
  
  textAlign(LEFT);  
  textFont(font1, 14);
  
  int lineheight = 18;
  
  fill(225, 160);

  text("Drag or Click to add Predators !", 10, 30);
  text("(a) to add a Predator (hold to add more) !", 10, 20+2*lineheight);
  if (eat) {
    text("(s) to    STOP    EATing !", 10, 20+4.5*lineheight);
  } 
  else {
    text("(s) to   START   EATing !", 10, 20+4.5*lineheight);
  }
  text("(space) to clean the Battlefield !", 10, 20+3*lineheight);
  text("All from A53@SA@THU", 10, 20+10*lineheight);
  
  textSize(10);
  text("Acknowledgements:", 10, 20+9*lineheight);

  text("Reference: Processing Workshop", 10, 25+11*lineheight);
  text("@ Alberta College of Art + Design", 10, 25+12*lineheight);
  text("11/11/2010   Chenghan.Y", 10, 25+13*lineheight);

  textFont(font2, 32);
  text( "YUMMY! 5.3", 10, 20+7*lineheight );
}


