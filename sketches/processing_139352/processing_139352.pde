
class Car{
  int x=100;
  int speed = 10;
  int y=100;
 

  Car(int tempX, int tempY, int tempSpeed){
    x=tempX;
    y=tempY;
    speed=tempSpeed;

  }

  void carDesign(color body){

    noStroke();
    fill(body);
    ellipse(x+20,y+55,70,70);
    ellipse(x+90,y+55,70,70);
    fill(255);
    ellipse(x+20,y+55,55,55);
    ellipse(x+90,y+55,55,55);
    fill(100,175,211);
    ellipse(x+20,y+55,30,30);
    ellipse(x+90,y+55,30,30);
    fill(0);
    ellipse(x+20,y+55,15,15);
    ellipse(x+90,y+55,15,15);

  }
  void movement(){
    x=x+ speed;
    if (x>width-120 || x<0){
      speed = speed*-1;
    }
  }
}



