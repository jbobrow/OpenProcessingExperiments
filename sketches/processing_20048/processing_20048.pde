

//position de la feuille
float x; 
float y; 

void setup() {
  
  size(256,256);
  smooth();
  x = 128;
  y = 0;

  
}

void draw() {
 background(0);
 fill(0,255,0);
 
 // incrementer la position verticale
 y++; // y = y + 1;
 
 //trouver la position horizontale avec le bruit Perlin
 ellipse(noise(frameCount*0.01)*width,y,30,30);
 
 //remettre la feuille en haut si elle tombe trop bas
 if ( y > height + 15 ) y = -15;
  
}
