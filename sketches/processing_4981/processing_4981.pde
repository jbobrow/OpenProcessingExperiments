
// Class for brownian particles
class brownParticles
{
  int num = 1000;
  int range = 6;
  float[] ax = new float[num];
  float[] ay = new float[num]; 
  color C;
  
  brownParticles(color _C)
  {
    C=_C;
  }
  
  void create()
  {
    for(int i = 0; i < num; i++) 
    {
      ax[i] = width/2;
      ay[i] = height/2;
    }
  }
  
    void drawParticles()
  {
    // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) 
    {
      ax[i-1] = ax[i];
      ay[i-1] = ay[i];
    }

  // Put a new value at the end of the array
    ax[num-1] += random(-range, range);
    ay[num-1] += random(-range, range);    

  // Constrain all points to the screen
    ax[num-1] = constrain(ax[num-1], 0, width);
    ay[num-1] = constrain(ay[num-1], 0, height);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i+=5) {    
    float val = float(i)/num * 204.0 + 51;    
    //stroke(R,G,B,val);
    stroke(C,val);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);    

    //ellipse(ax[i], ay[i],5,5);    
  }
  }
  

}// end of class

