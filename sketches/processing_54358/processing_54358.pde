
public class Robot{
  
 
  private float rotateLeftLeg;
  private float rotateLeftArm;
  private float rotateRightArm;
  private float rotateRightLeg;
 
   Robot(){
     rotateLeftLeg = 0;
     rotateLeftArm = 0;
     rotateRightLeg = 0;
     rotateRightArm = 0;
     
   }
   
   void setRotateLeftArm(float degree, int factor){
     this.rotateLeftArm = degree*factor;
   }
   
   void setRotateLeftLeg(float degree, int factor){
     this.rotateLeftLeg = degree*factor;
   }
   
   void setRotateRightLeg(float degree, int factor){
     this.rotateRightLeg = degree*factor;
   }
   
   void setRotateRightArm(float degree, int factor){
     this.rotateRightArm = degree*factor;
   }
   
   void drawArm(int lOrR, float x, float y, float bwidth, float bheight){
  
  pushMatrix();
  
     if( lOrR == 0){
      
   //   pushMatrix();
      translate(   x - (bwidth/2) , y - bheight/5 - (bheight/5) ); 
      rotate( rotateLeftArm);
      translate( - ( x - (bwidth/2)) ,-( y - bheight/5 - (bheight/5)) ); 
      
      rect( x - (bwidth/2), y - bheight/5, bwidth/4, bheight*0.5);
     // popMatrix();
      
      translate( 0, bheight*0.25);
      translate( x- bwidth*0.5, ( y - bheight/10 ));
      rotate( rotateLeftArm);
      translate( -(x- bwidth*0.5),-( y - bheight/10));
      rect( x - bwidth*0.5, y - bheight/10 , bwidth/4, bheight*0.5);
   
   }
   
     if( lOrR == 1){
        
       translate(   x + (bwidth/2) , y - bheight/5 - (bheight/5) ); 
       rotate( rotateRightArm);
       translate( - ( x + (bwidth/2)) ,-( y - bheight/5 - (bheight/5)) ); 
       
       rect( x + (bwidth/2), y - bheight/5, bwidth/4, bheight*0.5);
       translate( 0, bheight*0.25);
       translate( x+ bwidth*0.5, ( y - bheight/10 ));
       rotate( rotateRightArm);
       translate( -(x+ bwidth*0.5),-( y - bheight/10));
       rect( x + bwidth*0.5, y - bheight/10 , bwidth/4, bheight*0.5);
     }
    popMatrix();  
}

void drawLeg(int lOrR, float x, float y, float bwidth, float bheight){
  
  pushMatrix();
  
  // right leg
   if( lOrR == 0){
    translate(  x - bwidth*0.2 , y + bheight*0.7 - (bheight/3)  );  
      rotate( rotateLeftLeg);
    translate( - ( x - bwidth*0.2) ,-( y + bheight*0.7) - (bheight/3) );  
    rect( x - bwidth*0.2, y + bheight*0.7, bwidth/4, bheight); 
    
   }
   
   // right leg
   if( lOrR == 1){
    translate(  x + bwidth*0.2  , y + bheight*0.7 - bheight/3 );  
      rotate( rotateRightLeg);
    translate( - ( x + bwidth*0.2 ) ,-( y + bheight*0.7 - bheight/3) );  
    rect( x + bwidth*0.2, y + bheight*0.7, bwidth/4, bheight); 
    
   }
   
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
  
  drawHead( x,y, bwidth, bheight);
  
  rect(x, y, bwidth, bheight);
  drawLeg( 0, x, y, bwidth, bheight);
  drawLeg( 1, x, y, bwidth, bheight);
  drawArm( 0, x, y, bwidth, bheight);
  drawArm( 1, x, y, bwidth, bheight);
  
  
  
}
 
  
  
  
}

