
PImage man;
float spin;
int num = 12;
float scalerX = 30;
float scalerY = 30;


float beginX = 300.0;  // Initial x-coordinate
float beginY = 250.0;  // Initial y-coordinate
float endX = 450.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.02;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0


void setup(){
  size(500,500);
  man = loadImage("try2.jpg");
  //colorMode(HSB,100);
  background(255);
  spin = 4;
  noStroke();
  distX = endX - beginX;
  distY = endY - beginY;
  
  smooth();
}





void draw(){
  
  //image(man,0,300);
  loadPixels();
  spin += .01;
  fill(random(255),random(255),random(255),90);
   pct += step;
  if (pct < 1.0) 
   {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
    }
  
   
  
  //fill(255);
  ellipse(x,y,random(40),random(40));
  
  if (pct > .9){
    changeXY();
    addCircle();
  }
  /*
  for(int i = 0; i < num; i++) {
    pushMatrix();
   
    rotateY(spin );
    rotateX(spin/2 );
    
    //triangle(200,250,300,200,250,300);
    box(width/2,height/2,50);
    popMatrix();
  }*/
}
  
    
    
void changeXY(){
  
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = random(120-scalerX,400+scalerX);
  constrain(endX,0,120);
  endY = random(120-scalerY,400+scalerY);
  constrain(endY,0,300);
  distX = endX - beginX;
  distY = endY - beginY;
  ++scalerX;
  ++scalerY;
}

void addCircle(){
  
  ellipse(x,y,random(50),random(50));
  translate(30,40);
  
}


