

float x,x2,x3;
float y,y2,y3;
float r, g, b;

void setup ( ) {
  size(200,200) ;
  smooth();
  noStroke();
}


void draw() {
  
  fill(255,255,255,10);
  rect(0,0,width,height);
  
  // LIGNES SEPARATRICES
  stroke(255);
  strokeWeight(2);
  line(0,height/2,width/2,height/2);
  line(width/2,0,width/2,height);
  noStroke();
  
  // COIN HAUT GAUCHE
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  fill( r , g , b );
  
  x = random ( 5 , width/2 - 5);
  y = random ( 5 , height/2 - 5);

  ellipse(x,y,10,10);
  
  // COTE DROIT
  r = noise(frameCount * 0.03) * 255;
  g = noise(frameCount * 0.006) * 255;
  b = noise(frameCount * 0.02) * 255;
  fill( r , g , b );
 
  x2 = ( noise(frameCount * 0.01) * width/2 ) + width/2;
  y2 = noise(frameCount * 0.01 + 30) * height;

  ellipse(x2,y2,10,10);
  
  // COIN BAS GAUCHE
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  fill( r , g , b );
  
  x3 = x3 + random(-5,5);
  y3 = y3 + random(-5,5);
  x3 = constrain(x3,5,width/2 - 5);
  y3 = constrain(y3,height/2 + 5,height - 5);

  ellipse(x3,y3,10,10);
  
}

