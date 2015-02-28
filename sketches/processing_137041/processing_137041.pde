
/**
This visually demonstrates sin, cos, tan on a Unit Circle. 

Move the mouse around to how different angles affect the values. Note how the tangent does not cross over the quadrant: this was done by detecting that the tangent was below 0, and scaling. 
Meant to re-learn some basic geometry, to not forget, and to get a feeling of processing

Also ratios are derived by division and other methods, and match the computed values.
Author: Ryan Mills

Inspired from http://www.mathsisfun.com/sine-cosine-tangent.html
*/

int EDGE_OFFSET=175;
float angle; // angle ratio
float degreeValue; 


void setup(){
  size(500,575); 
}

void draw(){
  background(240);
  drawBase(); 
  drawText();
  drawTracers();  
}

/**
Draw the tracer line and elipse
*/
void drawTracers(){
  float rads = relativeRadians();
  float angle = getAngle();
  int l = (width - EDGE_OFFSET)/2;
  float xMove = sin(rads + HALF_PI) * l;
  float yMove = cos(rads + HALF_PI) * l ;
  float cX = originX() + xMove;
  float cY = originY() + yMove;
  
  int quad = quadrant();
  
  // x and y bolds
  pushStyle();
  strokeWeight(2);
  stroke(0, 0, 255);// blue
  line(originX(), originY(), cX, originY());
  float xDist = dist(originX(), originY(), cX, originY());
  fill(0, 0, 255);
  float labelX = xDist / l;
  if (quad == 2 || quad == 3){
     labelX = labelX * -1;  
  }
  text(str(labelX), cX, originY() + 15); //  half way better
  
  stroke(255, 0, 0); // red
  line(cX, originY(), cX, cY); 
  float yDist = dist(cX, originY(), cX, cY);
  float labelY = yDist / l;
  if (quad == 3 || quad == 4){
     labelY = labelY * -1;  
  }
  fill(255, 0, 0);
  text(str(labelY), cX + 15, cY ); // half way better
  popStyle(); 
  
  pushStyle();
  stroke(0,255,0); 
  strokeWeight(2);
  ellipse(cX, cY, 7, 7); // circle on end
  // tangent line
  // this will start at cX, cY, but will be tangent
  if ( abs(tan(rads)) < 1){
   // this is going over the respective quadrant 
   // l happens to be the length of the circle
   // this is where geometry gets quite interesting!
   l *= abs(tan(rads)); // shorten the line by the proportiate amount
   // now the line won't cross over the quadrant!
  }
  float tanXMove = sin(rads - PI ) * l; 
  float tanYMove = cos(rads - PI ) * l; 
  // determine to reverse
  if (quad == 3 || quad == 1 ){
    tanXMove *= -1;
    tanYMove *= -1; 
  }
  float computedX = cX + tanXMove; 
  float computedY = cY + tanYMove; 
  
  line(cX, cY, computedX, computedY );
  popStyle();
  pushStyle();
  noFill(); 
  stroke(150, 150, 150);
  // center line and circle dot
  line(originX(), originY(), cX, cY); 
  arc(originX(), originY(), 75.0, 75.0, -rads, 0 );
  popStyle(); 
  
    
  
  
}

/**
Determines which quadrant the mouse is in

1, 2, 3, 4 is returned
*/
int quadrant(){
  boolean left = false; 
  boolean right = false; 
  boolean top = false; 
  boolean bottom = false; 
  
  if (mouseX >= originX()){
    right = true;
    left = false;
  } 
    else {
      right = false; 
      left = true; 
    }
   if (mouseY >= originY()){
     bottom = true; 
     top = false;  
   }
     else {
        bottom = false; 
        top = true;  
     }
  
  if (right && top){
     return 1;  
  } else if (left && top){
     return 2;  
  } else if (left && bottom){
    return 3; 
  } else if (right && bottom){
     return 4; 
  }
  return 0; //something went wrong
}


float originX(){
   return width/2; 
}

float originY(){
   return height-width/2; 
}

float getAngle(){
  float distV = dist(originX(), originY(), mouseX, mouseY); 
  float distX = dist(mouseX, originY(), originX(), originY()); 
  float distY = dist(originX(), mouseY, originX(), originY());
  return distY / distX  ;
  
}

float relativeRadians(){
  angle = getAngle();
  float relativeRadians = atan(angle);
  int quad = quadrant(); 
  if (quad == 1){
     // degree value is fine 
  } else if (quad == 2){
      //relativeDegree = 90 + (90 - relativeDegree);
      relativeRadians = HALF_PI + (HALF_PI - relativeRadians); 
  } else if (quad == 3){
      //relativeDegree = 90 + (90 + relativeDegree);  
      relativeRadians = HALF_PI + (HALF_PI + relativeRadians); 
  } else if (quad ==4){
      //relativeDegree = 270 + (90 - relativeDegree); 
      relativeRadians = PI + HALF_PI + (HALF_PI - relativeRadians); 
  }
  
  return relativeRadians; 
  
}

void drawBase(){
  pushMatrix();
  translate(width/2, height-width/2);
  pushStyle(); 
  strokeWeight(2); 
  ellipse(0,0,width - EDGE_OFFSET, width - EDGE_OFFSET);
  popStyle();
  translate(-width, 0); // horizontal line
  line(0, 0, width*2, 0);
  popMatrix();
  pushMatrix();
  translate(width/2, height);
  line(0,0, 0, -width); // vertical line
  popMatrix(); 
}

void drawText(){
  pushStyle();
  PFont myFont; 
  myFont = createFont("Georgia", 13); 
  textFont(myFont); 
  fill(0,0,0); 
  angle = getAngle();
  float relRadians = relativeRadians();
  float relDegrees = degrees(relRadians); 
  fill(0, 0, 255);
  text("sin=" + sin(relRadians), width/2 -50, 10); 
  fill(255, 0, 0);
  text("cos="+ cos(relRadians), width/2 -50, 20); 
  fill(0, 150, 0); 
  text("tan="+ tan(relRadians), width/2 -50, 30); 
  fill(0,0,0); 
  text("Angle ratio:" +str(angle), width/2 -50, 40); 
  text("Relative Degree:" +str(relDegrees), width/2 -50, 50);
  text("Relative Radians:" +str(relRadians), width/2 -50, 60);
  text("Quadrant:" + str(quadrant()), width/2 - 50, 70); 
  popStyle(); 
  
}


