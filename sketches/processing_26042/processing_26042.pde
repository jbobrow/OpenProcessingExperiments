
int xspacing = 5;   
int w;             
 
float theta = .1f;      
float amplitude = 50.0f;  
float period = 950.0f;   
float dx;                
float[] yvalues;          
 
void setup() {
  size(900,450);
  colorMode(HSB);
  smooth();
  w = width;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  println(yvalues.length);
}
 
void draw() {
  background(0);
  fill( 10, 10 , 10 );
 calcWave();
  renderWave();
 for (int i = 0; i < yvalues.length; i++) {

}
}
 
void calcWave() {
  theta += .3;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}
 
void renderWave() {
  for ( int x = 0; x < yvalues.length; x++ ) {
    stroke( x, 200, 236, 19 );
    strokeWeight (20);
    fill( yvalues[x], 255, 50,25 );
    ellipseMode( CENTER );
    ellipse( x*xspacing,width/8+yvalues[x],yvalues[(x+x)%50],yvalues[(x+x+x)%100] );
     ellipse( x*xspacing,width/4+yvalues[x],yvalues[(x+x)%75],yvalues[(x+x+x)%75] );
     ellipse( x*xspacing,width/2.5+yvalues[x],yvalues[(x+x)%100],yvalues[(x+x+x)%50] );
  }
}


