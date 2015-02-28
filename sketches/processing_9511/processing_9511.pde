
void setup() {

ellipseMode(CORNER); 
size (800, 800); 
background(255);
smooth(); 




}

void draw (){
  
  noFill();  
  
  //oben rechts
  pushMatrix(); 
  translate(width/2, 0); 
  ellipseMalen() ;
  popMatrix(); 
  
  
  //oben links
  pushMatrix(); 
  translate(width/2, 0);
   rotate (2*PI/4);  
  ellipseMalen() ;
  popMatrix(); 
  
  // rechts unten
  pushMatrix(); 
  translate(width/2, height); 
  rotate(-(2*PI/4)); 
  ellipseMalen() ;
  popMatrix(); 
  
  //links unten
  pushMatrix(); 
  translate(width/2, height); 
  rotate((2*PI/2)); 
  ellipseMalen() ;
  popMatrix(); 
  
  
  }
  
 


void ellipseMalen () {

//ellipsen nach rechts
for (int x = 1; x < width/2; x += (width/2)/7) {
  
  
  //ellipsen von rechts nach links
 for ( int x2 = (width/2-(width/2)/7) ; x2 >= (width/2)/7;   x2 -= (width/2)/7  ) {

     
//ellipsen nach unten
for (int y = 1; y < height/2; y+= (height/2)/7) {
  
  
//ellipsen von unten nach oben
  for ( int y2 = height/2-(height/2)/7 ; y2 >= (height/2)/7;   y2 -= (height/2)/7 ) {
  


  pushMatrix();  
  strokeWeight(x/40); 
  ellipse (x, y, (width/2)/7, (height/2)/7);  
  popMatrix(); 
  
  pushMatrix();  
  strokeWeight(x2/30); 
  ellipse (x2, y2, (width/2)/7, (height/2)/7);  
  popMatrix(); 
  
  
  pushMatrix();  
  strokeWeight(y2/30); 
  ellipse (x2, y2, (width/2)/7, (height/2)/7);  
  popMatrix(); 
  
  
  pushMatrix();  
  strokeWeight(y/40);      //nimmt nach unten hin zu
  ellipse (x, y, (width/2)/7, (height/2)/7);  
  popMatrix(); 
  
 
  
  
  
 
    
}
}
}
}}





