
void setup()
{
  size(800, 850);
  float x = (width/2);
  float y = (height/2);
  background(250);
  smooth();
  stroke(0);
  strokeWeight(2);  
  noFill();
  
  //Face
  drawFace(x, y);

  //Body
 // drawBody(x, y);

  //Clothes
 // drawClothes(x, y);
}

void draw()
{
  //nothing yet...
  float x = (width/2);
  float y = (height/2);
  
  background(250);
  
  
  smooth();
  noFill();
  drawFace(x, y);
 // drawBody(x, y);
 // drawClothes(x, y);
}

void drawFace(float x, float y)
{

  //Goggles
  //lens
  fill(50, 5, 9);
  ellipse(x, 275, 155, 155);
  fill(250);
  ellipse(x, 275, 125, 125);
  
  
  //strapOne
  beginShape();
  fill(0,0,225);
  vertex( x+77.5, 265 );
  vertex( x+150, 265 ); 
  vertex( x+150, 290 );
  vertex( x+77.5, 290 );
  endShape(CLOSE);
  
  //strapTwo
  beginShape();
  fill(225,0,0);
  vertex( x-150, 265 );
  vertex( x-77.5, 265 );  
  vertex( x-77.5, 290 );
  vertex( x-150, 290 );
  endShape(CLOSE);
  
  //Hair
  line(x, 150, x-20, 95);
  line(x, 150, x, 80);
  line(x-2, 150, x-20, 95);
  line(x, 150, x+16, 95);
  line(x-2, 150, x+15, 65);
  line(x, 150, x-10, 68);
  line(x+2, 150, x-5, 95);
  line(x, 150, x+5, 75);
  line(x, 150, x-20, 75);
  line(x+2, 150, x+10, 95);
  line(x, 150, x-20, 95);

  //Mouth
  beginShape();
  fill(0,225,0);
  curveVertex(x-55, 420);
  curveVertex(x-55, 420);
  curveVertex(x-35, 405);
  curveVertex(x+10, 397);
  curveVertex(x+55, 425);
  curveVertex(x+55, 425);
  endShape(CLOSE);
  
  
  //Eyes
  float eyeX = mouseX;
  float eyeY = mouseY;
  float deg;
  float cY;
  float cX;
  deg = atan(abs(eyeY-275)/abs(eyeX-x));
  cY = 32.5*sin(deg);
  cX = 32.5*cos(deg);
  //getting the eye to follow the mouse
  if ((eyeX>347.5) && (eyeX<432.5)) {
    eyeX = mouseX;
  }
  else if (mouseX<x) {
    eyeX = x - cX;
  }
  else {
    eyeX = x + cX;
  }
  if ((eyeY>242.5) && (eyeY<307.5)) {
    eyeY = mouseY;
  }
  else if (mouseY<275) {
    eyeY = 275-cY;
  }
  else {
    eyeY = 275 + cY;
  }

  
  //within certain radius
  fill(250);
  ellipse(eyeX, eyeY, 50, 50);
  fill(0);
  ellipse(eyeX, eyeY, 20, 20);
  
}
