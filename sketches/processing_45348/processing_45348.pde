
float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 0.5;
float mx = 0;
float my = 0;


void setup(){
  size(800, 600);
  noStroke();
  smooth();
}

void draw(){ 
  background(#F7F9FE);
  frameRate(20);
  
  fill(#BED2D9); 
  ellipse(mx, my, 30, 30); // center circle
  
  //
  noFill();
  strokeWeight(sw);
  
  // increasing variables
  x += 15;
  y += 15;
  x2 += 10;
  y2 += 10;
  x3 += 5;
  y3 += 5;

  
  //
  stroke(#CBDBE0);
  ellipse(mx, my, x, y);
  
  stroke(#DCE8EB);
  ellipse(mx, my, x2, y2);
  
  stroke(#ECF1F2);
  ellipse(mx, my, x3, y3);
}

void mouseClicked(){
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  
  mx = pmouseX;
  my = pmouseY;
  
  println(my+" "+my);
  
  sw += 5;
}


