
class Cloud {

  Rain[] drops = new Rain[50];

  float x;
  float y;
  float d;
  
  float sideD;
  float sideRX;
  float sideLX;
  float sideY;
  float bottom;


  Cloud(float cx, float cy, float cd)
  {
    x = cx; 
    y = cy;
    d = cd;
    
    sideD = 2*(d/3);
    sideRX = cx-sideD;
    sideLX = cx+sideD;
    sideY = cy+cd/6;
    bottom = cy+cd/2;
    

    for (int i = 0; i < drops.length; i++)
    {
      drops[i] = new Rain(random(sideRX,sideLX),
      random(bottom,height),bottom);
    }

  }

  void display()
  {
    showRain();
    
    smooth();
    stroke(0);
    strokeWeight(1);

    float moveDown = second() * 3;
     
    ellipse(x,y+moveDown,d,d);
    ellipse(sideRX,sideY+moveDown,sideD,sideD);
    ellipse(sideLX,sideY+moveDown,sideD,sideD);
    
    noStroke();
    rectMode(CORNERS);
    rect(sideRX,y+moveDown,sideLX,bottom+moveDown);
    
    stroke(0);
    line(sideRX,bottom+moveDown,sideLX,bottom+moveDown);

  }


  void showRain()
  {
    if (minute() < 30)
    {
      fill(255);
    }
    else
    {
      fill(195);

      for (int i = 0; i < drops.length; i++)
      {
        drops[i].display();
      }
    }

  }
  
}

