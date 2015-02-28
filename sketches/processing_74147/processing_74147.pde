
//Gloriana Gonzalez
//HW 8
//October 2012

color col1;

void setup()
{
  size(400,400);
  col1= color (0); 
 
}

void draw ()
{
  int x = 0;
  float w= random(50, 200);  
  
  while(x < width)
    {
    
    stroke(col1);
    line (x, height-frameCount, width-frameCount, (height-x)); //Bottom Right, Switch to Top Left Corner 
    line (0, x+frameCount, x, width);  //Bottom Left
    line (x, frameCount, height, x); //Top Right
    
     x += 30;
    
    if (frameCount==400)
    {
      noLoop();
    }
    
    fill(255, 40);
    rect (0, 0, width, height);



 }
}

void  mouseClicked ()
    {
         col1= color (random(255), random(255), random(255));  
    }



  void keyPressed()
{
 if (keyCode== 'S');
  {
    strokeWeight(random(1, 8 ));
  }
  
}





