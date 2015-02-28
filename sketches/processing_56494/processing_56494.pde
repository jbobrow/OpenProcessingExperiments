
// TOPOGRAFIA ALGORITMICA
// ej2sem2
// MARTIN ZUMAYA
int vx = 4, vy = 2, step = 50;
float t = 0, cx, cy, r = 100;
// _ _ _ _ _ _ _ _ _ _ _ _ _ _
// _ _ _ _ _SETUP _ _ _ _ _ _ _ _ _
void setup() {
  size(700, 700);
  smooth();
  // colorMode(HSB,100); 
  background(21, 131, 152);
  cx = width/2;
  cy = height/2;
}
// _ _ _ _ _ _ _ _ _ _ _ _ _ _
// _ _ _ _ _DRAW _ _ _ _ _ _ _ _ _
void draw() {

  fill(21, 131, 152, 50);
  rect(0, 0, width, height);

  noFill();

  float X = width/(mouseX+10);
  float Y = mouseY;

  float r = sqrt(mouseX*mouseX+mouseY*mouseY);

  for ( int i = 0; i < width+step; i += step) {
    for ( int j = 0; j < height+step; j += step) {
      
     stroke(255,j%255);

     ellipse(i,j,2*step+200*sin(t)*sin(t),2*step+200*sin(t)*sin(t));

//      ellipse(i, j, step+r,step+r);
    }
  }

  t += 0.02;
}
// _ _ _ _ _ _ _ _ _ _ _ _ _ _
// _ _ _ _ _INTERACCION _ _ _ _ _ _ _ _ _
void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}


