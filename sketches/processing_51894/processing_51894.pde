
//STUFF NO1 CARES ABOUT-------------------------------
float movey, movex, movey2, movex2, movey3, movex3;
float count,b,c,d,e,f,g;
float baseX1, baseY1, baseX2, baseY2;
float baseLength;
float[] xCoords, yCoords;
float ellipseX, ellipseY, ellipseRadius = 6;
float directionX, directionY;
float ellipseSpeed = 3.5;
float velocityX, velocityY; 
int gx = 10;
int gy = 25;
float leftColor = 0.0;
float rightColor = 0.0;
//-------------------------------------------------
void  setup()
{
  
  e= random(600);
  f= random(600);
  g= random(3);
  movey= e-5;
  movex = f-5;
  movey2 = e/2;
  movex2 = e/2;
  movey3 = e;
  movex3 = f;
  count= random(100);
  b= random(255);
  c= random(255);
  d= random(255);
  size(600,600);
 
 
  baseX1 = 0;
  baseY1 = height-150;
  baseX2 = width;
  baseY2 = height;

  // start ellipse at middle top of screen
  ellipseX = width/2;
  
  // calculate initial random direction
  directionX = random(0.1, 0.99);
  directionY = random(0.1, 0.99);

  // normalize direction vector
  float directionVectLength = sqrt(directionX*directionX + directionY*directionY);
  directionX /= directionVectLength;
  directionY /= directionVectLength;
} 




