
public class Bullet implements Runnable{
  PVector loc;
  int cnum;
  public Bullet(PVector initialLoc,int cannonNum){
    loc=initialLoc.get();
    cnum=cannonNum;
  }
  public void run(){
    if(cnum==1)loc.x+=10;
    if(cnum==2)loc.y+=10;
    if(cnum==3)loc.x+=10;
    if(cnum==4)loc.y+=10;
    if(cnum==1||cnum==2)ellipse(loc.x,loc.y,15,15);
    if(cnum==3||cnum==4)ellipse(width-loc.x,height-loc.y,15,15);
    if (dist(loc.x,loc.y,mouseX,mouseY)<25){
      titlescreen=false;
      playing=false;
      lostscreen=true;
    }
  }
}

