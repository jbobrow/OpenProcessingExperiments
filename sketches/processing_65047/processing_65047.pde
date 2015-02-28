
// Pressing Control-R will render this sketch.
  
  
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
void setup() {
  size(640, 360);
  smooth();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(102);
  boolean rect_mouse = false;
  boolean in_rect = false;
  boolean circle_mouse = false;
  boolean in_circle = false;
  
  if(mouseX >= rx && mouseX <= rx+rd && mouseY >= ry && mouseY <= ry+rd)
  {
    if(mousePressed == true)
    {
      rect_mouse = true;
      fill(136, 223, 80);
    }
    else
    {
      in_rect = true;
      fill(255, 0, 0);
    }
  }
  else
  {
    fill(255);
  }
  rect(rx, ry, rd, rd);
  if (rect_mouse == true)
  {
    strokeWeight(4);
    line(rx+33, ry+25, rx+33, ry+40);
    line(rx+66, ry+25, rx+66, ry+40);
    line(rx+32, ry+74, rx+67, ry+74);
  }
  else if (in_rect == true)
  {
    strokeWeight(4);
    line(rx+33, ry+27, rx+33, ry+40);
    line(rx+67, ry+27, rx+67, ry+40);
    arc(rx+50, ry+80, 30, 20, PI, TWO_PI);
    line(rx+20, ry+20, rx+40, ry+30);
    line(rx+60, ry+30, rx+80, ry+20);
  }
  
  strokeWeight(1);
  float d = dist(ex, ey, mouseX, mouseY);
  if(d <= ed/2)
  {
    if(mousePressed == true)
    {
      circle_mouse = true;
      fill(250, 240, 20);
    }
    else
    {
      in_circle = true;
      fill(0, 0, 220);
    }
  }
  else
  {
    fill(255);
  }
  ellipse(ex, ey, ed, ed);
  if (circle_mouse == true)
 {
    strokeWeight(4);
    line(ex-13, ey-12, ex-13, ey-24);
    line(ex+13, ey-12, ex+13, ey-24);
    arc(ex, ey+20, 30, 20, 0, PI);
 } 
 else if (in_circle == true)
 {
   strokeWeight(4);
   line(ex-13, ey-12, ex-13, ey-24);
   line(ex+13, ey-12, ex+13, ey-24);
   arc(ex, ey+30, 30, 20, PI, TWO_PI);
 }
 strokeWeight(1);
}


