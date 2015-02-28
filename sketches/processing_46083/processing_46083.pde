

 
float contorno , figura,forma;
 
void setup(){
   
    size(640,450); 
    smooth();
    colorMode(RGB);
    contorno = 400;
    figura = 340;
}
 
 
 
void draw(){
   
  forma+=0.130;
  if(forma > 280) forma = 0;
   
  background(255);

 if( mouseX > 3 ) contorno = mouseX;
 if( mouseY > 3 ) figura = mouseY/2;
 
 
  
 for ( int x = 0; x < width/8; x++) {
    for ( int y = 0; y < height/8; y++){
             
 
           
              strokeWeight(8);
         stroke(255,0,183);
         fill(forma,255,0);     
         tri ( x * contorno, y * contorno, figura );
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
  triangle( -trisize, trisize, trisize/6,-trisize, trisize+ trisize/10, trisize );
  popMatrix();
}

                
                
