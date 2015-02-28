
//**applegame//
 
PFont titleFont = createFont("Impact", 48);


//////////////////////////////////////////////////////////////////////////////
int sphereDiameter = 10;
  boolean shoot = false;
  
  int randx()
  {
    return int(random(600));
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx() };
  int[] sphereYCoords = { 0, 0, 0, 0, 0 };
  
 
 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PImage img;

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setup () {
  size (750 , 700);
  smooth ();

}


void draw () {
  background (3, 228, 255);
  fill (26, 220,10);
  
  ellipse (199, 500, 400, 400);
  ellipse (550, 500, 400, 400);
   
  fill (0, 255, 0); 
  rect (0, 500, 2000, 2000);
  img = loadImage("SUN.gif");
   image(img, 0, 0);
  fill(#A26D1E);
  rect(115, 250, 30, 200);
  rect(350, 250, 30, 200);
  rect(585, 250, 30, 200);
//--------------------------------------
  
  
  fill(#08761A);
  noStroke();
  ellipse(70, 250, 130, 130);
  ellipse(130, 250, 130, 130);
  ellipse(190, 250, 130, 130);
  ellipse(100, 200, 120, 120);
  ellipse(160, 200, 120, 120);
  ellipse(130, 150, 75, 50);
//--------------------------------------
  ellipse(300, 250, 130, 130);
  ellipse(360, 250, 130, 130);
  ellipse(420, 250, 130, 130);
  ellipse(330, 200, 120, 120);
  ellipse(390, 200, 120, 120);
  ellipse(360, 150, 75, 50);
//--------------------------------------
  ellipse(530, 250, 130, 130);
  ellipse(590, 250, 130, 130);
  ellipse(650, 250, 130, 130);
  ellipse(560, 200, 120, 120);
  ellipse(620, 200, 120, 120);
  ellipse(590, 150, 75, 50);
  triangle(mouseX-8, 580, mouseX+8, 580, mouseX, 565);
  fill(color(255,0,0));
  stroke(color(255,0,0));
  
    if(shoot==true)
    {
      sphereKiller(mouseX);
      shoot = false;
    }
  
    sphereDropper();
    gameEnder();  
  }
  
  void mousePressed()
  {
    shoot = true;
  }
  
  void sphereDropper()
  {  
    stroke(255);
    fill(255,0,0);
    for (int i=0; i<5; i++)
    {
      ellipse(sphereXCoords[i], sphereYCoords[i]++,
              sphereDiameter, sphereDiameter);
    }
  }
  
  void sphereKiller(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (sphereXCoords[i]-sphereDiameter/2)) && 
         (shotX <= (sphereXCoords[i]+sphereDiameter/2)))
      {
        hit = true;
        line(mouseX, 565, mouseX, sphereYCoords[i]);
        ellipse(sphereXCoords[i], sphereYCoords[i],
                sphereDiameter+25, sphereDiameter+25);
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 0;
      }    
    }
  
    if(hit == false)
    {
      line(mouseX, 565, mouseX, 0);
    }  
  
  }
  
  void gameEnder()
  {
    for (int i=0; i< 5; i++)
    {
      if(sphereYCoords[i]==600)
      {
        fill(color(255,0,0,0));
        loop();
      }
       
       {
         if(sphereYCoords[i]<=600) 
       
       fill(color(255,0,0,0));
       textFont(titleFont);
       textAlign(CENTER);
       text("Game Over", width/2, height/2);
      }
       
       
      
  
  }
    }





  



