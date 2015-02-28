
/*Zach Taher
  Mandala Drawing
  September 15, 2010
*/

void setup(){
  size(600, 600);
  background(0);
  smooth();
  //draws large outer blue ellipse
  drawEllipse(width/2, height/2, 600, 600, color(31, 70, 147), color(0), 0.0);
  
  //draws yellow ellipse within the blue ellipse
  drawEllipse(width/2, height/2, 500, 500, color(250, 179, 35), color(165, 55, 35), 5);
  
  //draws red star with alternating length points
  drawPolystar(width/2, height/2, 8, 300, 190, 260, color(165, 55, 35), color(31, 70, 147), 5, PI/2);
  
  //draws the blue ellipse inside the polystar
  drawEllipse(width/2, height/2, 382, 382, color(31, 70, 147), color(250, 179, 35), 5);
  
  //draws the red square within the blue ellipse
  drawPolygon(width/2, height/2, 4, 188, color(165, 55, 35), color(250, 179, 35), 5, PI/2);
  
  //draws the orange polystar on top of the red square
  drawPolystar(width/2, height/2, 4, 185, 80, 185, color(201, 100, 41), color(250, 179, 35), 5, PI/4);
  
  //draws the light blue ellipse in the center
  drawEllipse(width/2, height/2, 235, 235, color(87, 164, 240), color(165, 55, 35), 4);
  
  //draws the 4 yellow ellipses located in the light blue ellipse
  drawEllipse(width/2, 225, 60, 60, color(250, 179, 35), color(165, 55, 35), 4);
  drawEllipse(width/2, 375, 60, 60, color(250, 179, 35), color(165, 55, 35), 4);
  drawEllipse(225, height/2, 60, 60, color(250, 179, 35), color(165, 55, 35), 4);
  drawEllipse(375, height/2, 60, 60, color(250, 179, 35), color(165, 55, 35), 4);
  
  //draws the blue rectangle that overlaps the yellow ellipses
  drawPolygon(width/2, height/2, 4, 75, color(31, 70, 147), color(165, 55, 35), 5, PI/2);
  
  //draws the red polystar inside the light blue ellipse and over the darker blue rectangle
  drawPolystar(width/2, height/2, 8, 115, 40, 0, color(165, 55, 35), color(165, 55, 35), 0, PI/4);
  
  //draws the 4 yellow elipses in the bigger points of the outer red polystar
  drawEllipse(width/2, height/2, 60, 60, color(0), color(0), 0);
  drawEllipse(width/2, 75, 60, 60, color(250, 179, 35), color(250, 179, 35), 0);
  drawEllipse(width/2, 525, 60, 60, color(250, 179, 35), color(250, 179, 35), 0);
  drawEllipse(75, height/2, 60, 60, color(250, 179, 35), color(250, 179, 35), 0);
  
  //draws the 4 blue ellipses in the corners of the red rectangle
  drawEllipse(525, height/2, 60, 60, color(250, 179, 35), color(250, 179, 35), 0);
  drawEllipse(width/2, 157, 50, 50, color(31, 70, 147), color(31, 70, 147), 0);
  drawEllipse(width/2, 443, 50, 50, color(31, 70, 147), color(31, 70, 147), 0);
  drawEllipse(157, height/2, 50, 50, color(31, 70, 147), color(31, 70, 147), 0);
  drawEllipse(443, height/2, 50, 50, color(31, 70, 147), color(31, 70, 147), 0);
}

/*creates a function that draws an ellipse
  with the given inputs of position, 
  size, and color*/
void drawEllipse(float xPos, float yPos, float sizeX, float sizeY, color fillCol, color strokeCol, float strokeWt){
  fill(fillCol);
  stroke(strokeCol);
  strokeWeight(strokeWt);
  ellipse (xPos, yPos, sizeX, sizeY);
}

/*creates a function that draws a polygon
  with the given inputs of position, number
  of sides, radius, and color*/
void drawPolygon(float x, float y, int sides, float r, color fillCol, color strokeCol, float strokeWt, float theta){
  float xPos = 0.0;
  float yPos = 0.0;
  
  fill(fillCol);
  stroke(strokeCol);
  strokeWeight(strokeWt);
  beginShape();
  /*creates a new vertex at each new point 
  and draws a shape by connecting vertexes*/
  for(int i = 0; i < sides; i++){
  xPos = x + cos(theta) * r;
  yPos = y + sin(theta) * r;
  vertex(xPos, yPos);
  theta += TWO_PI/sides;
  }
  endShape(CLOSE);
}

/*creates a function that draws a star 
  with the given inputs of postion, length 
  of 2 points, length of indentation, color, 
  and angle at which the star starts at*/
void drawPolystar(float x, float y, int points, float rOutside, float rInside, float rOutside2, color fillCol, color strokeCol, float strokeWt, float theta){
  float xPos = 0.0;
  float yPos = 0.0;
  float verticies = points * 2;
  
  fill(fillCol);
  stroke(strokeCol);
  strokeWeight(strokeWt);
  beginShape();
  for(int i = 0; i < points; i++){
  //creates verticy of first point
  xPos = x + cos(theta) * rOutside;
  yPos = y + sin(theta) * rOutside;
  vertex(xPos, yPos);
  theta += TWO_PI/verticies;
  //creates verticy of indented point
  xPos = x + cos(theta) * rInside;
  yPos = y + sin(theta) * rInside;
  vertex(xPos, yPos);
  theta += TWO_PI/verticies;
  //creates verticy of second point
  xPos = x + cos(theta) * rOutside2;
  yPos = y + sin(theta) * rOutside2;
  vertex(xPos, yPos);
  theta += TWO_PI/verticies;
  //creates veritcy of indented point
  xPos = x + cos(theta) * rInside;
  yPos = y + sin(theta) * rInside;
  vertex(xPos, yPos);
  theta += TWO_PI/verticies;
  }
  endShape();
}

