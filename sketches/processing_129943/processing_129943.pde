
void setup() {
  size(750, 750) ;
  background(255) ;
  
}  

void draw() {
  println(mouseX + ", " + mouseY) ;
  
  
  
  
  
  fill(255, 0, 0) ;
 ellipse(400, 500, 350, 350) ;
  
  fill(255, 0, 0) ;
  ellipse(400, 215, 300, 300) ;
  
  fill(0) ;
  arc(230, 680, 225, 225, PI, TWO_PI) ;
  
  fill(0) ;
  arc(580, 680, 225, 225, PI, TWO_PI) ;
  
  fill(0) ;
  rect(350, 250, 100, 10) ;
  
  fill(255) ;
  triangle(427, 260, 437, 245, 449, 260) ;
  
  fill(#FFF700) ;
  ellipse(320, 180, 75, 75) ;
  
  fill(#FFF700) ;
  ellipse(480, 180, 75, 75) ;
  
  
 
}


