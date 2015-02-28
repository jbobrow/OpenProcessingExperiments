


PFont f;

String[] searchWords;

// The radius of a circle
//float r = 210;
float r = 100;

// INNER ELLIPSE position
float xpos;
float ypos;

// timer doubleclick
float lastClick = millis(); 

//int innerEllipseW = 270;
int innerEllipseW = 100;

void setup() {
  size(1024, 768);
  
  f = createFont("Georgia",30,true);
  textFont(f);
  smooth();
  
  searchWords = loadStrings("esteem.txt");
  
  // Startposition
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  background(255);
  
  int tmpEllipseDist = int(dist(width/2, height/2, mouseX, mouseY));
  
  // move INNER ELLIPSE
  if(tmpEllipseDist < 40 && mousePressed){
    xpos = mouseX;
    ypos = mouseY;
  }
  
  if(tmpEllipseDist < 135 && mousePressed){
    cursor(HAND);
  }else{
    cursor(ARROW);
  }
  
  // OUTER ELLIPSE
  noFill();
  stroke(33, 60, 23);
  strokeWeight(10);
  ellipse(width/2, height/2, r*2 - 20, r*2 - 20);

  
  // INNER ELLIPSE
  fill(33, 60, 23);
  ellipse (xpos, ypos, innerEllipseW, innerEllipseW);
   
/*  // TITLE
  fill(40);
  textAlign(CENTER);
  textSize(30);
  text("esteem", width/2, height - 20);
  
  textSize(10);
  textAlign(LEFT);
*/
  
  // We must keep track of our position along the curve
  float arclength = 0;
  
  translate(width/2, height/2);
  
  // For every box
  for (int i = 0; i < searchWords.length; i++) {
    
    // The character and its width
    // char currentChar = message.charAt(i);
    // Instead of a constant width, we check the width of each character.
    float w = 17;
    // float w = textWidth(currentChar); 
    // Each box is centered so we move half the width
    arclength += w/2;
    
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;
    
    pushMatrix();
    
    // Polar to Cartesian conversion allows us to find the point along the curve. 
    // See Chapter 13 for a review of this concept.
    translate(r*cos(theta), r*sin(theta)); 
    
    // Rotate the box (rotation is offset by 90 degrees)
    rotate(theta + 2*PI); 
    
    // TEXTSIZE
    // make the distance and set a bigger fontSize
    int tmpDist = int(dist(xpos - width/2, ypos - height/2, r*cos(theta), r*sin(theta)));
    
    // FIXME
    // select less words
    if(tmpDist < 200){
      fill(40);
      textSize( map(tmpDist, 0, 150, 25, 3));
    }else{
      fill(40);
      textSize(6);
    }
    // TEXTSIZE END
    
    // Display the character
    text(searchWords[i],0,0);
    
    popMatrix();
    
    // Move halfway again
    arclength += w/2;
  }
  
}

boolean doubleClick(){
  //the moment in millisecond() of the current click
  float currentClick = millis();

  //the difference between the two clicks
  float clickDifference = currentClick - lastClick;

  //set lastClick equal to currentClick
  lastClick = currentClick;

  //maximum amount of time in milliseconds to be counted as a double-click
  float doubleClickSpeed = 200;

  if(clickDifference < doubleClickSpeed){
    return true;
  }
  else{
    return false;
  }

}

// normal or doubleclick 
void mousePressed () {
  if(doubleClick()){
    xpos = width/2;
    ypos = height/2;
    
    innerEllipseW = 180;
  }else{
    innerEllipseW = 100;
  }
}

