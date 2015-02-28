
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float x, y;
float rX, rY;

void setup(){
  size(600,600);
  background(255);
  smooth();
  // change colorMode to range of sketch window
  colorMode(RGB, width, width, height);
  x = width/2;
  y = height/2;
  
}

void draw(){
    noFill();
    // draw ellipse
    stroke(x,0,y,100);
    rect(x,y,10,10);
    // generate parameters for scrible effect    
    rX = random (-10,+10);
    rY = random (-10,+10);
    // adding scrible effect to x,y
    x = x + rX;
    y = y + rY;
    // constraining x,y to sketch window 
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
    
    // use of lerp() command to attract the ellipse to mouse 
    if (mousePressed){
      x = lerp(x, mouseX, 0.01);
      y = lerp(y,mouseY, 0.01);
    }
}
