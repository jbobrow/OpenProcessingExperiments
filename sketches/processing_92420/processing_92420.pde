
/* @pjs font = "Sanchez-Regular.ttf"; */

int myState = 0 ;
PFont myFont ;

void setup() {
size (500, 500) ;
background (#110022) ;
  myFont = createFont("Sanchez-Regular.ttf", 30);
    textFont(myFont);
    textAlign(CENTER); 
    text("Learn the phases of the Moon", width/2, height/20);
    text("click the mouse to continue", width/2, height/10);
}

void draw(){
  
  switch(myState) {
    
  case 0:
  background (#110022) ;
  textFont(myFont, 25);
  fill(255);
  text("This is a New Moon", width/2, 8*height/10);
  fill(0);
  ellipse (width/2, height/2, 200, 200);
  
  
  break ;
  
  case 1:
  background (#110022) ;
  textFont(myFont, 25);
  fill(255);
  text("This is a Waxing Crescent", width/2, 8*height/10);
  fill(255);
  arc(width/2, height/2, 100, 200, 3*PI/2, PI/2, PIE);

  
    break ;
    
  case 2:
  background (#110022) ;
  textFont(myFont, 25);
  text("This is a First Quarter", width/2, 8*height/10);
  fill(255);
  arc(width/2, height/2, 200, 200, 3*PI/2, PI/2, PIE);

  
    break ;   
 
  case 3:
  background (#110022) ;
  textFont(myFont, 25);
  text("This is a Waxing Gibbous", width/2, 8*height/10);
  fill(255);
  arc(width/2, height/2, 250, 200, 3*PI/2, PI/2, open);

  
    break ;
    
  case 4:
  background (#110022) ;
  textFont(myFont, 25);
  text("This is a Full Moon", width/2, 8*height/10);
  fill(255);
  ellipse (width/2, height/2, 200, 200);
    
  break ;  

  case 5:
  background (#110022) ;
  textFont(myFont, 25);
  text("This is a Waning Gibbous", width/2, 8*height/10);
  fill(255);
  arc(width/2, height/2, 250, 200, PI/2, 3*PI/2, open);

  
    break ;
  
  case 6:
  background (#110022) ;
  textFont(myFont, 25);
  text("This is a Third Quarter", width/2, 8*height/10);
  fill(255);
  arc(width/2, height/2, 200, 200, PI/2, 3*PI/2, PIE);

  
    break ;
    
  case 7:
  background (#110022) ;
  textFont(myFont, 25);
  text("This is a Waning Crescent", width/2, 8*height/10);
  fill(255);
  arc(width/2, height/2, 100, 200, PI/2, 3*PI/2, PIE);
  
}
}
void mousePressed (){
  myState++ ;
  if (myState > 8) {
    myState = 0;
  }
}


