
class Bullet{
      public float posX,posY,velocity;
      public int boundH,boundW,objH,objW;
      boolean alive = true;
       public Bullet(float iniX,float iniY,float vel,int w,int h,int ow,int oh){
          posX =iniX;  
          posY =iniY;
          velocity = vel;
          boundH = h;
          boundW = w;
          objH = oh;
          objW = ow;
      }
            public void PosMove(){
         if(posY < 0){
             alive = false;
         }
         if(alive){
           posY -= velocity;
           BulletDisplay();
         }
      }
       public void BulletDisplay(){
           image(pBullet,posX,posY,objW,objH);
       }
      public void setAlive(boolean a){
        if(a){
          alive = true;
        }
        else{
          alive = false;
        }
      }
      public void setVel(float v){
         velocity = v;
      }
      public boolean getAlive(){
        return alive;
      }
      
}

