
void setup() {
 
  size(600, 360);
  rectMode(CENTER); 

  
}
    
void draw() {
  roboto(width*0.2, height*0.5, 100,100, 0);// regular
  roboto(width*0.8, height*0.5, 50, 100, 1); // skinny
  roboto(width * 0.5, height*0.5, 100, 50, 2); // fat
}
 
 
 
 
void drawArm(int lOrR, float x, float y, float bwidth, float bheight){
  
  pushMatrix();
  
   if( lOrR == 0){
    
    rect( x - (bwidth/2), y - bheight/5, bwidth/4, bheight*0.5);
    translate( 0, bheight*0.25);
    translate( x- bwidth*0.5, ( y - bheight/10 ));
    rotate( 9);
    translate( -(x- bwidth*0.5),-( y - bheight/10));
    rect( x - bwidth*0.5, y - bheight/10 , bwidth/4, bheight*0.5);
   
   }
   
   if( lOrR == 1){
   rect( x + (bwidth/2), y - bheight/5, bwidth/4, bheight*0.5);
    translate( 0, bheight*0.25);
    translate( x+ bwidth*0.5, ( y - bheight/10 ));
    rotate( -9);
    translate( -(x+ bwidth*0.5),-( y - bheight/10));
    rect( x + bwidth*0.5, y - bheight/10 , bwidth/4, bheight*0.5);
   }
  popMatrix();
  
  
}

void drawLeg(int lOrR, float x, float y, float bwidth, float bheight){
  
  pushMatrix();
  
   if( lOrR == 0)  
    rect( x - bwidth*0.2, y + bheight*0.7, bwidth/4, bheight); 
   
   
   if( lOrR == 1)
    rect( x + bwidth*0.2, y + bheight*0.7, bwidth/4, bheight); 
   
  popMatrix();
  
  
}

void drawHead( float x,float y, float bwidth, float bheight){
 
 rect( x, y - bheight*0.7, bwidth/2, bheight/2); 
  
}
 
void roboto(float x,float y, float bwidth, float bheight, int theColor) {
  
  if( theColor == 0)
  fill( 255, 0, 0);
  if( theColor == 1)
  fill( 0, 255, 0);
  if( theColor == 2)
  fill( 0, 0, 255);
  
  drawLeg( 0, x, y, bwidth, bheight);
  drawLeg( 1, x, y, bwidth, bheight);
  rect(x, y, bwidth, bheight);
  drawArm( 0, x, y, bwidth, bheight);
  drawArm( 1, x, y, bwidth, bheight);
  drawHead( x,y, bwidth, bheight);
  
  
}

