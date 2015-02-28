
// schiffman page 53
// exercise 4-4
// use variables to replace hard-coded values

int backgroundMaskStrength = 75;
float myMouseX;
float myMouseY;
boolean isDrawing = false;

//--------------------------
void setup(){
  size(400,400);
  smooth();
  background(255);
  
  float tX = width/2;
  float tY = height/2;
  
  drawLines(tX,tY);  
}


//--------------------------
void  drawLines(float p_mouseX,float p_mouseY){
  strokeWeight(2); 
  stroke(255,204,152);
  line(width/2,0,p_mouseX,p_mouseY);
  strokeWeight(2);
  stroke(170,154,239);
  line(0,height,p_mouseX,p_mouseY);
  stroke(143,215,235);
  line(width,height,p_mouseX,p_mouseY);
  stroke(255,255,255);
}


//--------------------------
void mousePressed(){
  isDrawing = !isDrawing;
}


//--------------------------
void draw(){

  if(isDrawing){
    // draw white transparent layer over
    // background to allow past movements 
    // to show briefly
    fill ( 255, 255, 255, backgroundMaskStrength);
    // needs extra to cover blue at edges that appears for
    // no reason I can think of
    rect (0, 0, width , height );
    drawLines(mouseX,mouseY);
  }
}
