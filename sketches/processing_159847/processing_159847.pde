
void setup() {
  size(500, 500) ;
}

void draw() {

  background(50) ; 

  fill(255) ; 
  // this is my pattern
  for (int y = 0; y < 30; y++) {
    for (int x = 0; x < 30; x++) {
      rect(30*x, 30*y, 10, 10) ;
    }
  }
  // end of pattern

  // here is where your monster code could be !
  //eyes
 fill(#FF0000);
ellipse(150, 130, 120, 120);
 
fill(#FF0000);
ellipse(330, 125, 120, 120);
 
 fill(#0A0A0A);
ellipse(150, 130, 80, 80);
 
fill(#0A0A0A);
ellipse(330, 125, 80, 80);

// mouth  
    fill(#030303) ;
    arc(250, 325, 200, 100, 0, PI - 0);
    
//teeth
fill(#FF0000) ;
triangle(190, 325, 240, 450, 220, 325) ;
fill(#FF0000) ;
triangle(265, 325, 264, 450, 295, 325) ;


//eyebrows   
    fill(#0A0A0A) ;
    rect(130, 64, 60, 15) ;
    fill(#0A0A0A) ;
    rect(295, 62, 60, 15) ;
    
fill(#0A0A0A);  
rect(185, 75, 20, 20);
fill(#0A0A0A);  
rect(277, 73, 20, 20);

fill(#0A0A0A);  
rect(201, 95, 15, 15);
fill(#0A0A0A);  
rect(265, 94, 15, 15);

fill(#0A0A0A);  
rect(120, 52, 15, 15);
fill(#0A0A0A);  
rect(350, 50, 15, 15);

 //nostrils
  stroke(0);
  strokeWeight(5);
  line(215, 235, 240, 290);
  line(280, 235, 260, 290);









  // this is a helper area to show your mouse coordinates
  // to help you know where to place objects
  // you can comment this out when you're done with your 
  // monster

  fill(255) ; 
  rect(0, 0, 60, 20) ;
  fill(0) ; 
  text(mouseX + ", " + mouseY, 10, 10) ;
}


