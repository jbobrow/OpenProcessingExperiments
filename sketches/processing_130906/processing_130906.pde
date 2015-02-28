
int moveX;
int b;

void setup() {
  moveX=0;
  size(600, 600);
}
void draw() {
  moveX++;
  background(#C6D5F2);
  fill(0, 200, 0);
  stroke(0);
  strokeWeight(4);
  rect(0, 500, 600, 700);
 
  clouds();
  
  //Chimney
  fill(#980F0F) ;
  rect(180, 60, 50, 200) ;
  
   //Roof
  fill(#30392D) ;
  triangle(50, 250, 550, 250, 300, 75) ;
   
  //Main
  fill(#93680A) ;
  rect(100, 250, 400, 300) ;
    
  //Door
  fill(#581424);
  rect(400, 400, 75, 150) ;
  fill(#E0CF12) ;
  ellipse(460, 490, 10, 10) ; 
    
  //windows
  fill(#EBF9FC) ;
  rect(140, 310, 75, 75) ;
  rect(230, 420, 155, 100) ;
  ellipse(300, 285, 50, 50);
}

void clouds() {
  //Cloud
  noStroke();
  fill(255);
  ellipse(moveX, 50, 115, 80);
  if(moveX==width+100)
  moveX=-100;
  
  noStroke();
  fill(255);
  ellipse(moveX, 70, 140, 50);
  if(moveX==width+100)
  moveX=-100;
}



