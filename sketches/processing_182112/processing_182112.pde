
void setup() {  
  size(1000, 1000);
  noStroke(); 
}

void draw() {
  background(0);
  fill(#CB8369) ;
  for (int i=1; i<500; i++) { 
  for (int j=1; j<500; j++) {    
    rect(20*i, 20*j, 5, 5) ; 
  }
}

  fill(#AD15EA);
  ellipse(500, 300, 130, 200);

  fill(#FFFFFF);
  ellipse(500, 240, 30, 30);
  
  fill(#080708);
  ellipse(505, 247, 15, 15);
  
  fill(#FFFFFF);
  ellipse(470, 280, 30, 30);
  
  fill(#FFFFFF);
  ellipse(530, 280, 30, 30);
  
  fill(#080708);
  rect(468, 265, 4, 30);
  
  fill(#080708);
  rect(528, 265, 4, 30);
  
  fill(#F51B38);
  ellipse(500, 350, 60, 100);
  
  fill(#FAF7F8);
  triangle(474, 323, 483, 325, 477, 317);
  
  fill(#FAF7F8);
  triangle(525, 325, 515, 325, 522, 317);
  
  fill(#5615AD);
  ellipse(450, 215, 25, 25);
  
  fill(#5615AD);
  ellipse(430, 200, 25, 25);
  
  fill(#5615AD);
  ellipse(550, 215, 25, 25);
  
  fill(#5615AD);
  ellipse(570, 200, 25, 25);
  
  fill(#FAF7F8);
  triangle(477, 382, 483, 381, 480, 389);
  
  fill(#FAF7F8);
  triangle(524, 382, 516, 381, 520, 389);
  
   //  fill(255) ;
      text(mouseX + ", " + mouseY, 150, 150) ;
  
}



