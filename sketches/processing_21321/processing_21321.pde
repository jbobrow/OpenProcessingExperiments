
    class Ant{
      int asize;
      float x,y;
      float tx,ty;
      float speed, anoise;
      float dx,dy;
      boolean eating;
      int bite_size=2;
      color acolor;
    
     Ant(float x_, float y_, int size_, float speed_, float noise_){
        this.x = x_ ;
        this.y = y_ ;
        this.asize = size_;
        this.speed = speed_;
        this.anoise = noise_;
        this.eating = false;
      }
      
    
      void setTarget(float x_, float y_){
        this.tx = x_ ;
        this.ty = y_ ;
      }
      
      void draw(){
        fill(acolor);
        rectMode(CENTER);
      rect(x, y, asize,asize);
      }
      
      
      void trigEval(){
        float dist = dist(x,y,tx,ty);
        dx =(tx - x)/dist*speed; //step*cos(alpha);
        dy =(ty - y)/dist*speed;//step*sin(alpha);
      }
      
      
      void moveToTarget(){
           if( dist(x,y,tx,ty)>anoise){//5anoise){ 
            x = x + dx + random(-anoise,anoise);
            y = y + dy + random(-anoise,anoise);
           }
           else{
             x = tx + random(-1,1);
              y = ty + random(-1,1);
           }
      }
      
      
       void eatCake(int xrange, int yrange, int range){
          float dx = random(-xrange , xrange) + random(-range,range);
          float dy = random(-yrange , yrange) + random(-range,range);
          x = tx + dx;
          y = ty + dy;
          
          if (abs(dx)< xrange && abs(dy)<yrange){
               int x = int(dx + xrange);
               int y = int(dy + yrange);
               PImage img;
               img = LOGOO.get( x, y, 3, 3);
               CAKE.beginDraw();
               CAKE.set(x, y, img);
               CAKE.endDraw();
          }
        }
      
    
    }

