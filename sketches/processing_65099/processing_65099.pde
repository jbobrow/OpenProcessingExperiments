


void setup()
{
  size (600, 600);
  smooth();
  strokeWeight (0.5);
  background (240);
  loop ();

}
 
void draw ()
{
 
   
  int rad = 200; //radius of the sphere
  
  strokeWeight (random (0, 0.7));
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI), anglec1 = random (TWO_PI), anglec2 = random (TWO_PI);
    
  //Points
  //place the point in the center, then take it to the border with rad, anywhere along the circle (angle)
  PVector p1 = new PVector (width/2 + cos (angle1) * rad, height/2 + sin (angle1) * rad);
  PVector p2 = new PVector (width/2 + cos (angle2) * rad, height/2 + sin (angle2) * rad);
  
  
  //Bezier Control points
  // factor so that the de control points lie outside the circle
  float factor = random (1.1,1.4);
  PVector c1 = new PVector (width/2 + cos (anglec1) * factor * rad, height/2 + sin (anglec1) * factor * rad);
  PVector c2 = new PVector (width/2 + cos (anglec2) * factor * rad, height/2 + sin (anglec2) * factor * rad);
  
  // print straight lines   
  //  noFill();
  //  stroke (0, 290, 245);
  //  line (p1.x, p1.y, p2.x, p2.y);
  
  
  // print bezier lines
  noFill();
  // stroke (35, 35, 114); blue
  stroke (random(255), random(255));
  bezier (p1.x, p1.y, c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
  
  
  //text boxes
//  fill(128);
//  rect(10,10,90,40);
//  fill(255);
//  text("angle1: "+angle1,15,25);
//  text("\nangle2: "+angle2,15,25);


}


void mousePressed ()
{
  noLoop();
  fill(0);
  textAlign(CENTER, CENTER);
  text("Paused ||", 300, 300); 
}


void mouseReleased ()
{
  // redraw
  loop ();
  fill(230);
  textAlign(CENTER, CENTER);
  text("Paused ||", 300, 300); 
}


