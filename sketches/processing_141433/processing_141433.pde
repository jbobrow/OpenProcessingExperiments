
class Car {
  //data
  int x, y, speed, dirx,diry;

  //constructor
  Car(int tempX, int tempY, int tempSp){
    x = tempX;
    y = tempY;
    speed = tempSp;
    dirx =2;
    diry =1;
  }
  //function
  void design(){
    rect(x,y,100,10);
  }

  void moving(){
    x = x + speed * dirx; 
    y = y + speed * diry;
    if(x < 0 || x> width){
      dirx = dirx *-1;
    }
    if(y < 0 || y> height){
      diry = diry *-1;

    }
  }
}


