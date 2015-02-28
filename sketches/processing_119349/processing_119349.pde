

PImage photo1, photo2;
PFont chiller, century, lucida, matura, palatino, chaparral;
float[] xList = {149, 152, 147, 151, 150, 147, 155, 156, 148, 147, 150}; 
float[] yList = {98, 110, 97, 102, 104, 100, 97, 102, 104, 100, 110}; 
float[] dXList = {0.98, 1.02, -0.96, -0.99, 1.0, 0.96, 1.04, -1.01, 0.98, 1.0, 1.0}; 
float[] dYList = {-0.97, 1.03, -0.97, 0.95, -1.01, -0.97, 0.98, -1.04, -0.98, -1.0, 1.0};
float[] speedList = {8, 7, 10, 6, 12, 11, 9, 11, 7, 6, 7, 6};
float timer;
boolean top;

void setup()
{
  size(400, 400);
  photo1 = requestImage("photo1.jpg");
  photo2 = requestImage("photo2.jpg");
  chiller = loadFont("Chiller", 20);
  century = loadFont("Century", 20);
  lucida = loadFont("Lucida Calligraphy", 20);
  matura = loadFont("Matura MT Script Capitals", 20);
  palatino = loadFont("Palatino Linotype", 20);
  chaparral = loadFont("Chaparral Pro", 200);
  
  speed = 4;
  timer = 30.0;
  top = true;
}

void draw()
{
  println("" + mouseX + " , " + mouseY);
  timer++;
  fill(255);
  rect(0, 0, width, height);
  
  if(timer <= 500)
  {
    imageMode(CENTER);
    pushMatrix();
    translate(width/2, height/2);
    scale(timer/500.0);
    image(photo2, 0, 0, 300, 400);
    popMatrix();
    
    fill(255, 255, 255, 55);
    
    textFont(chaparral);
    if(timer % 20 == 0)
    {
      top = !top;
    }
    
    if(top)
    {
      text("calm", 10, 150);
    }
    
    else
    {
      text("calm", 10, 350);
    }
  }
  
  else
  {
    pushMatrix();
    translate(width/2, height/2);
    image(photo1, 0, 0, 300, 400);
    popMatrix();
    fill(0);
    textFont(chiller);
    text("programming", xList[0], yList[0]);
    
    textFont(century);
    text("Germany", xList[1], yList[1]);
    
    textFont(lucida);
    text("sports", xList[2], yList[2]);
    
    textFont(matura);
    text("friends", xList[3], yList[3]);
    
    textFont(palatino);
    text("Chicago", xList[4], yList[4]);
    
    textFont(chiller);
    text("games", xList[5], yList[5]);
    
    textFont(century);
    text("fitness", xList[6], yList[6]);
    
    textFont(lucida);
    text("Cincinati", xList[7], yList[7]);
    
    textFont(matura);
    text("music", xList[8], yList[8]);
    
    textFont(palatino);
    text("busy", xList[9], yList[9]);
    
    textFont(chiller);
    text("hectic", xList[10], yList[10]);
    
    for(int c = 0; c < 11; c++)
    {
      if(xList[c] <= 0)
      {
        xList[c] = 0;
        dXList[c] = -dXList[c];
      }
      
      if(xList[c] >= width)
      {
        xList[c] = width;
        dXList[c] = -dXList[c];
      }
      
      if(yList[c] <= 0)
      {
        yList[c] = 0;
        dYList[c] = -dYList[c];
      }
      
      if(yList[c] >= height)
      {
        yList[c] = height;
        dYList[c] = -dYList[c];
      }
      
      xList[c] += speedList[c] * dXList[c];
      yList[c] += speedList[c] * dYList[c];
    }
  
  }
  
  
}


