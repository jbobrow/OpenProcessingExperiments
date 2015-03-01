
PGraphics bg; 

color treeColor = color(41, 25, 3);
color bgColor = color(255, 178, 187);
color lightColor = color(255, 213, 147);
color darkColor = color(70, 83, 117);


/*------------------------*/


void setup()
{
  size(600, 600); 
  bg = createGraphics(width, height);
  
  generateSky(bg);
  noLoop();
}


/*------------------------*/


void draw()
{ 
  tint(255);
  image(bg, 0, 0);
  
  //draw tree
  for (int i = 0; i < 5; i++)
  {
    tint(255, 30);
    image(bg, 0, 0);
    tree(width/2, height, height/5, -HALF_PI);
  }
  
  //draw the ground
  fill(treeColor);
  noStroke();
  rect(0, height - 20, width, 20);
}


/*------------------------*/


void mouseReleased()
{
  noiseSeed(random(0xFFFFFF));  //change noiseSeed
  generateSky(bg);  //generate new clouds
  
  redraw();
}


/*------------------------*/


void keyPressed()  //save the framme when we press the letter s
{
  if (key == 's' || key =='S')
  {
    saveFrame("landscape-###.png");
  }
}


/*------------------------*/


void tree(float beginX, float beginY, float bLength, float angle)
{
  //find the end of the branch
  float endX = beginX + bLength*cos(angle);
  float endY = beginY + bLength*sin(angle);
  
  //draw the branch
  strokeWeight(map(bLength, height/4, 3, 20, 1));
  stroke(treeColor);
  line(beginX, beginY, endX, endY);
  
  //generate 2 new branchs
  if (bLength  > 3)
  {
    if (random(1) > 0.1) tree(endX, endY, bLength*random(0.6, 0.8), angle - random(PI/15, PI/5));
    if (random(1) > 0.1) tree(endX, endY, bLength*random(0.6, 0.8), angle + random(PI/15, PI/5));
  }
}


/*------------------------*/


void generateSky(PGraphics pg)
{
  pg.beginDraw();
  
  pg.background(bgColor);
  
  for (int y = 0; y < height; y += 2)
  {
    for (int x = 0; x < width; x += 2)
    {
      //draw clouds
      float n = noise(x/200., y/50.);     
      pg.noStroke();
      pg.fill(darkColor, n*map(y, 0, 2*height/3., 255, 0)); 
      pg.ellipse(x, y, 3, 3);
    }
    
    //draw the light on the bottom
    strokeWeight(3);
    pg.stroke(lightColor, map(y, 2*height/3, height, 0, 255));
    pg.line(0, y, width, y);
  }
  
  pg.endDraw();
}


