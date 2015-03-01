
linedrawer l;

void setup() { 
  size(400, 400); 
  smooth(); 
  l = new linedrawer(0, 200, 100, 400);
} 

void draw() { 
  l.linez();
} 


class linedrawer {

  float xspeed;
  float linespeed;
  float endx = 0;
  float endy = 0;
  float _x;
  float _y;
  float _x2;
  float _y2;
  float tx2;
  float ty2;
  int ticks;


  linedrawer(float x, float y, float x2, float y2) {
    _x = x;
    _y = y;
    _x2 = x2;
    _y2 = y2;
    linez();
    ticks = 0;
  }

  void linez() {
    ticks++;

    float slope = (_y2-_y)/(_x2-_x);

    translate(_x, _y);

    float g = (_x2-_x)/100;
    float dif = (_x2-_x);
    if (dif < 0){
    dif = -dif;
    }
    System.out.println("g = " + g);
    float r = (_y2-_y)/dif;
    
    if (ticks >= dif){
    System.out.println("DONE");
    return;}
    
    
    linespeed = r;
    xspeed = 1;
    System.out.println("xspeed: " +  xspeed + " linespeed: " + linespeed);
    

    if(linespeed < 0){
      linespeed = -linespeed;
    }
    
     background(255); 
     line(0, 0, endx, endy); 

      if(_x > _x2){
      if(_y > _y2){
      System.out.println("1");
      endx += -xspeed;
      endy += -linespeed;
      }else{
      System.out.println("2");
      endx += -xspeed;
      endy += linespeed;
      }
      }else{
      if(_y > _y2){
      System.out.println("3");
      endx += xspeed;
      endy += -linespeed;
        
      }else{
      System.out.println("4");
      endx += xspeed;
      endy += linespeed;
      }
      }

    
  }
}



