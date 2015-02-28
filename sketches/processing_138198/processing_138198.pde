
//Like a blooming bud
//It show the cycle of a flower flower the time it was only a bud
//until it blooms and withered
//Just like the life of a human being
//The life hidden within us
//HYPERLINK 
/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYS
1-4 : stroke color
del, backspace : erase
s : save png

*/
color strokeColor = color(10, 20);

PImage fractal;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 80, 90, 100); 
  noFill();
  background(360);
  fractal = loadImage("garden.jpg");
}  

void draw(){
image(fractal, 0, 0);
  if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;

  strokeWeight(1);
  stroke(strokeColor);

  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    vertex(x, y);
  }
  
  endShape();
  popMatrix();
float theta = 0;
    translate(width/2,height/2);
  
    for(float i = 0; i < TWO_PI; i += 0.2) {
      pushMatrix(); 
      rotate(theta + i);
      line(0,0,100,0);
    
    for(float j = 0; j < TWO_PI; j += 0.5) {
      pushMatrix();
      translate(100,0);
      rotate(-theta-j);
      line(0,0,50,0);
      popMatrix();
    }
      popMatrix();
  }
      theta += 0.01;
}
}

void keyReleased(){
  if (key == DELETE) background(360);
  if (key == 's') saveFrame("bloomingbud.png");

  switch(key){
    case '1':
    strokeColor = color(40, 20, 16, 16);
     break;
    case '2':
     strokeColor =color(195, 324, 85, 89);
     break;
    case '3':
     strokeColor =color(55, 45, 81, 40);
     break;
    case '4':
     strokeColor =color(65, 99, 71, 50);
     break; 
    }
}




