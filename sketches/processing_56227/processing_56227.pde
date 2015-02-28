
  float cx;
  float cy;
  
//inicialitzaciÃ³
void setup(){
  smooth();
  size(800, 400);
  background(0);
  cx=width/2;
  cy=height/2;
}

//pintar
void draw(){
  //clear the background with transparency
  stroke(0,0,0);
  fill (0,0,0,3);
  rect(0,0,width,height);
  
  //draw the stroke
  fill (255,0,0,255);
  stroke(255,0,0);
  triangle(cx,cy,pmouseX,pmouseY,mouseX,mouseY);
  //line (cx, cy, mouseX, mouseY);
  cx=0.95*cx + 0.05*mouseX;
  cy=0.95*cy + 0.05*mouseY;
  
  
}

