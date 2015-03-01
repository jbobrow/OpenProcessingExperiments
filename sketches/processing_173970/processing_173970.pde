
//by the video of the professor.
// Making an interactive sketch.
// Pressing the key mouse, it will draw different lines of different colors,shaping triangles and polygones. 


//Global variables
color strokeColor = color(0, 300);

// setup()
void setup()  {
size(720, 720);
colorMode(HSB, 360, 200, 200, 200);
noFill();
background(360);
}

//Draw()
  void draw() {
  if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  //Map(value, strart1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
 //Style
 strokeWeight(3);
stroke(strokeColor);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
   float x = 0 + cos(angle*i) * radius;
   float y = 0 + sin(angle*i) * radius;
   vertex(x, y);
   
 } 
 
 endShape();
 popMatrix();
 }
 }

void keyReleased(){
  if (key == BACKSPACE) background(360);
  if (key == 'h' ) saveFrame("screenshot.png");
  
  switch(key){
    case '1':
    strokeColor = color(100, 105, 120, 100);
    break;
    case '2':
    strokeColor = color(120, 130, 200, 200);
    break;
    case '3':
    strokeColor = color(200, 100, 100, 150);
    break;
    }
 
  }
  


