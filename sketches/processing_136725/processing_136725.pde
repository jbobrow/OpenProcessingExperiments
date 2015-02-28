
//sample interactive project1 from text book generative design www.generative-gestaltung.de P_2_0_03

/*
MOUSE
position x : lenght}
position y : thickness and number lines to be drawn
ckness and number lines to be drawn
drag : draw

KEYS
1-3: STROKE COLOR
del, backspace : erase
s : save png

*/

//variables globales
color strokeColor = color(0, 10);

//setup
void setup() {
  size(720,720);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
}

//draw
  void draw() {
  if(mousePressed){// or == true
   pushMatrix();
  translate(width/2, height/2);
  //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 25);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  //style
  strokeWeight(10);
  stroke(strokeColor);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
  point(x,y);
  }
  endShape();
  popMatrix();
  }
  }
   void keyReleased() {
    if(key == DELETE || key == BACKSPACE) background(360);
    if(key == 's' || key =='S') saveFrame("screenshot.png");
    
    switch(key){
      case '1':
      strokeColor = color(0, 10);
      break;
       case '2':
      strokeColor = color(192, 100, 64, 10);
      break;
      case '3':
      strokeColor = color(52, 100, 71, 10);
     break;
    }
  }

