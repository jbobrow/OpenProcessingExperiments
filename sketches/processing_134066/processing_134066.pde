
class Straw {
 
  float rootX = 0;
  float rootY =0;
  float strawLength = 230;
  float fattness = 0.02;
  // constr5uctor
  Straw( float theX ){
    rootX = theX;
    rootY = height;
  }
  
  void display () {
   
    float endpointX = rootX;
    float endpointY = rootY-strawLength;
   
    float mousediffX = mouseX-rootX;
    float mousedistX = abs( mousediffX);
     
     if(mousedistX < 250) {
        float offsetX = map(mousedistX, 0, 250, 80, 0);
       if (mousediffX < 0) {
         endpointX = endpointX +offsetX;
       }else{        
          endpointX = endpointX - offsetX;
        } 
     } 
    
     fill(#3CF052);
     noStroke();
    
    beginShape();
    vertex(rootX, rootY); 
    bezierVertex( rootX-strawLength*fattness, rootY-strawLength*0.5, endpointX, endpointY, endpointX, endpointY);
    bezierVertex( endpointX, endpointY,  rootX+strawLength*fattness, rootY-strawLength*0.5, rootX, rootY);      
    endShape();
     
  }
}

