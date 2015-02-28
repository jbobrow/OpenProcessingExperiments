
void setup(){
  
  size(400,400);  
  smooth();
  background(0,0,0);

//Triangles & shapes
  noStroke();
  fill(255,70,70,255);//red
  triangle(275,0,0,200,240,400);
  
  noStroke();
  fill(254,255,15,175);//yellow
  triangle(325,0,240,400,0,260);
 
  
  noStroke();
  fill(2,2,237,150);
  triangle(0,100,175,325,400,225);
  
  
  noStroke();
  fill(10,160,46,130);//green
  beginShape();
  vertex(400,0);
  vertex(240,400);
  vertex(175,325);
  vertex(0,400);
  vertex(400,0);
  endShape(CLOSE);
  
  //Lines
  stroke(255,255,255);
    noFill();
    strokeWeight(7);
    triangle(275,0,0,200,240,400);
 
   noFill();
   strokeWeight(5);
   triangle(0,100,175,325,392,225);
   
   noFill();
   strokeWeight(10);
   triangle(325,0,240,400,0,260);
   
   noFill();
   strokeWeight(3.8);
   beginShape();
  vertex(400,0);
  vertex(240,400);
  vertex(175,325);
  vertex(0,400);
  vertex(400,0);
  endShape(CLOSE);
  
  noFill();
  strokeWeight(6); 
  bezier(328,0,428,130,440,300,240,400);
  
  noFill();
  strokeWeight(5); 
  bezier(275,0,133,30,0,150,0,200);
  
  strokeWeight(5.5);
  line(400,0,240,400);
  
  strokeWeight(5);
  bezier(240,400,133,400,25,350,40,230);
  
}

