
/*
 * Simle first class for a single sphoxel 
 */

class SPike {
  // attributes for the left, right (0..360), bottom, top(0-180), and front, back (=radii)   
  float pLeft, pRight, pTop, pBottom, pBase, pHeight, pDelta; 

  // Constructor 
  SPike( float pLeft, float pRight, float pBottom, float pTop, float pBase, float pHeight) {
    this.pLeft  = pLeft  ;
    this.pRight = pRight ;
    this.pBottom= pBottom;
    this.pTop   = pTop   ;
    this.pBase  = pBase  ; 
    this.pHeight= pHeight;
    this.pDelta = 0.0;
  } // end constructor 

  void setDeltaPlus( float d) {
    this.pDelta = pDelta+d;
  } // end setBack 

  void setDelta( float d) {
    this.pDelta = d;
  } // end setBack  

  float getHeight() {
    return this.pHeight;
  } // end setBack  
  
  void deltaHeight() {
     this.pHeight+=this.pDelta;
  } // end setBack  


  void render() {
    float x, y, z; 
    SPoint sph, tip; 
    pushMatrix(); 
    beginShape(TRIANGLES); 
    // System.out.println("pLeft"+pLeft+" pRight"+pRight+" pBottom"+pBottom+" pTop"+pTop+" pFront"+pFront+" pBack"+pBack);

    tip = new SPoint( (pBase+pHeight), (pTop+pBottom)/2.0, (pLeft+pRight)/2.0 );
    vertex( tip.x, tip.y, tip.z); // left top front  
    sph = new SPoint( pBase, pTop, pLeft); 
    vertex( sph.x, sph.y, sph.z); // left top front
    sph = new SPoint( pBase, pBottom, pLeft ); 
    vertex( sph.x, sph.y, sph.z); // left top back
    
    vertex( tip.x, tip.y, tip.z); // left top front  
    sph = new SPoint( pBase, pTop, pLeft); 
    vertex( sph.x, sph.y, sph.z); // left top front
    sph = new SPoint( pBase, pTop, pRight ); 
    vertex( sph.x, sph.y, sph.z); // left top back
    
    vertex( tip.x, tip.y, tip.z); // left top front  
    sph = new SPoint( pBase, pBottom, pRight); 
    vertex( sph.x, sph.y, sph.z); // left top front
    sph = new SPoint( pBase, pBottom, pLeft ); 
    vertex( sph.x, sph.y, sph.z); // left top back
    
    vertex( tip.x, tip.y, tip.z); // left top front
    sph = new SPoint( pBase, pTop, pRight); 
    vertex( sph.x, sph.y, sph.z); // Right top back
    sph = new SPoint( pBase, pBottom, pRight); 
    vertex( sph.x, sph.y, sph.z); // Right top front
    
    endShape();

    popMatrix();
  } // end render
} // end class Sphoxel 


