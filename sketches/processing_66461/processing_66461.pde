
//adapted mainly from http://www.local-guru.net/processing/bouncingball/bouncingball.html
//Also: http://www.learningprocessing.com/examples/chapter-10/example-10-2/
//http://www.openprocessing.org/sketch/8493
//http://www.instructables.com/id/Control-a-RepStrap-RepRap-CNCCartesian-Bot-usi/step20/3D-Bouncing-Ball-Processing/
//
//


int x = 0;
int y = 0;
//speed of ball
int speedx = 10;
int speedy = 6;
int ellipseX = 66;
int ellipseY = 100;

int rectX = 600;
int rectY = 100;


  void setup() {
  size(600,600);
  smooth();
  frameRate(40);
  
  //Font
  PFont myFont;
  int fontPosY = 40;
  String[] fontList = PFont.list();
  println(fontList);
  myFont = createFont("Helvetica", 24, true);
  textFont(myFont);
  
  //testing
  int rayon = 40;

}


void draw() {
  noStroke();
  fill(0);
  rect(0,500, rectX, rectY);
  stroke(0);

  noStroke();
  
  x += speedx;
  y += speedy;
  if (x > 600 || x < 0) {
   speedx = speedx * -1;
  }
  if (y > 500 || y < 0) {
    speedy = speedy * -1;
  } 
 
  //circle
 float distance = dist( mouseX , mouseY , 530 , 550 );
   if ( distance < ellipseX) {
      // mouseOver


  fill(0);
  ellipse( 550, 550, 20, 20);
  text("PAUSE", 260, 250);
  } else {
    
      fill(mouseX, mouseY, 255);
      ellipse( x, y, 10, 10);
      text("MOVE TO CHANGE COLOUR!", 140, 550);
      
       ellipse( 550, 550, 20, 20);

  }
}

