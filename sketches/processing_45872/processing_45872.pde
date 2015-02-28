
class Eater{
  int x;
  PImage eater_N;
  PImage eater_O;
  int trailNum = 50;
  int prevx[] = new int[trailNum];
  
  
  //constructor
  Eater(int _x){
    x=_x;
  }
  
  //methods
  void update(float ex){
  /*  int i;
    for(i = 1; i < trailNum; i++){//push back loop
      prevx[i-1] = prevx[i];
    }
    prevx[trailNum-1] = mouseX;*/
    
    if(state=="appledrop"){
      eater_O = loadImage("eater_O.png");
      //i--;
      //ex = prevx[i];
      image(eater_O, (ex-35), 394);
    } else{
      eater_N = loadImage("eater.png");
    image(eater_N,ex,394);
    }
    //println(i);

  }
}

