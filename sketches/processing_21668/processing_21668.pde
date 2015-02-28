
public class AVerletModel
{
  private float _deltaTime = 1 / Main.FPS;
  private float _oldDeltaTime = 1 / Main.FPS;
  private float _deltaTimeRatio = 1;
  
  protected float mass = 10;
		
  public float xPos = 0;
  public float yPos = 0;
  public float oldX = 0;
  public float oldY = 0;
		      
  private float _tempX = 0;
  private float _tempY = 0;
  private float _accelX = 0;
  private float _accelY = 0;
  private float _impulseX = 0; 
  private float _impulseY = 0;
				
  AVerletModel()
  {
  }
		
  public void update()
  {
    if (Main.timeCorrected)
    {
      _deltaTime = Main.deltaTime;
      _deltaTimeRatio = Main.deltaTimeRatio;
    }
			
    _tempX = xPos;
    _tempY = yPos;
				
    xPos += getVx() * _deltaTimeRatio + _impulseX * _deltaTime + _accelX * _deltaTime * _deltaTime;
    yPos += getVy() * _deltaTimeRatio + _impulseY *  _deltaTime + _accelY * _deltaTime * _deltaTime;
    
    oldX = _tempX;
    oldY = _tempY;
    
    _impulseX = 0;
    _impulseY = 0;
    _accelX = 0;
    _accelY = 0;
  }
  
  //-----------------------------------------------------------use the force
  
  public void addImpulse(float impX, float impY)
  {
    _impulseX += impX;
    _impulseY += impY;
  }
  
  public void addAcceleration(float aX, float aY)
  {
    _accelX += aX;
    _accelY += aY;
  }
  
  public void addForce(float fX, float fY)
  {
    addAcceleration(fX/mass, fY/mass);
  }

//--------------------------------------------------------------always use these to set position (does not affect velocity)

  public void setX(float newX)
  {
    oldX = newX - getVx();
    xPos = newX;
  }
  
  public void setY(float newY)
  {
    oldY = newY - getVy();
    yPos = newY;
  }
		
//---------------------------------------------------------------set and get velocity in pixels/second

  public void setVelocity_X(float newVelX)
  {
    if (Main.timeCorrected){
      _deltaTime = Main.deltaTime;
    }
    
    setVx(newVelX * _deltaTime); 
  }
  
  public float getVelocity_X()
  {
    if (Main.timeCorrected) {
      _deltaTime = Main.deltaTime;
    }
    
    return getVx() / _deltaTime;
  }
  
    public void setVelocity_Y(float newVelY)
  {
    if (Main.timeCorrected){
      _deltaTime = Main.deltaTime;
    }
    
    setVy(newVelY * _deltaTime); 
  }
  
  public float getVelocity_Y()
  {
    if (Main.timeCorrected) {
      _deltaTime = Main.deltaTime;
    }
    
    return getVy() / _deltaTime;
  }
		
//----------------------------------------------------------set and get velocity in pixels/frame

  public float getVx(){
    return xPos - oldX;
  }
  public void setVx(float newVx){
    oldX = xPos - newVx;
  }
  public float getVy(){
    return yPos - oldY;
  }
  public void setVy(float newVy){
    oldY = yPos - newVy;
  }
}

