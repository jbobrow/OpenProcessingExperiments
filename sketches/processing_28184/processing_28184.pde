
///////////////////
//Clase walker/////
///////////////////
color walkerC;
class walker {

  //variables
  float mySz, myStep;
  PVector myPos;
  float vida;
  long nacimiento;
  color myColor;
  ArrayList walkersList=new ArrayList();

  //constructor:

  walker(int _min, int _max, int _st, float _x, float _y, color _c, int _minVida, int _maxVida, long _nac) { //int step int sz
    myPos= new PVector (_x, _y);
    myStep = _st;
    mySz = random(_min, _max);
    vida = random(_minVida, _maxVida);
    nacimiento=_nac;
    myColor= color(random(100,255),random(0,40),random(0,40));
    // myPos=new PVector(width/2, height/2);
  }


  void run() {

    updatePosition();
    drawMe();
  }


  void updatePosition() {

    float randX=random(100);
    float randY = random(100);

    if (randX >= 50) {
      myPos.x += myStep;
    }


    if (randX <= 50) {
      myPos.x -= myStep;
    }


    if (randY >= 50) {
      myPos.y += myStep;
    }


    if (randY <= 50) {
      myPos.y -= myStep;
    }


    // .. y le limitamos el movimiento al canvas.
    //myPos.x=constrain(myPos.x, 0,width);
   // myPos.y=constrain(myPos.y, 0,height);
  }


  void drawMe() {


    float colorAlfa = map(millis()-nacimiento, 0, vida, 255, 0);
    stroke(100,100,255, colorAlfa);
    fill(red(myColor),green(myColor),blue(myColor),colorAlfa);
       
    ellipse(myPos.x, myPos.y, mySz, mySz);
  }


  boolean isDead() {
    if (millis() > nacimiento+vida) {
      return true;
    }
    else {
      return false;
    }
  }
}//walker class end


void meterWalkers(float _x, float _y, long _b, ArrayList _array) {

float px, py;
long birth;
  
  walker w =new walker(
  5, //tamaño min
  10, // tamnuo maximo
  1,//step
  px=_x,
  py=_y,
  walkerC, //color
  100, //vida min
  1500, // vida max
  birth=_b //cuando reboto
    );

  _array.add(w);
  for(int j=0; j<_array.size(); j++) {  
    walker w2 = (walker) _array.get(j);
    w2.run();


    if(w2.isDead()) {
      _array.remove(w2);
    } 
    else {
      w2.run();
    }
  }//forloop walkersList.
}//meterwalkers

