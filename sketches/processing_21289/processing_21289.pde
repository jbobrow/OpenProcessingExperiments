
final int BF_STATES = 16;
PImage [] butterfly_image;
PImage bg;
LittleMan lm1;
LittleMan lm2;
LittleMan lm3;
ButterFly [] butterflies;

void setup(){
 size( 400, 400 );
 lm1 = new LittleMan( 80, 0, .28, .7 );
 lm2 = new LittleMan( 280, 50, .11, .9 );
 lm3 = new LittleMan( 20, 300, 1, .58 );
 butterfly_image = new PImage[BF_STATES];
 for( int i = 1; i <= BF_STATES; i++ ){
    butterfly_image[i-1] = loadImage( "butterfly/butterfly-animated-" + i + " (dragged).png" );
 }
 
 int bf_len = int( random( 15, 20 ) );
 butterflies = new ButterFly[bf_len];
 for( int i = 0; i < bf_len; i++ ){
 
  butterflies[i] = new ButterFly( int( random( 0, 400 ) ), int( random( 0, 400 ) ), int( random( 20, 40 ) ) );  
 }
 
 bg = loadImage( "crazy.png" );
}

void draw(){
 image( bg, 0, 0, 400, 400 );
 lm1.render();
 lm2.render();
 lm3.render();
 tint( 255, 255 );
 int l = butterflies.length;
 for( int i = 0; i < l; i++ ){
   butterflies[i].render(); 
 }
 
 if( lm1.hitTest() || lm2.hitTest() || lm3.hitTest() ){
    textSize( 28 );
    fill( 255, 255, 255 );
    text("Found Me!", 130, 190); 
 }
}



void keyPressed(){
   if( key == 'b' ){
    butterflies = (ButterFly[])append( butterflies, new ButterFly( int( random( 0, 400 ) ), int( random( 0, 400 ) ), int( random( 20, 40 ) ) ) );  
 }
}

class LittleMan {
   private int _x;
   private int _y;
   private float _s;
   private float _o;
   private PImage _img;
  
  public LittleMan( int x, int y, float s, float o ){
     _img = loadImage( "jester-1.gif" );
     _x = x;
     _y = y;
     _s = s;
     _o = o;
  }
  
  public boolean hitTest(){
     if( mouseX >= _x && mouseX <=  _x + _img.width * _s 
       && mouseY >= _y && mouseY <= _y + _img.height * _s ) return true;
       return false;
  }
  
  public void render(){
    pushMatrix();
     scale(-1.0, 1.0);
     tint( 255, _o*255 );
    image( _img, -_img.width * _s - _x, _y, _img.width * _s, _img.height * _s ); 
     popMatrix();
     // tint( 255, 255 ); color( 255, 0, 0 ); rect(_x + _img.width * _s, _y, -_img.width * _s, _img.height * _s );
  }
   
}

class ButterFly {
  private int _state;
  private int _size;
  private int _x;
  private int _y;

 public ButterFly( int x, int y, int s ){
  _x = x;
  _y = y;
  _size = s;
  _state = 0;
 } 
 
 public void render(){
  image( butterfly_image[_state], _x, _y, _size, _size );
  incrementState();
 }
 
 private void incrementState(){
    if( ++_state >= BF_STATES ) _state = 0;
 }
 
}

