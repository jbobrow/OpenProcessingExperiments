
  
int bsize = 9;
Ball bb, bb2, bb3;
Ball[] balls = new Ball[8];

void setup() {
  frameRate(80);
size (200, 200);
  background(30);
  for( int i = 0; i < 8; i++ ) {
    balls[i] = new Ball(0.098-(i*0.02));
  }

}

void draw(){
  fill(0,0,0,20);
  rect(0,0,width,height);
  noStroke();
  for( int i = 0; i < 6; i++ ) {
  balls[i].update( mouseX , mouseY );
  }
  
  if( mousePressed ) {
    saveFrame();
  }
}

class Ball {
  
 float cx, cy, constant;
  
 Ball (float cc) {
  constant = cc;
  cx = 10;
  cy = 10;
 } 
 
 void update( int posx, int posy) {
    
    float ccx = ((posx - cx)*constant) ;
    ccx = ccx*2;
    cx += ccx;
    float ccy = ((posy - cy)*constant) ;
    ccy = ccy*2;
    cy += ccy;
    
   this.render();
 }
 
 void render() {
   ellipseMode( CENTER );
   fill (255, 0, 100);
   ellipse ( cx, cy, bsize, bsize ); 
 }
 
  
}
