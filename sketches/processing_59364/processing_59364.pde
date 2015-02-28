
Starfield starfield;
Comet comet;
Ship ship;
Torpedo torpedo;
PImage boom;
void setup() {
  size(640,480);
  starfield = new Starfield( 100 );
  PImage cimg = loadImage( "comet.gif" );
  comet = new Comet( width + cimg.width/2, height/2, 4, cimg );
  PImage simg = loadImage( "ship.png" );
  ship = new Ship( 100, height/2, 3, simg );
    
  boom = loadImage( "boom.png" );
  torpedo = new Torpedo(20,10,240);
  torpedo.active = false;
  frameRate(60 );
  smooth();
}
int boom_count = 0;
int comet_boom_count = 0;
void draw() {
  background(0);
  starfield.draw();
  torpedo.update();
  torpedo.draw();
  
  if ( boom_count == 0 ) {
    if ( keyPressed == true && key == CODED ) {
       if ( keyCode == UP ) {
         ship.up();
       } else if ( keyCode == DOWN )
       {
         ship.down();}
       
         else if ( keyCode == LEFT ) {
         ship.left();}
       else if ( keyCode == RIGHT ) {
         ship.right();
    }  }
    ship.draw();
  } else {
    image( boom, ship.getBox().x1, ship.getBox().y1 );
    boom_count--;
  }
  
  if ( ship.getBox().isOverlap( comet.getBox())) {
    boom_count = 25;
  }  
  if ( torpedo.active && comet.getBox().isOverlap( torpedo.getBox())) {
    comet_boom_count = 25;
    torpedo.active = false;
  }  
  if ( comet_boom_count == 0 ) {  
    comet.update();
    comet.draw();
  } else if ( comet_boom_count == 1 ) {
    comet.reset();
    comet_boom_count--;
  } else {
    image( boom, comet.getBox().x1, comet.getBox().y1 );
    comet_boom_count--;
  }
}
void keyPressed() {
  if ( key == ' ' && !torpedo.active ) {
    torpedo.x = ship.x + ship.img.width/2 - 20;
    torpedo.y = ship.y;
    torpedo.active = true;
  }
}

