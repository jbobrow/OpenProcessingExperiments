

public class Avoider extends BoundedBox{
  int currentBox;
  Box target;
  
  public Avoider(int startX, int startY, int startS,int speed){
    super(startX,startY,startS);
    speedLimit = speed;
    type = 6;
  }
  
  public void act(ArrayList bots){

    //Scan for closest box.
    int distance = 1000;
    println(distance);
    for (int i = bots.size()-1; i>=0; i--){
      Box current = (Box) bots.get(i);
      //println(current.getID() + ":" +current.getDistance(x,y));
      if (current.getDistance(x,y) < distance&&current.getID()!=id){
        distance = current.getDistance(x,y);
        currentBox = i;
        target = current;
        
      }
    }
    //println("Distance!" + distance);
    //println(current.getDistance(x,y));
    //println(current.getID());
    fill(255,255,255,10);
    if(bots.size()>1)
      rect(target.getX()-2,target.getY()-2,target.getS()+4,target.getS()+4);
    
    if(distance <100 && bots.size()>1){
    
    int newX = target.getX();
    int newY = target.getY();
    
    if (newX > x)
      vX-=2;//(int)(distance)/5;
    if (newX < x)
      vX+=2;//(int)(distance)/5;
    if (newY > y)
      vY-=2;//(int)(distance)/5;
    if (newY < y)
      vY+=2;//(int)(distance)/5;
    println(vX);
    println(vY);
    }
    else{
      println("not avoiding!");
      double newVX = (random(10)-5)/10;
      double newVY = (random(10)-5)/10;
      vX = vX + newVX;
      vY = vY + newVY;
    }
    
    avoidWalls();
    
    limitSpeed();
        
    //calculate displacement
    x = (int) (x + vX);
    y = (int) (y + vY);
    
    show();
  }
  
  public void avoidWalls(){
    if(x<topX)
      vX+=(100-(topX-x));
    if(x>bottomX)
      vX-=(100-(width-x));
    if(y<topY)
      vY+=(100-(topY-y));
    if(y>bottomY)
      vY-=(100-(height-y));
      println("vX: "+vX);
      println("vY: "+vY);
    /*
    if (x < 100 || x>(width-100)){
      if(vY > 1)
        vY+=(int)(abs((float)vX));
      else
        vY-=(int)(abs((float)vX));
      vX = vX/2;
    }
    else if (y < 100 || y>(height-100)){
      if(vX > 1)
        vX+=(int)(abs((float)vY));
      else
        vX-=(int)(abs((float)vY));
      vY = vY/2;
    }
    */
    println(id + "Avoiding Wall!");
  }
}
      
        

