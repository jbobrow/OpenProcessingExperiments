
float angle01, angle02, angle03, angle04;
int howBig;

void setup() {
  size( 1200,700 );
  background( 255 );
  smooth();
  frameRate( 30 );
  
  
}

void draw() {
  
  
  noStroke();
  fill( 255, 35 );
  rect( 0,0,width,height );
  
  angle01 += .1;
  angle02 += .1;
  angle03 += .1;
  angle04 += .1;
  
  howBig = 15;
  
  fill( #ff0000 );
  
  ellipse( width/2+( 140*cos( angle01 )), 310+( 140*sin( angle01 )), howBig, howBig );
  
  fill( #FADE03 );
  ellipse( width/2-140+( 140*sin( angle02 )), 310+( 140*cos( angle02 )), howBig, howBig );
  
  fill( #17be00 );
  ellipse( width/2+140+( 140*cos( angle03 )), 310+( 140*sin( angle03 )), howBig, howBig );
  
  
  fill( #00C5FF );
  ellipse( width/2+75+( 140*cos( angle04 )), 195+( 140*sin( angle04 )), howBig, howBig );
  
  fill( #7408ff );
  ellipse( width/2-75+( 140*sin( angle01 )), 195+( 140*cos( angle01 )), howBig, howBig );
  
  fill( #FF005E );
  ellipse( width/2-75+( 140*sin( angle02 )), 430+( 140*cos( angle02 )), howBig, howBig );
  
  fill( #ff7c00 );
  ellipse( width/2+75+( 140*cos( angle03 )), 430+( 140*sin( angle03 )), howBig, howBig );
  
  
}
