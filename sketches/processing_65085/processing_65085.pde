
void setup()
{
  size (800,800);
  smooth();
  loop();
  strokeWeight (0.5);
  colorMode (HSB);
   background (255);
}
 
void draw ()
{

   
  int rad = 300; //radius of the sphere
   
  for (int i = 0; i < 500; i++)
  {

  strokeWeight (random (0, 0.7));
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI), anglec1 = random (TWO_PI), anglec2 = random (TWO_PI);
  
  
  //Points
  //place the point in the center, then take it to the border with rad, anywhere along the circle (angle)
  PVector p1 = new PVector (width/2 + cos (angle1) * rad, height/2 + sin (angle1) * rad);
  PVector p2 = new PVector (width/2 + cos (angle2) * rad, height/2 + sin (angle2) * rad);
  
  
  //Bezier Control points
  // factor so that the de control points lie outside the circle
  float factor = random (1,1.4);
  PVector c1 = new PVector (width/2 + cos (anglec1) * factor * rad, height/2 + sin (anglec1) * factor * rad);
  PVector c2 = new PVector (width/2 + cos (anglec2) * factor * rad, height/2 + sin (anglec2) * factor * rad);
  
  
  // print straight lines   
  //  noFill();
  //  stroke (0, 290, 245);
  //  line (p1.x, p1.y, p2.x, p2.y);
  
  
  // print bezier lines
  noFill();
  // blue
  //stroke (35, 35, 114); 
  //stroke (1, 12, 82);

    stroke(mouseX, mouseY, mouseX+mouseY);
  bezier (p1.x, p1.y, c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
  
  
  // print circles
// noStroke();
//fill(100, 100);
//float a = random(10);
//float b = random(10);
//ellipse(p1.x, p1.y, a, a);
//ellipse(p1.x, p1.y, b, b);
//  
  
  //text boxes
//  fill(128);
//  rect(10,10,90,40);
//  fill(255);
//  text("angle1: "+angle1,15,25);
//  text("\nangle2: "+angle2,15,25);
  }
}
 
 
 
void mousePressed ()
{
  // redraw
  noLoop();
}

void mouseReleased ()
{
  // redraw
  loop();
}


