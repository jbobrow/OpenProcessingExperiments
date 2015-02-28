
class Escala {
  int lowValue = 0;  //min value of scale
  int highValue = 10000;  //max value of scale
  int tsize = 20;  //size of triangle for marking line position
  int tarea = 50;  //mouse over area of triangle
  int x1, x2, y;
  int thisx;  //actual position of triangle
  int linRepeat = highValue/1000;
  int expmin = -2;  //min exponantial value
  int expmax;  //max exponantial value, calculated from highValue
  color col = 0;

  Escala(int _x1, int _y) {
    x1 = _x1;
    y = _y;
    x2 = width-x1;
    thisx = x1;
    expmax = int(log10(highValue));
  }

  // Calculates the base-10 logarithm of a number
  float log10 (float x) {
    return (log(x) / log(10));
  }
  
   /* sets position on Scale to mouse position and returns actual decimal value */
  int drag(){
    thisx = constrain(mouseX,x1,x2);
    return int(getValue());
  }
  
  /* changes position on Scale and returns actual decimal value */
  int changePosition(int val){
    thisx = constrain(thisx+val,x1,x2);
    return int(getValue());
  }

  /* returns actual exponential value (=log10) */
  float getValueLog10(){
    return log10(getValue());
  }
  
  /*overwritten by child classes*/
  float getValue(){
    return 0;
  }
}

