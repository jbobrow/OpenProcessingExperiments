
class enemy {
  PImage img;
  PImage boom;
  boolean alive;
  boolean remove;
  float x;
  float y;
  float xspeed;
  //create a simple timer
  int ct, st, tt;
  //constructor
  enemy() {
  }

  void init(float _x, float _y) {
    img=loadImage("enemy_1.png");
    boom=loadImage("explode.png");
    xspeed=-3;
    x=_x;
    y=_y;
    
    ct=0; //current time
    st=0; //starting time
    tt=1000; //time different 1000 = 1 sec
    
    alive=true;
    remove=false;
  }

  void update() {
    if(alive){
    x+=xspeed;
    //test where the center (x,y) is
    //ellipse(x,y,30,30);
    image(img, x-img.width/2, y-img.height/2);
    //test each bullet see if hit
    if (bullets.size()>0) {
      for (int i=0; i<bullets.size();i++) {  
        PVector bullet=(PVector)(bullets.get(i));
        if(dist(bullet.x,bullet.y, x, y)<22){
         alive=false;
         bullets.remove(i);
         st=millis();
        }
      }
    }
    }else{
    //if this one is dead, use the explosion image
    ct=millis();
    if(ct-st<tt){
      //println((ct-st)*1.0/tt);
      tint(255,(int)((1-(ct-st)*1.0/tt)*255));
      image(boom, x-boom.width/2, y-boom.height/2);
      tint(255,255);
    }else{
      remove=true;
    }
    }
  }
}


