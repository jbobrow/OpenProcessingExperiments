
class Leaf {


  int x;
  int y;
  int speedx;
  int speedy;


  Leaf( int tempx, int tempy, int tempspeedx, int tempspeedy) {
  
    x = tempx;
    y = tempy;
    speedx = tempspeedx;
    speedy = tempspeedy;
  }

  void imageleaf() {
    image(leaf, x, y);
  }

  void moveleaf() {

    x += speedx;
    y += speedy;
  if((x >= width- 350)||(x<=width - 450) ){
    speedx *= -1;
  }
  if(y>=height){
    y = 200;
  }

}
  
}


