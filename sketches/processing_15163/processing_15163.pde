
class Building{

  float h;
  float w;
  int x1,y1,x2,y2;
 
  
  Building (int tx1, int ty1, int tx2, int ty2){
    w= (tx2-tx1);
    h= (ty2-ty1);
    x1= tx1;
    y1= ty1;
    x2= tx2;
    y2= ty2;

  }

  void display(){
    fill(0);
    rectMode(CORNERS);
    rect(x1,y1,x2,y2);
    println(x1+" "+y1+" "+x2+" "+y2);
    rectMode(CORNER);
    fill(255);
    rect(int (random(x1+5,x2-15)), y1+5,10,10);
    rect(int(random(x1+5,x2-15)), y1+25,10,10);
    rect(int(random(x1+15,x2-15)), y1+45,10,10);
    rect(int(random(x1+15,x2-15)), y1+65,10,10);
  
  }
}

//for windows, pick a value between w and h. random(x1, x2-windowwidth)

