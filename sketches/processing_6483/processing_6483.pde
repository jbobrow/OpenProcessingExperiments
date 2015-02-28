
class Particle {
  float x;
  float y;
  float z;   
  float xspeed;
  float yspeed;
  float ashade;

  
  float rred;
  float ggreen; 
  float bblue;
  
  //constructor
  Particle (float posX, float posY, float posZ, float colorR, float colorG, float colorB, float posXspeed, float posYspeed)  {
    x = posX;
    y = posY;
    z = posZ;

    xspeed = posXspeed;
    yspeed = posYspeed;
    
    rred = colorR;
    ggreen = colorG; 
    bblue = colorB;
    
    ashade = 255;
  }
  
  //move
  void run()  {
   x = x + xspeed;
   y = y + yspeed;
  
  
   
  }
    
    // fall down
    void gravity()  {
      yspeed += .08;  //speed of bubbles falling on Y axis
    }
    
  
    // ready for deletion
    boolean finished() {
      ashade -=4;
      if (ashade < 0) return true;
      else return false;
    }
    
   

   
 
    //show
    void display()  {
      noStroke ();
      fill (rred, ggreen, bblue, ashade);
  //    ellipse (x,y, z+life/100,z+life/500);
  ellipse(x,y,z,z);
 // rect(x,y,z*ashade/100,z); 
 // translate(x,y,z);
  //sphere(29);
//bubbles = (x,y,z,z); 
     
    }
  }
   
    
  
  

