
float grados;
float angulo;


void setup(){
  size (600,600);
  smooth();
  grados = 90.0;
  angulo =0;
  
}
void draw(){
background (128);
noStroke();
angulo += 1;
pio(width/2, height/2, 100,color(31,237,187), angulo );
  
}


void pio(float piX, float piY, float piW, color colorPio, float a){
  //cuerpo pio
  fill( colorPio);
  noStroke();
  ellipse(piX,piY,piW,piW);
  //cara pio
  ellipse(piX-(piW/2),piY-(piW/2),piW/2, piW/2);
  
 
  //ojo pio
  fill(255);
  ellipse(piX-(piW/2)-(piW/8),piY-(piW/2)-(piW/16),piW/8, piW/8);
  //pupila
 fill(0);
 
 //pushMatrix();
//translate (piX-(piW/2) ,piY-(piW/2));
//float radianes = radians(grados); 
//rotate(radianes);
 
  float xp= piX-(piW/2)-(piW/8) + (cos(radians(a))* piW/16);
 float yp= piY-(piW/2)-(piW/16) + (sin(radians(a))* piW/16);
 
 ellipse(xp,yp,piW/16, piW/16);
 //popMatrix();
 
 
 //pico pio
 fill(255,255,0);
 //pico pio
 fill(255,255,0);
 triangle (piX-(piW*3/4)-(piW/8), piY-(piW/2),piX-(piW*3/4), piY-(piW/2)- (piW/16),piX-(piW*3/4), piY-(piW/3)- (piW/8) );
 //pata pio
 fill(255,255,0);
rect (piX,piY*1.2-(piW/8/2),piW/8,piW/8);
}

