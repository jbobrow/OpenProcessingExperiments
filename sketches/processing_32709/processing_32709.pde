
//by caitlin morris

/// example code demonstrating how the "invisible handle" vertex at the start
/// and end of curveVertex changes the shape of the overall curve
 
void setup() {
  size(400,600);
//  size(800,600);
}
 
void draw() {
 
  background(255);
   

  beginShape();
  
  // "invisible" line - shows up in pale gray
  stroke(150);
  strokeWeight(1);
    curveVertex(250,500);
    curveVertex(200,500);
    curveVertex(100,350);
    curveVertex(200,200);
   
  // ending vertex controlled by mouse position in X axis
   
  curveVertex(mouseX,60);
  curveVertex(mouseX,60);
   
  endShape();
 
  //this draws the little circle at the top of the line
  fill(0,255,255);
  ellipse(mouseX,60,15,15);
  println(mouseX+", 60");
  noFill();
  
  
  // "primary" / displayed line (this is what you'll actually see)
  stroke(0);
  strokeWeight(2);
 
  beginShape();
  curveVertex(250,500);
  curveVertex(200,500);
  curveVertex(100,350);
  curveVertex(200,200);
  curveVertex(mouseX,60);
  endShape();
  
  stroke(255,0,0);
  strokeWeight(8);
  noFill();
    point(250,500);
    point(200,500);
    point(100,350);
    point(200,200);
    //point(mouseX,60);
   
  // draw ellipses to display the points that the curve is based on
 
 
  stroke(0,255,0);
  strokeWeight(2);
  ellipse(200,500,10,10);
  ellipse(100,350,10,10);
  ellipse(200,200,10,10);
}


                
                                
