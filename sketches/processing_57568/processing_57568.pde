
//Group Project Practice

Coin coin1;
PImage coinslot;
PImage coin;
int x,y;

void setup(){
  size(600,600);
  coin1 = new Coin(50,50);
  coinslot = loadImage( "coinslot.png" );
  coin = loadImage( "coin.png" );
  smooth();

}

void draw(){
  coin1.update(x,y);
  coin1.display();
}

class Coin{
  int x, y;
  boolean over;
  Coin(int _x,int _y){
    x = _x;
    y = _y;
    over = false;
  }
  void update(int mx,int my){    
    if(dist(mouseX,mouseY,x,y) <10){
      background(255);
      over = true;
    }else if(over);
      background(255,0,0);
  }
  void display(){
      image(coinslot,300,100);
      image(coin,x,y);
  }
  void press(){
    if(dist(mouseX,mouseY,x,y) <50){
      x = mouseX;
      y = mouseY;
    }
  }
}

void mouseDragged(){
  coin1.press();
}


