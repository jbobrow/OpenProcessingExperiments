
  
  
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float easing=0.01;
boolean rectOver = false;
boolean circleOver = false;  
color rectColor,circleColor,baseColor;
color rectHighlight,circleHighlight;
color currentColor;

void setup() {
  size(640, 360);
  smooth();
  rectColor = color(200);
  rectHighlight = color(50);
  circleColor = color(255);
  circleHighlight = color(240);
  baseColor = color(255);
  currentColor = baseColor;

// Set the x- and y-coordinates for the rectangle
  ry = height * 0.3 + rd;   
// Set the x- and y-coordinates for the ellipse
  ey = height * 0.3;
}
  
  
void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  noStroke();
  float targetX=mouseX;


//set rect
  rx += (targetX-rx)*easing;

//set circle
  ex += (targetX-ex)*easing*3;
  
  
  if (mousePressed == true && circleOver)
  {
     //currentColor = circleColor;
      fill(199,80,27,50);      
      ellipse(ex-5, ey-5, ed, ed);
      fill(27,125,162,50);
      ellipse(ex+5, ey+5, ed, ed);
  }else{
      if(circleOver) {
        fill(circleHighlight);
      } else {
        fill(circleColor);
      }    
      stroke(100);
      strokeWeight(0.5);
      ellipse(ex, ey, ed, ed);
  }
  
  if (mousePressed == true && rectOver)
  {
       fill(rectHighlight);    
       rect(rx-15, ry-15, rd+30, rd+30); 
  }else if(mousePressed != true && rectOver){
       fill(rectHighlight);
       rect(rx, ry, rd, rd);         
  }else{
       noStroke();
       fill(rectColor);
       rect(rx, ry, rd, rd);  
    }
}



void update(int x, int y)
{
  if( overCircle(ex, ey, ed) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rx, ry, rd, rd) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}



boolean overRect(float x, float y, float width, float height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(float x, float y, float diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

