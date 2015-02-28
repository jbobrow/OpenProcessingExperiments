
float gravedad, valorDeFriccionY, valorDeFriccionX;
int ballsSize = 15;
//cremos ARRAYLIST para guardar las bolas
//sin necesidad de decidir a priori su nÃºmero
ArrayList bolas = new ArrayList();
ArrayList bolam = new ArrayList();
ArrayList bolah = new ArrayList();
int intervalsec = 1000;
int lastRecordedTimesec = 0;
int intervalmin = 60000;
int lastRecordedTimemin = 0;
float mapeadosegundos;
float mapeadominutos;
float mapeadohoras;
int sec, minu, hor;
int comienzo =1;



void setup() {
  size(1000,150);
  //gravedad. De hecho, es un valor de aceleraciÃ³n.
  gravedad = 0.1;
  
 
}


void draw() {

  background(225);
  hor=hour();
  minu=minute();
  sec=second();
  mapeadosegundos= map(second(), 0, 59, 0, width);
  mapeadominutos= map(minute(), 0, 59, 0, width);
  mapeadohoras= map(hour(), 0, 23, 0, width);
  
    if (comienzo==1){
  
      if (hor>0){
    for(int i=1; i<hor+1; i++){
    ball d = new ball(i*(width/24), 25, 30, -0.55, 95); 
    bolah.add(d);
    comienzo=0;
    }
  }
    
      if (minu>0){
    for(int i=1; i<minu+1; i++){
    ball c = new ball(i*(width/60), 100, 15, -0.45, 55); 
    bolam.add(c);
    comienzo=0;
    }
  }
  
      if (sec>0){
    for(int i=1; i<sec+1; i++){
    ball b = new ball(i*(width/60), 175, 10, -0.35, 25); 
    bolas.add(b);
    comienzo=0;
    }
  }
      
}
  
  minutos();
  segundos();
  horas();

  actualizarBolas();
 
}




void segundos(){

if(millis()-lastRecordedTimesec>intervalsec){
  println(sec);
   //creamos una nueva bola
  ball b = new ball(mapeadosegundos, 175, 10, -0.35, 25); 
  //y la aÃ±adimos al Array
  bolas.add(b);
   lastRecordedTimesec = millis();
  }
  if (sec==0) {
    bolas.clear();
  }
}


void minutos(){


if(sec==0){
  println(minu);
   //creamos una nueva bola
  ball c = new ball(mapeadominutos, 100, 15, -0.45, 55); 
  //y la aÃ±adimos al Array
  bolam.add(c);
  } 
  if (minu==0) {
    bolam.clear();
  }
}

void horas(){

if(sec==0 && minu==0){
  println(hor);
   //creamos una nueva bola
  ball d = new ball(mapeadohoras, 25, 30, -0.55, 95); 
  //y la aÃ±adimos al Array
  bolah.add(d);
  } 
  if (hor==0) {
    bolah.clear();
  }
}




void actualizarBolas() {
    
  for(int i=0;i<bolah.size();i++) {
    ball d = (ball) bolah.get(i);
    d.run();
  }
  
  for(int i=0;i<bolam.size();i++) {
    ball c = (ball) bolam.get(i);
    c.run();
  }
  
  for(int i=0;i<bolas.size();i++) {
    ball b = (ball) bolas.get(i);
    b.run();
  }

}





////////////////////////////////////////////////////////
///////////////// CLASS BOLAS

class ball {

  PVector myP, myV; 
  float mapeado, colr, mySz, friccion, margen;

  ball(float _mapeado, float _colr, float _mySz, float _friccion, float _margen) {
    mapeado = _mapeado;
    colr = _colr;
    mySz = _mySz;
    friccion = _friccion;
    margen = _margen;
    myP = new PVector(mapeado,0);
    myV = new PVector(0,0);

  
  } 

  void run() {
    update();
    drawMe();
  }

  void update() {
    myV.y += gravedad;

    //actualitzamos las posiciones
    myP.x += myV.x;
    myP.y += myV.y;


    //comprobamos los bordes sÃ³lo por abajo. 
    if (myP.y>height-margen-mySz/2) {
      myV.y *= friccion;
      //para que no se enganche:
      myP.y = height-margen-mySz/2;
    }
  }

  void drawMe() {
    noStroke();
    fill(colr);
    ellipse(myP.x,myP.y,mySz,mySz);
  }
}
