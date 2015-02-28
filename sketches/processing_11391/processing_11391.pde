
public class Cannon
{
  Enemy enemy;
  int x;
  int y;
  int w;
  int h;
  float time_to_attack;
  int dir;
  int vel=5;
  boolean firing;
  int Min,Max;

  
  
  Cannon(int X, int Y, int W, int H,int direction,int min, int max) 
  {
    enemy = new Enemy(W, H,direction);
    enemy.setPosition(X, Y);
    time_to_attack=random(80,100);
    x=X;
    y=Y;
    w=W;
    h=H;
    dir=direction;
    firing=false;
    Min=min;
    Max=max;
  
  }
  

  
  
  void refresh()
  { time_to_attack-=1;
    enemy.drawEnemy();
    // Direction: 1 - UP , 2 - DOWN , 3 - LEFT , 4 - RIGHT
    if(dir==1) { if(time_to_attack<200) firing=false;
                   if(!firing) 
                  {
                    x+=vel;
                    if((x>width-wallGap)||(x<0)) vel*=-1;
                    enemy.setPosition(x,y);
                  }
                  
                 if((time_to_attack<0)&& x>=playerX && x<=playerX+playerWidth ) 
                 {  firing=true;
                    color red=#ff0000;
                    lasers[j]= new Laser(x+(w/2),y+h,-1,red,false);
                    j++;
                    time_to_attack=random(Min,Max);
                   
                 } 
                  
                }
      
      if(dir==2) { if(time_to_attack<200) firing=false;
                   if(!firing) 
                  {
                    x+=vel;
                    if((x>width-wallGap)||(x<0)) vel*=-1;
                    enemy.setPosition(x,y);
                  }
                  
                 if((time_to_attack<0)&& x>=playerX && x<=playerX+playerWidth ) 
                 {  firing=true;
                    color red=#ff0000;
                    lasers[j]= new Laser(x+(w/2),y+h,1,red,false);
                    j++;
                    time_to_attack=random(Min,Max);
                   
                 } 
                  
                }
                
                
                
      if(dir==3) { if(time_to_attack<200) firing=false;
                   if(!firing) 
                  {
                    y+=vel;
                    if((y>height-wallGap)||(y<0)) vel*=-1;
                    enemy.setPosition(x,y);
                  }
                  
                 if((time_to_attack<0)&& y>=playerY && y<=playerY+playerHeight ) 
                 {  firing=true;
                    color red=#ff0000;
                    lasers[j]= new Laser(x+w,y+(h/2),1,red,true);
                    j++;
                    time_to_attack=random(Min,Max);
                   
                 } 
                  
                }
                
                
                
       if(dir==4) { if(time_to_attack<200) firing=false;
                   if(!firing) 
                  {
                    y+=vel;
                    if((y>height-wallGap)||(y<0)) vel*=-1;
                    enemy.setPosition(x,y);
                  }
                  
                 if((time_to_attack<0)&& y>=playerY && y<=playerY+playerHeight ) 
                 {  firing=true;
                    color red=#ff0000;
                    lasers[j]= new Laser(x+w,y+(h/2),-1,red,true);
                    j++;
                    time_to_attack=random(Min,Max);
                   
                 } 
                  
                }
    
    
    
  }
  
  

}







