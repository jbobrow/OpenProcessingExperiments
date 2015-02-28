
class Box{
  int index;
  int x, y;
  color c;
 
  Box(int newindex, int newx, int newy){
    index = newindex;
    x = newx;
    y = newy;
    int randNum = (int) random(5);
    switch(randNum) {
    case 0:
      c = color(#FFAAAA);
      break;
    case 1:
      c = color(#D7AAFF);
      break;
    case 2:
      c = color(#AAE2FF);
      break;
    case 3:
      c = color(#AAFFAF);
      break;
    case 4:
      c = color(#FFE3AA);
      break;
    }
  }
 
  void display(){
    fill(c);
    noStroke();
    rect(x,y,20,20);
 
  }
}


