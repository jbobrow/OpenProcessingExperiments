
// example exploring color and stroke attributes

ColorGroup cg0, cg1, cg2 ;


void setup() {
  size(640, 480) ; 
  background(255) ;
  smooth() ;

  int posX = width/2 ;
  int posY = height/2 ;
  
  // x, y, diameter, rot, rotSpeed
  cg0 = new ColorGroup(posX, posY, 100, 0.25, 0.01) ;
  cg1 = new ColorGroup(posX-80, posY-10, 30, 1.34, -0.002) ;
  cg2 = new ColorGroup(posX+80, posY+90, 20, 0.75, 0.006) ;
}


void draw() {
 // background(255) ; // update background to display white
  fill(255, 10) ;
  rect(0,0, width, height) ;
  cg0.render() ;
  cg1.render() ;
  cg2.render() ;
}







// demonstration of class
class ColorGroup {
  int posX ;
  int posY ;
  int diameter ;
  float offset  ;
  float rot ;
  float rotSpeed ;
  
  // color are in hex web colors, or RGB 0-255
  color c0 = #FF0000 ;
  color c1 = #00FF00 ;
  color c2 = color(0, 0, 255) ;
  color strokeColor = #AAAAAA ;
  float strokeSize ;
  int transparency = 150 ; // this we will use for the alpha channel

  // constructor
  ColorGroup(int _x, int _y, int _diameter, float _rot, float _rotSpeed) {
    posX = _x ;
    posY = _y ;
    diameter = _diameter ;
    offset = diameter*0.333 ;
    strokeSize = diameter * 0.015 ;
    rot = _rot ;
    rotSpeed = _rotSpeed ;
  }

  void render() {
    strokeWeight(strokeSize) ; // the weight of the shape outline
    stroke(strokeColor) ;

    pushMatrix() ; // push the current transformation matrix onto the stack
    translate(posX, posY) ; // move the objects with this matrix
    rotate(((rot+=rotSpeed)%PI*2)) ;
    
    // the tri color ellipses
    fill(c0, transparency) ; // fill this shape with color w/alpha
    ellipse(0, -offset, diameter, diameter) ;

    fill(c1, transparency) ;
    ellipse(-offset, offset, diameter, diameter) ;

    fill(c2, transparency) ;
    ellipse(offset, offset, diameter, diameter) ;

    // satelite elipse
    fill(strokeColor, transparency) ;
    ellipse(-diameter, -offset, offset, offset) ;

    ellipse(diameter, -offset, offset, offset) ;

    ellipse(0, diameter+(offset/3), offset, offset) ;
    popMatrix() ;
  }

  void updatePos(int x, int y) {
    posX = x ;
    posY = y ;
  }
}
