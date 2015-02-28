
/*
  I plan for this segment to create a button that centers an image on a point.
  
*/

int xlp,ylp ; //image location position

void centerbutton(){
  xlp = 0;
  ylp = 0;
  textSize(24);
  noStroke();
  
  fill(150);
  rect(width/3,0,width/3,height/10);
  fill(255);
  text("center on location" ,width/3 ,0 ,200,100);
}