//DRAW---------------------------------------------------------------------------------------
void draw()
{
  
   if (count < 25)
  {
    
  background(b);
  fill(0);
  triangle(movex,movey,c,d,40,60);
  fill(0,255,0);
  ellipse(movex2, movey2, 100,100);
  fill(150,50,150);
  rect(movex3,movey3,50,50);
  
  fill(d,200,34);
  triangle(movey,movex,60,movex,d,c);
  fill(100,255,50);
  ellipse(movey2, movex2, 100,100);
  fill(150,50,150);
  rect(movey3,movex3,50,50);
  
  }
  
  
  else if (count >25 && count <50)
  {
   
  background(b,d,c);
  fill(d,200,34);
  triangle(movey,movex,60,movex,d,c);
  fill(100,255,50);
  ellipse(movey2, movex2, 100,100);
  fill(150,50,150);
  rect(movey3,movex3,50,50);
    
  fill(0,c,count);
  triangle(movey2,movex,b,count,c,d);
  fill(100,255,50);
  ellipse(count, movey3, 100,100);
  fill(150,50,150);
  rect(movey,movex3,50,50);
 
  }
  
   else if (count >50 && count <75)
  {
  
  background(count,b,c);
  fill(0,c,count);
  triangle(movey2,movex,b,count,c,d);
  fill(100,255,50);
  ellipse(count, movey3, 100,100);
  fill(150,50,150);
  rect(movey,movex3,50,50);
  
  fill(0);
  triangle(movex,movey,c,d,40,60);
  fill(0,255,0);
  ellipse(movex2, movey2, 100,100);
  fill(150,50,150);
  rect(movex3,movey3,50,50);
 
  }
  
  
   else if (count >75)
  {
   
  background(b,c,d);
  fill(count,200,34);
  triangle(movey3,movex3,60,d,d,count);
  fill(b,255,c);
  ellipse(movey, movex2, 100,b);
  fill(c,50,150);
  rect(movey2,movex,50,count);
  
  fill(d,200,34);
  triangle(movey,movex,60,movex,d,c);
  fill(100,255,50);
  ellipse(movey2, movex2, 100,100);
  fill(150,50,150);
  rect(movey3,movex3,50,50);
 
  }
  
  
      
  movey++;
  movex++;
  movey2--;
  movex2--;
  movey3++;
  movex3--;
  
  
  //INTERACTIVE SQUARE STUFF------------------------------------------------------
  
  update(mouseX); 
  fill(0.0, d + 0.4, f + 0.6); 
  rect(width/4-gx, height/2-gx, gx*2, gx*2); 
  fill(0.0, b + 0.2, g + 0.4); 
  rect(width/1.33-gy, height/2-gy, gy*2, gy*2);
  
  update (mouseY);
  fill(e, d + 0.4, f + 0.6); 
  rect(width/4-gx, height/2-gx, gx*2, gx*2); 
  fill(g, b + 0.2, e + 0.4); 
  rect(width/1.33-gy, height/2-gy, gy*2, gy*2);

  
  //FLOATING BALL STUFF--------------------------------  
  baseLength = dist(baseX1, baseY1, baseX2, baseY2);
  xCoords = new float[ceil(baseLength)];
  yCoords = new float[ceil(baseLength)];

  // fill base top coordinate array
  for (int i=0; i<xCoords.length; i++)
  {
    xCoords[i] = baseX1 + ((baseX2-baseX1)/baseLength)*i;
    yCoords[i] = baseY1 + ((baseY2-baseY1)/baseLength)*i;
  }

  // draw base
  fill(200);
  quad(baseX1, baseY1, baseX2, baseY2, baseX2, height, 0, height);

  // calculate base top normal
  float baseDeltaX = (baseX2-baseX1)/baseLength;
  float baseDeltaY = (baseY2-baseY1)/baseLength;
  float normalX = -baseDeltaY;
  float normalY = baseDeltaX;

  // draw ellipse
  noStroke();
  fill(255);
  ellipse(ellipseX, ellipseY, ellipseRadius*2, ellipseRadius*2);

  // calculate ellipse velocity
  velocityX = directionX * ellipseSpeed;
  velocityY = directionY * ellipseSpeed;

  // move elipse
  ellipseX += velocityX;
  ellipseY += velocityY;

  // normalized incidence vector
  float incidenceVectorX = -directionX;
  float incidenceVectorY = -directionY;

  // detect and handle collision
  for (int i=0; i<xCoords.length; i++)
  {
    // check distance between ellipse and base top coordinates
    if (dist(ellipseX, ellipseY, xCoords[i], yCoords[i]) < ellipseRadius)
    {

      // calculate dot product of incident vector and base top normal 
      float dot = incidenceVectorX*normalX + incidenceVectorY*normalY;

      // calculate reflection vector
      float reflectionVectorX = 2*normalX*dot - incidenceVectorX;
      float reflectionVectorY = 2*normalY*dot - incidenceVectorY;

      // assign reflection vector to direction vector
      directionX = reflectionVectorX;
      directionY = reflectionVectorY;

      // draw base top normal at collision point
      stroke(255, 128, 0);
      line(ellipseX, ellipseY, ellipseX-normalX*100, 
            ellipseY-normalY*100);
    }
  }

  // detect boundary collision
  // right
  if (ellipseX > width-ellipseRadius)
  {
    ellipseX = width-ellipseRadius;
    directionX *= -1;
  }
  // left 
  if (ellipseX < ellipseRadius)
  {
    ellipseX = ellipseRadius;
    directionX *= -1;
  }
  // top
  if (ellipseY < ellipseRadius)
  {
    ellipseY = ellipseRadius;
    directionY *= -1;
    // randomize base top
    baseY1 = random(height-100, height);
    baseY2 = random(height-100, height);
  }
  
  
  
}
  
  
// UPDATE FOR INTERACTIVE SQUARES--------------------------------------------------------  
void update(int x) {
  leftColor = -0.002 * x/2 + 0.06;
  rightColor =  0.002 * x/2 + 0.06;
	
  gx = x/2;
  gy = 100-x/2;

  if (gx < 10) {
    gx = 10;
  } else if (gx > 90) {
    gx = 90;
  }

  if (gy > 90) {
    gy = 90;
  } else if (gy < 10) {
    gy = 10;
  }
}

