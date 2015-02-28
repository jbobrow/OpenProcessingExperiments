
class Cube
{
  float y1, y2, y3, y4, x1, x2, x3, x4, y5, y6;
  float pt1, pt2, midpoint;
  float mX, mY;
  float amt;

  color light, darkLeft, darkRight; 
  color left, right;
  
  Cube(float mouse_X, float mouse_Y, float amount, float point1, float point2, float midPoint)
  {
    amt = amount;
    mX = mouse_X;
    mY = mouse_Y;
    pt1 = point1;
    pt2 = point2;
    midpoint = midPoint;
  }
  
  void cubeMath()
  {  
    y1 = lerp(0, mY, amt); //change this amount 0.8
    y2 = lerp(400, mY, amt);
  
    y3 = lerp(y1, midpoint, 0.3);
    y4 = lerp(y2, midpoint, 0.3);
  
    x1 = lerp(mX, pt1, 0.3);
    x2 = lerp(mX, pt2, 0.3);
  
    float XYdiff = lerp(x1, x2, 0.5);
    x3 = lerp(mX, XYdiff, 1.52);
    y5 = lerp(y1, midpoint, 0.46);
    y6 = lerp(y2, midpoint, 0.46);

    float diff = mX/2.35; //scale mouse to RGB range
    float diffDiff = 255 - diff;
  
    //println(diff + " " + diffDiff);
  
    darkLeft = color(diff);
    light = color(255);
    left = lerpColor(darkLeft, light, 0.5);
  
    darkRight = color(diffDiff);
    right = lerpColor(darkRight, light, 0.5);
  }
  
  void display()
  {
    
    stroke(200);
    strokeWeight(0.5);
  
    line(x1, 0, x1, screen.height);
    line(x2, 0, x2, screen.height);
    line(0, y1, 600, y1);
    line(0, y2, 600, y2);
  
    line(0, y5, 600, y5);
    line(0, y6, 600, y6);
  
    //front
    line(mX, 0, mX, screen.height);
    line(x3, 0, x3, screen.height);
  
    stroke(0);
    strokeWeight(1);
    
    //left
    line(pt1, midpoint, mX, y1);
    line(pt1, midpoint, mX, y2);
  
    //right
    line(pt2, midpoint, mX, y1);
    line(pt2, midpoint, mX, y2);
  
    //top
    line(pt1, midpoint, x2, y3);
    line(pt2, midpoint, x1, y3);
  
    //bottom
    line(pt1, midpoint, x2, y4);
    line(pt2, midpoint, x1, y4);
  
    stroke(255, 0, 0);
    strokeWeight(1);
    line(mX, y1, mX, y2);
    
    fill(right, 150);
  
    //TOP Counter clockwise
    beginShape();
    vertex(x1, y3);
    vertex(mX, y1);
    vertex(x2, y3);
    vertex(x3, y5);
    vertex(x1, y3);
    endShape();
  
    fill(left, 150);
  
    //BOTTOM Clockwise
    beginShape();
    vertex(x1, y4);
    vertex(mX, y2);
     vertex(x2, y4);
    vertex(x3, y6);
    vertex(x1, y4);
    endShape();
  
    line(x3, y5, x3, y6);
  
    //LEFT SIDE Counter clockwise
    beginShape();
    vertex(mX, y1);
    vertex(x1, y3);
    vertex(x1, y4);
    vertex(mX, y2);
    vertex(mX, y1);
    endShape();
  
    fill(right, 100);
  
    //RIGHT SIDE Clockwise
    beginShape();
    vertex(mX, y1);
    vertex(x2, y3);
    vertex(x2, y4);
    vertex(mX, y2);
    vertex(mX, y1);
    endShape();
  
//  fill(0);
//  //Clockwise
//  text(int(x1) + ", " + int(y3), x1, y3); //point 1
//  text(int(x2) + ", " + int(y3), x2, y3); //point 2
//  text(int(x2) + ", " + int(y4), x2, y4); //point 3
//  text(int(x1) + ", " + int(y4), x1, y4); //point 4
//  
//  text(mX + ", " + int(y1), mX, y1); 
//  text(mX + ", " + int(y2), mX, y2); 
  }
}

