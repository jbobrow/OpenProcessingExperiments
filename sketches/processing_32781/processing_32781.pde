
//thanks, SAM!!//


int xpos, ypos;  
//boolean x = true;
int ballMove;

void setup() {

  size(400, 400);
  noStroke();
  smooth();
  // The starting position of the shape
  xpos = width/2;
  ypos = 0;
}


void draw() {

  background(250, 150, 180);
  ellipse(xpos, ypos, 30, 30);
  //ballMove = ypos+10;

  if (ypos < height) {
    ypos = ypos+10;
  }

  else {
    ypos = ypos-10;
  }











  //*** 

  //  if (ballState <= height) {
  //    ypos = ballMove+10;
  //  }
  //  
  //  if (ballState >= 0) {
  //    ypos = ballMove-10;
  //  }



  //***




  //  for (int ypos = 0; ypos <= height; ypos=ypos+1) 
  //{
  //  if (ypos < height) {
  //    x = true;
  //  } else {
  //    x = false;
  //  }



  //***


  //  for (int ypos = 0 ; ypos <= height; ypos=ypos+1) { 
  //
  //    ellipse(xpos, ypos, 30, 30);
  //    
  //    println(DOWN);
  //  }
  //
  //
  //  for (int ypos = height ; ypos >= 0; ypos=ypos-1) { 
  //
  //    ellipse(xpos, ypos, 30, 30);
  //    
  //    println(UP);
}






