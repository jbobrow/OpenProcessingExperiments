
                
 
// vj monz grid sketch v2.
// control using the keys:
// - a , s , z , x , c , v , b , n , m


//import javax.media.opengl.*;
//import processing.opengl.*;
//import jsyphon.*; 
//JSyphonServer mySyphon;
//PGraphicsOpenGL pgl;
//GL gl;
//int[] texID;
float expr;
float scal , rad, c;
Triangl tri = new Triangl();
Stripe[] stripes = new Stripe[11];

void setup(){
    size(640,400);  
    smooth();
    colorMode(HSB);
    scal = 40;
    rad = 40;
    //pgl = (PGraphicsOpenGL) g;
    //gl = pgl.gl;
    //initSyphon(gl,"Syphon - Processing");
    
    for ( int i = 0; i < 11 ; i++ ) {
    stripes[i] = new Stripe(random(100),random(11),random(4000));
      }
}



void draw(){
 // renderTexture(pgl.gl);
  background(0);
  if(key == 'm') {
  rotate(frameCount * PI / 6000);
  for ( int i = -width/4; i < width/4; i++ ) {
  rect ( -width, i * tri.scal, width*16, tri.rad*2 );
      }
  }
  if(key == 'x'){
      for ( int i = 0; i < 11 ; i++ ) {
   stripes[i].run();   
  }
  }
  if(key == 'z'){
  tri.tri( width/2.1-50,height/2.1, expr);
  }
  if(key == 'a'){ 
  ellipse(width/2,height/2,expr,expr);
  }
   if(key == 's'){
  rect(width/2,height/2,expr,expr);
   }

  tri.run();
  if( mouseX > 3 ) tri.scal = mouseX;
  if( mouseY > 3 ) tri.rad = mouseY/2;
  expr = sin ( frameCount * PI / 600 ) * 500;
}
     
class Triangl{
  
  float scal, rad;
  Triangl () { }
  
  void run(){
     c+=0.3;
     if(c > 255) c = 0;
    
for ( int x = 0; x < width/8; x++) {
    for ( int y = 0; y < height/8; y++){ 
         stroke(c,255,255); 
         fill(c,255,255); 
//    rectMode(CENTER);
    
    switch(key){
      case 'c':
      rect( x * scal, y * scal, rad,rad);
      break;
      case 'v':
      line( x * scal, y * scal,y * scal , x * scal);
      break;
      case 'b':
      ellipse( x * scal, y * scal, rad,rad);
      break;
      case 'n':
      tri ( x * scal, y * scal, rad );
      break;
     }
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
}


class Stripe{
  
  float speed;
  float scale;
  float y, rad;
  float rspeed;
  
  Stripe( float _scale , float _speed, float _rspeed) {
  speed = _speed;
  scale = _scale;
  rspeed = _rspeed;
  }
  
  void run() {
    
    rad = sin ( frameCount * PI / rspeed ) * scale;
    y += speed;
    if ( y > height ) y = 0;
    stroke(c,255,255);
    fill(c,255,255);
    rect( 0 , y , width, rad );
  }
    
}




                            
