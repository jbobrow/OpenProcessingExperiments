
void setup () {

  smooth();
  size( 600,400 );
  background(4,9,60);
  frameRate (6);
}

void draw () {

  //background (4,9,60);
  fill (255,255,200,255);
  
 background(0, map(mouseX,0,600,20,50),map(mouseY,0,600,40,90));
 

stroke(255,255,200);
strokeWeight( 4);
  ellipse(mouseX,mouseY, 50,15);
    stroke (0,255,0);
    ellipse(mouseX,mouseY, 5,5);
    
    
  
 for( int i=0; i<110; i++) {
 strokeWeight (2)  ;
 stroke(255);
 ellipse( random(0,600), random(0,400), 2,2 );
 
 

 }   
  
  
   stroke( random(200,255), random(200,255), random(100,150));
  strokeWeight ( random (0,6));
 //stroke (255,255,200);
 line (mouseX,mouseY, random(0,400), random ( 0,600) );
 
 stroke( 123,123,123);
  rect (inverseX(mouseX -100),inverseY(mouseY+100), 10,10,10,15);
  stroke (0,255,0);
  ellipse(inverseX(mouseX -100),inverseY(mouseY+100), 3,3); 
  

 stroke( 123,123,123);
  rect (inverseX(mouseX +100),inverseY(mouseY+100), 10,10,10,15);
  stroke (0,255,0);
  ellipse(inverseX(mouseX +100),inverseY(mouseY+100), 3,3); 
  
  }
  
  int inverseX (int x) {
    return ( width - x);
  }
  
   int inverseY (int y) {
    return ( width - y);
  }

