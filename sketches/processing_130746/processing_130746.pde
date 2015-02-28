
  float f ;
  float d ;
  float f2 ;
  float d2 ;
  float f3 ;
  float d3 ;
  
//cloud ints
  int x = 0 ;
  int x1 = 0 ;
  int x2 = 100 ;
  int x3 = 250 ;
  int x4 = 90 ;
  
//mouth int
 int m = 235 ;
 
 
 
void setup(){
  size(400, 300) ;

  
 

}


void draw() {
 background(#3C85F7) ;
 println(mouseX, mouseY) ; 
 
//clouds
 fill(255) ;
 ellipse(x, 10, 50, 20) ;
  x = x + 1 ; //put if statement to reset
  if (x > width) {
  x = 0 ;
  }
  ellipse(x2, 20, 55, 24) ;
  x2 = x2 + 1 ; //put if statement to reset
  if (x2 > width) {
  x2 = 0 ;
  }
  ellipse(x1, 30, 85, 35) ;
  x1 = x1 + 2 ; //put if statement to reset
  if (x1 > width) {
  x1 = 0 ;
  }
  ellipse(x3, 60, 75, 35) ;
  x3 = x3 + 2 ; //put if statement to reset
  if (x3 > width) {
  x3 = 0 ;
  }
  ellipse(x4, 120, 125, 50) ;
  x4 = x4 + 2 ; //put if statement to reset
  if (x4 > width) {
  x4 = 0 ;
  }
stroke(1) ;
//ground
 fill(#8E633B);
 rect(0, 255, width, 145) ;


//spikes
 fill(#EA9F58) ;
 triangle(153, 164, 164, 126, 178, 150) ;
 triangle(194, 146, 210, 117, 223, 142) ;
 triangle(239, 146, 260, 117, 269, 146) ;
 triangle(286, 149, 301, 130, 312, 166) ;
 triangle(323, 177, 334, 153, 344, 184) ;
 triangle(359, 189, 369, 170, 376, 196) ;
 
//tail
 fill(#72F077) ;
 quad(312, 174, 385, 194, 385, 209, 309, 210) ;
 triangle(385, 194, 385, 209, 345, 232) ;

//spikes on small tail
 fill(#EA9F58) ;
 triangle(368, 210, 372, 197, 377, 202) ;
 triangle(351, 226, 353, 216, 356, 222) ;

//back leg
 fill(#72F077) ;
 ellipse(234, 228, 30, 72);
 
//body
 fill(#72F077) ;
 ellipse(230, 190, 190, 100) ;
 
//front leg
 ellipse(300, 228, 30, 72);
 
 //feet
 ellipse(290, 260, 45, 30);
 ellipse(224, 260, 45, 30);
//eyes
 fill(#FFFFFF) ;
 ellipse(120, 160, 15, 25) ;
 ellipse(180, 160, 15, 25) ;
 
 //pupils
 fill(#000000) ;
 ellipse(120, 165, 5, 8) ;
 ellipse(180, 165, 5, 8) ;
 
 //inside mouth
 fill(#FF89AC) ;
 rect(110, 230, 80, 30) ;
 //lower jaw
 fill(#72F077) ;
 rect(110, m, 80, 30, 12) ;
  m = m + 1 ; //put if statement to reset
  if (m > 255) {
  m = 235 ;
  
  }
 //snout
 rect(100, 180, 100, 60, 12) ;
 
 f = random(85, 216) ;
 d = random(240, 300) ;
 f2 = random(85, 216) ;
 d2 = random(240, 300) ;
 f3 = random(85, 216) ;
 d3 = random(240, 300) ;
 
 noStroke() ;
 fill(#E58225) ;
 ellipse(f, d, random(15), random(20)) ;
 fill(#F2DA22) ;
 rect(f, d, random(15), random(20)) ;
 fill(#FA3535) ;
 triangle(f, d, f2, d2, f3, d3) ;
 
 
}


