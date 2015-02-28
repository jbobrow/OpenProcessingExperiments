
/* final project / 
The goal of the project is to create an artistic drawing , working
with geometry and color.
Im also adding images of masters of the Japanese poster design. 
Wich inspired me for this project.
Hope you like it.

Instructions:

>> You can choose drawing with an image background or a blank
canvas background.

>> To choose between the different backgrounds you have to press the key
"5" , "6" , "7" , "8" or "9" from your keyboard.

>> The images of the background are from masters of the Japanese poster
design. Such as Mitsuo Katsui, Kasumaza Nagai, Yusaku Kamekura...

>> Click and drag to draw a concentric shape
and use keys "1", "2", "3" and "4" to change the color of the draw.

>> You can also change the filling color of the shapes with the keys
"w" for white, "b" for blue and "r" for red.

>> For creating a new random shape you have to click "n" key for 
a black new random shape and "m" key for a white new random shape

>> Just in case you want red ellipse, hit "c"

>> Hit "BACKSPACE" key to erase the canvas, and start drawing again

>> Hit "s" key to save an screenshot of the sketch



enjoy
*/

//global variables
color strokeColor = color(1,50);
float r = random ( 10, 20 );
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
PImage bg5;

//setup ();
void setup () {
  size (800,720);
  colorMode (HSB, 360, 100, 100, 100);
  noFill ();
  background(360);
  smooth (); 
  bg1 = loadImage ("bg1.jpg");
  bg2 = loadImage ("bg2.jpg");
  bg3 = loadImage ("bg3.jpg");
  bg4 = loadImage ("bg4.jpg");
  bg5 = loadImage ("bg5.jpg");
}

//draw();
void draw () {
      
  
      int circleResolution = (int) map (mouseY,0,height,7,8);
      float radius = mouseX - width/2 ;
      float angle = TWO_PI/circleResolution;
      float r = random ( 10, 20 );
     
  if ( mousePressed ) {
    pushMatrix ();
    translate (width/2, height/2);
   
    //style();
    strokeWeight (1/2);
    stroke (strokeColor);
   
    //shapes();
    beginShape();
      for (int i = 0; i < 100; i = i+3) {
      float x = 0 + cos(r * i) * radius;
      float y = 0 + sin(r * i) * radius;
    vertex (x++, y++);
      }
    endShape();
    popMatrix ();
    
     for (int i = 0; i < 10; i = i+3) {
     float x = 0 + cos(r * i) * radius*6;
     float y = 0 + sin(r * i) * radius*6;
     stroke(359,10,99);
     strokeWeight(1/2-random(1/3,1/4));
     line (x,y,width/2,height/2);
     }
     
  }
}
   
  // key released for delete the draw, saving, changing fill and 
  // stroke color
   
  void keyReleased() {
    
    // cleaning and saving sketch
    
    if (key == BACKSPACE) background(360);
    if (key == 's' || key == 'S') saveFrame ("test####.png");
    
    // changing image background
    
    if (key == '5') image (bg1,0,0);
    if (key == '6') image (bg2,0,0);
    if (key == '7') image (bg3,0,0);
    if (key == '8') image (bg4,0,0);
    if (key == '9') image (bg5,0,0);
    
    // drawing a red ellipse
    
    if (key == 'c' || key == 'C') {
    pushMatrix();
    translate (width/2,height/2);
    noFill();
    stroke (360,100,100,2);
    strokeWeight(100);
    ellipse(0,0,400+1, 400+1); 
    popMatrix();
    }
   
  // color fill shape
    
    // red fill
  
    if (key == 'r' || key == 'R') {
    int fillShape = color (358, 99, 99, 1) ;
     noStroke();
     for (int i = 1; i > 0; i -= 10) {
     fillShape = fillShape + 0x010101;
     fill(fillShape);
     ellipse(width/2,height/2,1,1);
     }
  }
  
      // blue fill
  
      if (key == 'b' || key == 'B') {
      int fillShape = color (247,99,71,1);
      noStroke();
      for (int i = 1; i > 0; i -= 10) {
      fillShape = fillShape + 0x010101;
      fill(fillShape);
      ellipse(width/2,height/2,1,1);
        }
      }
  
  
      // white fill
  
      if (key == 'w' || key == 'W') {
      int fillShape = color (360);
      noStroke();
      for (int i = 1; i > 0; i -= 10) {
      fillShape = fillShape + 0x010101;
      fill(fillShape);
      ellipse(width/2,height/2,1,1);
        }
      }
  
  // new random shape in black pressing the key 'n'
  
  if (key == 'n' ) {
      int circleResolution = (int) map (mouseY,0,height,2,2);
      float radius = 300 ;
      float angle = TWO_PI/circleResolution;
      float r = random ( 10, 20 );
       pushMatrix ();
        translate (width/2, height/2);
        strokeWeight (1);
        stroke (358, 2, 15, 100);
        beginShape();
        for (int i = 0; i < 100; i = i+1) {
        float x = 0 + cos(2 * i * r) * radius;
        float y = 0 + sin(2 * i * r) * radius;
        vertex (x, y);
        }
        endShape();
      popMatrix ();
  }
  
  // new random shape white pressing the key 'm'
  
  if (key == 'm' ) {
      int circleResolution = (int) map (mouseY,0,height,2,2);
      float radius = 300 ;
      float angle = TWO_PI/circleResolution;
      float r = random ( 10, 20 );
       pushMatrix ();
        translate (width/2, height/2);
        strokeWeight (1);
        stroke (358, 1, 99, 100);
        beginShape();
        for (int i = 0; i < 100; i = i+1) {
        float x = 0 + cos(2 * i * r) * radius;
        float y = 0 + sin(2 * i * r) * radius;
        vertex (x, y);
        }
        endShape();
      popMatrix ();
  }
  
  // switch keys to change stroke color of the main shapes
  
  switch (key) {
  case '1' :
    strokeColor = color (1,50);
    break;
     case '2' :
    strokeColor = color (200,1,1,10);
    break;
     case '3' :
    strokeColor = color (230,0,100,70);
    break;
      case '4' :
    strokeColor = color (244,97,34,10);
    break;
      }
    }
    
      
    


