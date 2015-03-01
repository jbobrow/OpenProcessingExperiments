
void setup() {
     size (600, 600);
     background(#ED2940);
     strokeWeight(4);

  }

 void draw() {
        fill(255);
  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 500; j++) {
        ellipse(20*i, 20*j, 10, 10) ;
        text(mouseX + ", " + mouseY, 20, 20);

    }
  }
  // head
  noStroke();
  fill(#000000) ;
  ellipse(300, 280, 500, (550)) ;
  fill(#FFFFFF) ;
  ellipse(300, 280, 350, (550)) ;
  //eyes
  fill(0);
  ellipse(250, 200 , 20, 20);
  fill(0);
  ellipse(350, 200 , 20, 20);
  //eyebrows
  fill(#ED2940) ;
  rect(200, 140, 80, 30) ;
  fill(#ED2940) ;
  rect(320, 140, 80, 30) ;
  //tooth
  fill(0) ;
  triangle(230, 300, 244, 500, 265, 300) ;
  fill(0) ;
  triangle(370, 300, 356, 500, 335, 300) ;
// mouth  
  fill(0) ;
  rect(150, 300, 304, 10);
//feet
  fill(#FFFFFF) ;
  rect(250, 550, 10, 70);
  fill(#FFFFFF) ;
  rect(343, 550, 10, 70);
  
 }
  
 


  
   

   



