
// homeWork (3); 
// copyRight carlBajandas (2011) pittsburghPa;  

color col = color (random (255), random (255),random (255), 100);
float x,y;

void setup (){
  size (600,600);
  smooth ();
  noCursor();
  background (200);
  col = color (random (255), random (255),random (255), 255);
  frameRate ( 60 );
}  
 

void draw (){
  stroke (col); 
  strokeWeight (abs (mouseX-pmouseX));
  strokeWeight (abs (mouseY-pmouseY));
  line (pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed (){
fill ( random (256), 256,random (256), 4);
  rect (0,0,width,height); 
 
  col = color  ( random (256), random (256),random (256), 255 );  
 fill  ( random (256), random (256),random (256), 100 );
 ellipse(mouseX, mouseY, 20, 20) ;
 ellipse(mouseX, mouseY, random(25), random(25)) ;
 ellipse(mouseX, mouseY, random (100), random (100)) ;
 ellipse(mouseX, mouseY, random (200), random (200)) ;
 ellipse(mouseX, mouseY, random (300), random (300)) ;

}
 
void mouseMoved (){
  noStroke();
  fill ( random (256), 256,random (256), 3);
  rect (0,0,width,height); 
}
