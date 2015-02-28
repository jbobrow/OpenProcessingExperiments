
float w = 60;
float h = 30;
float x,y;
float r1,r2;

void setup() {
 size(256,256); 
  smooth();
  noStroke();
  fill(0);
  x = width*0.66 - h/2;
  y = height - h;
}

void draw() {
  
  background(255);
 
  if ( mousePressed ) {
    x = mouseX - h/2;
  } else {
     r1 = map( mouseX , 0 , width , PI , TWO_PI );
     r2 = map( mouseY , 0 , width , TWO_PI , PI );
  }
 
 
  // Dessiner la base
  translate(x,y);
  rect(0,0,w,h);
  
  // Dessiner "l'epaule"
  translate(w/2,0);
  
  rotate( r1 );
  rect(0,-5,60,10);
  ellipse(0,0,20,20);
  
  // Dessiner "le coude"
  translate(60,0);
  
  rotate( r2 );
  rect(0,-5,60,10);
  ellipse(0,0,20,20);
  
  // Dessiner les "pinces"
  translate(60,0);
  rect(0,-10,30,5);
  rect(0,5,30,5);
  ellipse(0,0,20,20);
  
}

