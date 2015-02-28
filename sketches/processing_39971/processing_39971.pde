
class Couple {
  int x,y;
  
  Couple(int x,int y) {
    setXY(x,y);
  }
  
  void setXY(int x,int y) {
    this.x=x;
    this.y=y;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
}

class Sprite {
  PImage Gimage;
  int x,y; //Position du point de référence dans l'écran
  int dx,dy; //Position du point de référence dans l'image
  boolean visible;
  int direction; // la direction de l'image est sur la droite pour la faire viser un autre point
  Couple target; // un point vers lequel on vise
  
  Sprite(PImage Gimage, int x, int y, int dx, int dy,int direction, boolean visible) {
    this.Gimage=Gimage;
    this.x=x;
    this.y=y;
    this.dx=dx;
    this.dy=dy;
    this.visible=visible;
    this.direction=direction;
    target = new Couple(0,0);
    target=dir2target(direction);
  }
  
  Couple dir2target(int angle) {
    Couple c = new Couple(int(x+cos(radians(angle))*10),int(y+sin(radians(angle))*10));
    return c;
  }
  
  
  void display() {
    if (visible) {
      pushMatrix();
      translate(x,y);
      float a=atan2(target.getY()-y,target.getX()-x);
      rotate(a);
      image(Gimage,-dx,-dy);
      popMatrix();
    }
  }
  
  void setTarget(int a,int b) {
    target.setXY(a,b);
  }
  
  void setX(int xx) {
    x=xx;
  }
  
  void setY(int yy) {
    y=yy;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  void plusXY(int xx, int yy) {
    x=x+xx;
    y=y+yy;
  }
  
  void visibleON() {
    visible=true;
  }
  
  void visibleOFF() {
    visible=false;
  }
  
  boolean getVisible() {
    return visible;
  }
  
  void setDirection( int direction) {
    this.direction=direction;
    target=dir2target(direction);
  }

}
  

