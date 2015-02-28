

public class Box{
  int x,y,z;           //Current location of the box.
  int iX,iY,iZ;        //Initial location, for once the timer resets
  int vZ, vX, vY;      //Velocity variables
  int counter;         //Timer for action
  boolean moving;      //True if moving
  int l;               //Luminescence - for highlighting box
  float rotation;      //Current rotation of box, both x and y
  float r,g,b,a;       //Color values
  int boxSize;         //Size of the box
  
  //Constants
  int lumConst = 10;        //How much to increase luminosity by per step
  int resetCounter = 500;   //How long each box can act for
  
  public Box(int getX, int getY, int getZ, int getSize){
    x = iX = getX;
    y = iY = getY;
    z = iZ = getZ;
    r = random(20,255);
    g = random(20,255);
    b = random(20,255);
    a = 255;
    vX = 0;
    vY = 0;
    vZ = 0;
    moving = false;
    l = 0;
    counter = resetCounter;
            
    boxSize = getSize;
  }
  
  public void show(){
    
    //Light box up if the mouse is over it
    if(mouseOver()&& (l+lumConst < 255))
      l+=lumConst;
    else if (l > 0)
      l-=lumConst;
      
    //Draw the box
    pushMatrix();
      translate(x,y,z);
      rotateX(rotation);
      rotateY(rotation);
      fill(r+l,g+l,b+l,a);
      box(boxSize);
    popMatrix();
  }
  
  public void act(){
    //Initialize Movement
    if (moving){
      vX+=random(-5,5);
      vY+=random(-5,5);
      vZ+=random(-5,5);
      rotation+=.1;
      counter--;
    }
    else{
      vX = 0;
      vY = 0;
      vZ = 0;
      if(a < 255)
        a+=5;
      if(rotation > 10)
        rotation = 10;
      if(rotation > 0)
        rotation-=.1;
    }
   
    //Apply Movement
    x+=vX;
    y+=vY;
    z+=vZ;
    
    //Reset position if timer ran out
    if(counter <= 0){
      x = iX;
      y = iY;
      z = iZ;
      counter = resetCounter;
      moving = false;
      a = 0;
    }
  
  }
      
    
  
  public boolean mouseOver(){
    if((mouseX < (x + boxSize/2)) && 
       (mouseX > (x - boxSize/2)) &&
       (mouseY < (y + boxSize/2)) &&
       (mouseY > (y - boxSize/2)))
       return true;
    return false;
  }
  
  public boolean isMoving(){
    return moving;
  }
  
  public void setMoving(){
    moving = !moving;
  }
}

