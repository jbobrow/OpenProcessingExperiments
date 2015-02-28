
float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 0.5;

void setup(){
  size(250, 250);
  noStroke();
  smooth();
}

void draw(){ 
  background(#F7F9FE);
  frameRate(20);
  
  fill(#BED2D9); 
  ellipse(125, 62.5, 10, 10); // center circle
  
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
  stroke(#CBDBE0, 150);
  ellipse(125, 62.5, x, y);
  
  stroke(#DCE8EB, 150);
  ellipse(125, 62.5, x2, y2);
  
  stroke(#ECF1F2, 150);
  ellipse(125, 62.5, x3, y3);

//bottom circles
  fill(#BED2D9); 
  ellipse(125, 187.5, 10, 10); // center circle
  //strokes
  noFill();
  strokeWeight(sw);
  //
  stroke(#CBDBE0, 150);
  ellipse(125, 187.5, x, y);
  
  stroke(#DCE8EB, 150);
  ellipse(125, 187.5, x2, y2);
  
  stroke(#ECF1F2, 150);
  ellipse(125, 187.5, x3, y3);
  
  
//right circles
  fill(#BED2D9); 
  ellipse(187.5, 125, 10, 10); // center circle
  noFill();
  strokeWeight(sw);
  //
  stroke(#CBDBE0, 150);
  ellipse(187.5, 125, x, y);
  
  stroke(#DCE8EB, 150);
  ellipse(187.5, 125, x2, y2);
  
  stroke(#ECF1F2, 150);
  ellipse(187.5, 125, x3, y3);
  
//left circles
  fill(#BED2D9); 
  ellipse(62.5, 125, 10, 10); // center circle
  noFill();
  strokeWeight(sw);
  //
  stroke(#CBDBE0, 150);
  ellipse(62.5, 125, x, y);
  
  stroke(#DCE8EB, 150);
  ellipse(62.5, 125, x2, y2);
  
  stroke(#ECF1F2, 150);
  ellipse(62.5, 125, x3, y3);
}

void mouseClicked(){
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  
  sw += 5;
  
  if(sw > 35){
    sw = 5;}

}




