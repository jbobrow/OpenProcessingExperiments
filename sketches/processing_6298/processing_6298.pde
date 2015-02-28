
class blob
{
  float[] x; //x positions of blob vertices
  float[] y; //y positions of blob vertices
  float[] xo; // original x positions
  float[] yo; //original y positions
  float[] xspeed; //speeds of blob vertices
  float[] yspeed;

  float xpos, ypos;  // centre position of blob

  float speedfactor; //higher values give lower speed
  float dampfactor;// 1 = no damping...lower values = more damping
  float springfactor;//higher values = stiffer spring
  
  blob(float xpos, float ypos, float[] xo, float[] yo, float speedfactor, float dampfactor, float springfactor)
  {
    x = new float[5];
    y= new float[5];
    xspeed=new float[5];
    yspeed= new float[5];
    this.xo=xo;
    this.yo=yo;
    this.xpos=xpos;
    this.ypos=ypos;
    this.speedfactor=speedfactor;
    this.dampfactor=dampfactor;
    this.springfactor=springfactor;
    for(int i=0; i<5; i++)
    {
      xspeed[i]=0;
      yspeed[i]=0;
      x[i]=xo[i];
      y[i]=yo[i];
    }
  }
  
  void render()
  {
    fill(0); 
    beginShape();
  
    for(int i=0; i<5; i++)
    {
      curveVertex(xpos+x[i], ypos+y[i]);
    }
     for(int i=0; i<3; i++)
    {
      curveVertex(xpos+x[i], ypos+y[i]);
    }
  
    endShape(CLOSE);  
  }
  
  void flex()
  {
    for(int i=0; i<5; i++)
    {
      int leftcols = (int)random(0, 11);
      int rightcols=(int)random(0, 11);
      int topcols= (int)random(0, 11);
      int botcols= (int)random(0, 11);
  
      xspeed[i]+= (leftcols-rightcols)/speedfactor;
      yspeed[i]+= (topcols-botcols)/speedfactor;
    }
    
    for(int i=0; i<5; i++)
    {
      x[i]+=xspeed[i];
      y[i]+=yspeed[i];
    }
  
    for(int i=0; i<5; i++)
    {
      xspeed[i]*=dampfactor;
      yspeed[i]*=dampfactor;
      xspeed[i]+= -1 * (x[i]-xo[i]) *springfactor;
      yspeed[i]+= -1 * (y[i]-yo[i]) *springfactor;
    }
  }
    
}

