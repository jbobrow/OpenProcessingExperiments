
int myD ;

void setup() {
  size(500, 500) ;
  background(255);
  smooth() ;
}

void draw () {
  myD = int(random(200)) ;
  fill(0, 0, random(255), random(50, 100)) ;
  ellipse(random(width), random(height), myD, myD) ; 
  

}

void mousePressed() {
  background(255) ; 
}


