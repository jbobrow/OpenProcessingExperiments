
import processing.pdf.*;

float x, y, myRotate;
int numAssets = 345;
int startX = 25;
int startY = 25;
int spacingX = 25;
int spacingY = 25;
int gridCols = 23;
// set defuat to false
boolean paused = false;
boolean record = false;

// pick some colors, use arrayList
//red, green, blue
//myColors[1];
//myColors.length = 3
//(int)random(myColors.length) =
color[]myColors = {#FF0000,#00FF00,#0000FF};
color[]pickedColors;

void setup() {
  size(600, 400);
  background(#ECECEC);
  smooth();
  
  pickedColors = new color[numAssets];
  
  setColors();
 
  }
  
  void setColors(){
    for(int i=0; i<numAssets; i++){
    pickedColors[i] = myColors[ (int)random(myColors.length) ];
    
  }
  
}

void draw() {
  if (record) {
    beginRecord(PDF, "render-####.pdf");
  }
  
  // repaint background to white
  background(#ECECEC);
  
  strokeWeight(2);
  fill(#FFFFFF);
  
  // where to start, till when?, how to count
  for (int i = 0; i<numAssets; i++) {

    int row = floor ( i/gridCols );
    int col = i % gridCols;

    // find x and y positions
    x = startX + (col * spacingX);
    y = startY + (row * spacingY);
    
    strokeWeight(2);
    stroke(#FF3300,random(255));
    fill( pickedColors[i] );
    
    rectMode(CENTER);
    myRotate = radians(   (int)random(360)   );
    
    pushMatrix();
      //scale( (random(3)+1) * 0.5 );
      translate(x, y);
      //rotate(myRotate);
      rect(0, 0, 20, 20);
    popMatrix();
  
   }
   
   if (record) {
     endRecord () ;
     record = false ;
   }
}
void keyPressed(){
 
 if (key == ' '){
  // press the spacebar to pause the animation
  if (paused) {
    //restart
    loop();
    paused = false;
  } else {
    // stop animation
    noLoop();
    paused = true;
  }
}

if (key == '+') {
  redraw();
}
if (key == 'r') {
  record = true;
  draw();
}

if (key == 'c'){
  setColors();
  draw();
}

}


