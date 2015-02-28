
void setup()
{
  size(895, 501);
  background(255);
  smooth();
}


void draw()
{
  //Main rects
  pushMatrix();
  noStroke();
  fill(0);
  rect(47, 60, 216, 382);
  rect(339, 60, 216, 382);
  rect(630, 60, 216, 382);
  popMatrix();
  resetMatrix();
  
  //Dividing lines
  pushMatrix();
  noStroke();
  fill(255);
  rect(76, 248, 158, 3);
  rect(368, 248, 158, 3);
  rect(659, 248, 158, 3);
  popMatrix();
  resetMatrix();
  
  //Vertical line
  pushMatrix();
    
    if (hour()<6)
  {
    fill (40);
  }
  else
  { fill(200); }
    
    
  if (hour()>=17)
  {
    fill (40);
  }
  else
  { fill(200); }

  rect(301, 194, 2, 112);
  popMatrix();
  resetMatrix();
  

  
  //Hours
  int h = hour() % 12; // from 0 - 23 to 0 - 11
  if (h == 0) {
  h = 12; // now 1 - 12
  }
  
  //Row 1
  //1
  pushMatrix();
  if (h== 8 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(96, 100, 40, 40);
  popMatrix();
  resetMatrix();  
  
  //2
  pushMatrix();
  noFill();
  ellipse(155, 100, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //3
  pushMatrix();
  if (h== 4 || h== 6 || h== 7 || h== 8 || h== 9 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(214, 100, 40, 40);
  popMatrix();
  resetMatrix();  
  
  
  //Row 2
  //1
  pushMatrix();
  if (h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(96, 157, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //2
  pushMatrix();
  if (h== 1 || h== 2 || h== 3 || h== 5 || h== 6 || h== 7 || h== 9 || h== 10 || h== 11) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(155, 157, 40, 40);
  popMatrix();
  resetMatrix();

  //3
  pushMatrix();
  if (h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(214, 157, 40, 40);
  popMatrix();
  resetMatrix();   
  
  
  //Row 3
  //1
  pushMatrix();
  if (h== 4 || h== 6 || h== 7 || h== 8 || h== 9 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(96, 214, 40, 40);
  popMatrix();
  resetMatrix();  
  
  //2
  pushMatrix();
  noFill();
  ellipse(155, 214, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //3
  pushMatrix();
  if (h== 8 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(214, 214, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  
  //Row 4
  //1
    pushMatrix();
  if (h== 5 || h== 7 || h== 8 || h== 9 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(96, 286, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //2
  pushMatrix();
  noFill();
  ellipse(155, 286, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //3
  pushMatrix();
  if (h== 3 || h== 4 || h== 5 || h== 6 || h== 7 || h== 8 || h== 9 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(214, 286, 40, 40);
  popMatrix();
  resetMatrix();   
  

  //Row 5
  //1  
  pushMatrix();
  if (h== 9 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(96, 343, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //2
  pushMatrix();
  if (h== 2 || h== 6 || h== 10) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(155, 343, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //3
  pushMatrix();
  if (h== 9 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(214, 343, 40, 40);
  popMatrix();
  resetMatrix();    
  
  
  //Row 6
  //1
  pushMatrix();
  if (h== 3 || h== 4 || h== 5 || h== 6 || h== 7 || h== 8 || h== 9 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(96, 400, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //2
  pushMatrix();
  noFill();
  ellipse(155, 400, 40, 40);
  popMatrix();
  resetMatrix(); 
    
  //3
  pushMatrix();
  if (h== 5 || h== 7 || h== 8 || h== 9 || h== 10 || h== 11 || h== 12) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(214, 400, 40, 40);
  popMatrix();
  resetMatrix();   
  



  
  //Minutes 

  int m1 = int(minute() / 10);
  int m2 = minute() % 10;
  
  
  //Minutes 1
  //Row 1
  //1
  pushMatrix();
  noFill();
  ellipse(388, 100, 40, 40);
  popMatrix();
  resetMatrix();  
 
  //2
  pushMatrix();
  noFill();
  ellipse(447, 100, 40, 40);
  popMatrix();
  resetMatrix();  
  
  //3
  pushMatrix();
  if (m1== 4) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(506, 100, 40, 40);
  popMatrix();
  resetMatrix();   
  
  
  //Row 2
  //1
  pushMatrix();
  noFill();
  ellipse(388, 158, 40, 40);
  popMatrix();
  resetMatrix();  

  //2
  pushMatrix();
  if (m1== 1 || m1== 2 || m1== 3 || m1== 5) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(447, 158, 40, 40);
  popMatrix();
  resetMatrix();     
  
  //3
  pushMatrix();
  noFill();
  ellipse(506, 158, 40, 40);
  popMatrix();
  resetMatrix();  
  
  
  //Row 3
  //1
  pushMatrix();
  if (m1== 4) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(388, 215, 40, 40);
  popMatrix();
  resetMatrix(); 

  //2
  pushMatrix();
  noFill();
  ellipse(447, 215, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //3
  pushMatrix();
  noFill();
  ellipse(506, 215, 40, 40);
  popMatrix();
  resetMatrix();  
  
  
  //Row 4
  //1
  pushMatrix();
  if (m1== 5) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(388, 286, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //2
  pushMatrix();
  noFill();
  ellipse(447, 286, 40, 40);
  popMatrix();
  resetMatrix();  
  
  //3
  pushMatrix();
  if (m1== 3 || m1== 4 || m1== 5) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(506, 286, 40, 40);
  popMatrix();
  resetMatrix();   
  
  
  //Row 5
  //1
  pushMatrix();
  noFill();
  ellipse(388, 343, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //2
  pushMatrix();
  if (m1== 2) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(447, 343, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //3
  pushMatrix();
  noFill();
  ellipse(506, 343, 40, 40);
  popMatrix();
  resetMatrix();  
  
  
  //Row 6
  //1
  pushMatrix();
  if (m1== 3 || m1== 4 || m1== 5) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(388, 400, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //2
  pushMatrix();
  noFill();
  ellipse(447, 400, 40, 40);
  popMatrix();
  resetMatrix();  
  
  //3
  pushMatrix();
  if (m1== 5) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(506, 400, 40, 40);
  popMatrix();
  resetMatrix();     
  
  
  
  //Minutes 2
  //Row 1 
  //1
  pushMatrix();
  if (m2== 8) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(680, 100, 40, 40);
  popMatrix();
  resetMatrix();   

  //2
  pushMatrix();
  noFill();
  ellipse(739, 100, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //3
  pushMatrix();
  if (m2== 4 || m2== 6 || m2== 7 || m2== 8 || m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(798, 100, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  
  //Row 2
  //1
  pushMatrix();
  noFill();
  ellipse(680, 158, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //2
  pushMatrix();
  if (m2== 1 || m2== 2 || m2== 3 || m2== 6 || m2== 7 || m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(739, 158, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //3
  pushMatrix();
  noFill();
  ellipse(798, 158, 40, 40);
  popMatrix();
  resetMatrix();    
  
  
  //Row 3
  //1
  pushMatrix();
  if (m2== 4 || m2== 6 || m2== 7 || m2== 8 || m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(680, 215, 40, 40);
  popMatrix();
  resetMatrix();   
  
  //2
  pushMatrix();
  noFill();
  ellipse(739, 215, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //3
  pushMatrix();
  if (m2== 8) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(798, 215, 40, 40);
  popMatrix();
  resetMatrix();   
  
  
  //Row 4
  //1
  pushMatrix();
  if (m2== 5 || m2== 7 || m2== 8 || m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(680, 286, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //2
  pushMatrix();
  noFill();
  ellipse(739, 286, 40, 40);
  popMatrix();
  resetMatrix();  
  
  //3
  pushMatrix();
  if (m2== 3 || m2== 4 || m2== 5 || m2== 6 || m2== 7 || m2== 8 || m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(798, 286, 40, 40);
  popMatrix();
  resetMatrix();   
  
  
  //Row 5
  //1
      pushMatrix();
  if (m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(680, 343, 40, 40);
  popMatrix();
  resetMatrix(); 
  
  //2
  pushMatrix();
  if (m2== 2 || m2== 6) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(739, 343, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //3
    pushMatrix();
  if (m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(798, 343, 40, 40);
  popMatrix();
  resetMatrix(); 

  
  //Row 6
  //1
  pushMatrix();
  if (m2== 3 || m2== 4 || m2== 5 || m2== 6 || m2== 7 || m2== 8 || m2== 9 ) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(680, 400, 40, 40);
  popMatrix();
  resetMatrix();
  
  //2
  pushMatrix();
  noFill();
  ellipse(739, 400, 40, 40);
  popMatrix();
  resetMatrix();    
  
  //3
  pushMatrix();
  if (m2== 5 || m2== 7 || m2== 8 || m2== 9) {
    fill(255);
  }
  else {
    noFill();
  }
  ellipse(798, 400, 40, 40);
  popMatrix();
  resetMatrix();  
  
  
  
    println(hour());
    println(minute());
}

