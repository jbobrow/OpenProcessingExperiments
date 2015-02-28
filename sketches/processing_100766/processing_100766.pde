
class bullet{
  
  int x;
  int y;
  boolean good;
  
  bullet(int _x, int _y, boolean g){
    x = _x;
    y = _y;
    good = g;
  }
  
  int getx(){
    return x;
  }
  
  int gety(){
    return y;
  }
  
  bullet(){}
  
  boolean update(){
    
    if(good){y-=10;}
    else{y+=4;}
    
    if(collision()){return false;}
    
    if(y < 0 || y > height){return false;}
      
    fill(255);
    ellipse(x, y, 10, 10);
    return true;
  }
  
  boolean collision(){
      
    if(!good && x <= player.getx() + 30 && x >= player.getx() - 30 && y <= player.gety() + 30 && y >= player.gety() - 30){
      player.health -= 1;
      return true;
    }
    if(y <= 85 && good){
      for(Enemy etemp = enemies.first; etemp != null; etemp = etemp.getnext()){
        if(x/2 >= etemp.x/2 - 20 && x/2 <= etemp.x/2D + 20){
          etemp.kill();
          return true;
        }
      }
    }
    return false;
  }

}

