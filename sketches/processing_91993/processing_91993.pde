
  int minute = minute(); 
  int hour = hour();    
  int second = second();
  
void setup() {
  size(400, 400);
  smooth();
   
}
  
void draw() {
  background(175);
  translate(width/2, height/2);
 
 
   
  //minute-ellipse
  
  fill (175);
  ellipse (0,0, 290, 290);
  pushMatrix ();
  popMatrix ();
 
// second-ellipse

 fill (175);
  ellipse (0,0, 150, 150);
  pushMatrix ();
  popMatrix ();
  
// hour-hand
  
  pushMatrix();
  stroke(175);
  strokeWeight(17);
  float hourB = 360 / 12 * hour();
  rotate(radians(hourB));
  line(0, 0, 0, -220);
  popMatrix();
  
//second-hand

  pushMatrix();
  stroke(175);
  strokeWeight(6);
  float AB=map(millis(),0,1000,0,10);
  float secB = (360 / 60000 *second())+0.6*AB;
  rotate(radians(secB));
  line(0, 0, 0, -90);
  popMatrix();
   
// minute-hand
  
  pushMatrix();
  stroke(0);
  strokeWeight(8);
  float minB = 360 / 60 *minute();
  rotate(radians(minB));
  line(0, 0, 0, -145);
  popMatrix();
   
}



