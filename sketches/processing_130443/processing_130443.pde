
int moveX;
int b;

void setup() {
  moveX=0;
  size(700, 700);
}
void draw() {
  moveX++;
  background(#85B7E8);
  fill(0, 200, 0);
  stroke(#8DFAA0);
  strokeWeight(4);
  ellipse(400, 500, 600, 700);
  ellipse(0, 500, 600, 700);

  clouds();

  //chimney 
  fill(139, 69, 19) ;
  quad(150, 215, 150, 75, 180, 50, 180, 200) ;

  //roof
  fill(03, 42, 42) ;
  triangle(50, 250, 550, 250, 300, 75) ;

  //house
  fill(222, 184, 135) ;
  rect(100, 250, 400, 300) ;

  //door
  fill(165, 90, 92) ;
  rect(160, 385, 105, 165) ;
  fill(250, 105, 30);
  rect(175, 400, 75, 150) ;
  fill(255) ;
  ellipse(240, 490, 10, 10) ;  

  //windows
  fill(245, 222, 179) ;
  rect(160, 285, 110, 75) ;
  rect(330, 285, 110, 75) ;
  rect(310, 400, 155, 100) ;
}

void clouds() {
  //Cloud #1
  fill(255);
  ellipse(moveX, 50, 115, 80);
  if(moveX==width+100)
  moveX=-100;
  
   fill(255);
  ellipse(moveX, 90, 140, 40);
  if(moveX==width+100)
  moveX=-100;
 
  
}




