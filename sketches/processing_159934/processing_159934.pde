
void setup () {
  size(500, 500) ;

}

void draw() {
background(255) ;

fill(255) ;
//this is the pattern
for (int y = 0 ; y < 30; y++) {
for (int x = 0 ; x < 30 ; x++) {
  ellipse(50*x, 50*y , 10, 10) ;
    }
  }
fill(255, 0, 0) ;
   triangle(220, 55, 250, 10, 280, 55) ;
   rect(60, 270, 80, 30) ;
   rect(350, 270, 90, 30) ;
  rect(195, 340, 30, 100) ;
   rect(275, 340, 30, 100) ;
   rect(175, 440, 50, 30) ;
   rect(275, 440, 50, 30) ;
   
  ellipse(250, 200, 300, 300) ;
  
  
  

  
  fill(255, 255, 255) ;
  ellipse(250, 145, 100, 100) ;
 
  
   fill(0) ;
   rect(214, 265, 75, 40);
  ellipse(250, 160, 50, 50) ;
  rect(0, 470, width, 30) ; 
    fill(255, 255, 255) ;
    rect(232, 265, 40, 20);

//shows coordinates
/*fill(255) ;
rect(0, 0, 65, 20) ;
fill(0) ;
text(mouseX + ", " + mouseY, 10, 10) ;*/
}





