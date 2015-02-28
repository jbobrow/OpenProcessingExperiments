

class Follower
{
  //fields

  Follower fL; //followee
  float pX,pY; //position
  float vX,vY; //velocity
  float fX,fY; //sumforce
  float rest; //desired distance from followee


  //constructor

  Follower(float pX, float pY, float rest)
  {
    this.pX = pX;
    this.pY = pY;
    this.rest = rest;
  }


  //methods

  void GetForce(float pAtt, float pFol)
  {
    if(this.fL != null)
    {
      this.Attract(pAtt);
      this.Follow(pFol);
    }
  }


  private void Attract(float pwr)
  {
    float nX = this.fL.pX - this.pX;
    float nY = this.fL.pY - this.pY;

    float d = sqrt(nX * nX + nY * nY);

    nX /= d;
    nY /= d;

    d = (d-this.rest) * pwr;

    this.fX += nX * d;
    this.fY += nY * d;
  }


  private void Follow(float pwr)
  {
    if(this.fL.fL != null)
    {
      this.fX += ((this.fL.pX - this.pX) - (this.fL.fL.pX - this.fL.pX)) * pwr;
      this.fY +=  ((this.fL.pY - this.pY) - (this.fL.fL.pY - this.fL.pY)) * pwr; 
    } 
  }


  void Update(float timeStep, float drag)
  {
    //apply drag
    this.fX -= this.vX * drag;
    this.fY -= this.vY * drag;

    //update velocity
    this.vX += this.fX * timeStep;
    this.vY += this.fY * timeStep;

    //update position
    this.pX += this.vX * timeStep;
    this.pY += this.vY * timeStep;

    //reset force
    this.fX = 0;
    this.fY = 0;
  }


  void DrawTopo()
  {
    stroke(0,5);
    strokeWeight(1); 

    if(this.fL != null)
    {
      line(this.pX, this.pY, this.fL.pX, this.fL.pY);
    }
  }

  void DrawPos()
  {
    fill(0);
    noStroke();
    ellipse(this.pX, this.pY, 4,4);
  }
}










