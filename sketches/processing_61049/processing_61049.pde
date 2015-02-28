
interface Ammo{
  public float getDamage();
  
  public void checkCollision();
  
  public boolean hitTarget();
  
  public boolean isAlive();
  
  public void modifyLaunchVector( PVector launchVector );
  public void update();
  public void display();  
  public PVector getLocation();
  public PVector getVelocity();
  
}

