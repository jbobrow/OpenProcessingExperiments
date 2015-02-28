
// vj monz || vjmonz.com || vimeo.com/vjmonz

float scal , rad, c;


void setup(){
  
    size(640,450);  
    smooth();
    colorMode(HSB);
    scal = 40;
    rad = 40;
}



void draw(){
  
  c+=0.3;
  if(c > 255) c = 0;
  
  background(0);
//
 if( mouseX > 3 ) scal = mouseX;
 if( mouseY > 3 ) rad = mouseY/2;


 
 for ( int x = 0; x < width/8; x++) {
    for ( int y = 0; y < height/8; y++){ 
            

          
             
         stroke(c,255,255); 
         fill(c,255,255);      
          tri ( x * scal, y * scal, rad );
        }
    }
}


void tri ( float _x, float _y, float _size  ) {
   float trisize = _size; 
  float x , y;  
  x = _x;
  y = _y;
  pushMatrix();
  translate( x, y);
  triangle( -trisize, trisize, trisize/4,-trisize, trisize+ trisize/2, trisize );
  popMatrix();
}



                
                
