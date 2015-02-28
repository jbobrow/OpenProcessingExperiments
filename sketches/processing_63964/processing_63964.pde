
class Mold
{
  float px, py;
  float growth = 1;
  float moldsize;
  float transparency = 1;
  int type;


  //Constructor
  Mold (int t)
  {
    px = random (100, width-100);
    py = random (100, height -100);
    type = t;
  }

  void process()
  {
    growth+= 0.003;

    moldsize = 20*growth;

    transparency+= 0.6;
    
    if (type == 1)
    {
      pushMatrix();
      translate (px, py);
      fill(66, 95, 54, transparency);
      ellipse (0, 0, moldsize, moldsize); 

      fill(255);
      ellipse (-5*growth, 0, 5*growth, 5*growth);
      ellipse (5*growth, 0, 5*growth, 5*growth);

      fill(0);
      ellipse (-5*growth, 0, 3*growth, 3*growth);
      ellipse (5*growth, 0, 3*growth, 3*growth);


      popMatrix();
    }
    if (type == 2)
    {
      pushMatrix();
      translate (px, py);
      fill(51, 25, 113, transparency);
      ellipse (0, 0, moldsize, moldsize); 

      fill(255);
      ellipse (-5*growth, 0, 5*growth, 5*growth);
      ellipse (5*growth, 0, 5*growth, 5*growth);

      fill(0);
      ellipse (-5*growth, 0, 3*growth, 3*growth);
      ellipse (5*growth, 0, 3*growth, 3*growth);


      popMatrix();
    }
  }
  void clear()
  {
    
  }
}

