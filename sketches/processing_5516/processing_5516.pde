
class Column{

  float x;
  float w;
  float colourR;
  float colourG;
  float colourB;
  float speed1;

  Column(float tempCol1,float tempCol2,float tempCol3,float tempSpeed1, float tempW){
    x = 0;
    w = random(tempW,tempW+20);
    colourR = random(tempCol1,tempCol1+100);
    colourG = random(tempCol2,tempCol2+100);
    colourB = random(tempCol3,tempCol3+100);
    speed1 = random(tempSpeed1,tempSpeed1+2);
  }

  void make(){
    fill(colourR,colourG,colourB);
    rect(x,0,w,height);
  }

  void move(){
    x = x + speed1;
    if(x > width || x < 0){
      speed1 = speed1 * -1;
    }
  }
}



