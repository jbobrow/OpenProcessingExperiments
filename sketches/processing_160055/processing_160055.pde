

void setup() {
  size(530, 500) ;
  background(#890C0C) ;
   
} 
 
void draw() {
  println(mouseX + ", " + mouseY) ;
   
   
  fill(#2E1919) ; 
  // this is my pattern
  for (int y = 0; y < 30; y++) {
    for (int x = 0; x < 30; x++) {
      ellipse (30*x, 30*y, 20, 20) ;
    }
  }
   
     fill(#F7CDCD) ; // SKULL
  arc(399, 169, 150, 100, PI, TWO_PI) ;
   
  fill(#1AD63D) ; // Main body thingy
 ellipse(300, 300, 150, 170) ;
   
  fill(#1AD63D) ; // Head of my amazing monster 
  ellipse(400, 215, 200, 100) ;

   
  fill(#8C6AF5) ; //Left foot of monster man
  arc(230, 385, 105, 105, PI, TWO_PI) ;
   
  fill(#8C6AF5) ; //right foot of monster man
  arc(380, 380, 115, 110, PI, TWO_PI) ;
   
  fill(0) ; //bottom of mouth
  rect(350, 242, 100, 20) ;
  
  fill(0) ; //bottom of mouth
  rect(350, 220, 100, 20) ;
   
  fill(#FF0808) ;  // SCARY TOOTH1
  triangle(427, 260, 437, 245, 449, 260) ;
  
  fill(#FF0808) ;  // SCARY TOOTH1
  triangle(407, 240, 417, 225, 429, 240) ;
  
 
    fill(#E815D0) ; //brain 1 lower
  arc(365, 170, 20, 20, PI, TWO_PI) ;
  
  fill(#E31014) ; //Brain 2 lower
  arc(385, 170, 20, 20, PI, TWO_PI) ;
  
  fill(#E815D0) ; //brin 3 lower 
  arc(405, 170, 20, 20, PI, TWO_PI) ;
  
  fill(#E31014) ; //brain 4 lower
  arc(426, 170, 20, 20, PI, TWO_PI) ;
   
   fill(#832ACE) ; //brain 5 upper
  arc(426, 160, 20, 20, PI, TWO_PI) ;
  
  fill(#832ACE) ; //brain 6 upper
  arc(403, 160, 20, 20, PI, TWO_PI) ;
   
   fill(#832ACE) ; //brain 7 upper
  arc(380, 160, 20, 20, PI, TWO_PI) ;
   
 
   

  
  fill(#FFF700) ;  //left eye
  ellipse(320, 180, 75, 75) ;
   
  fill(#FFF700) ;  // right eye
  ellipse(480, 180, 75, 75) ;
  
  
  fill(#FA0008) ;  //  left eye detail
  ellipse(320, 180, 20, 35) ;
  
  fill(#B614B7) ;  //  left eye detail
  ellipse(480, 180, 35, 20) ;
  
  fill(#FFE6CC);
ellipse(200, 250, 70, 30); // left hand

fill(#FFE6CC);
ellipse(420, 300, 100, 30); // right hand


   
}


