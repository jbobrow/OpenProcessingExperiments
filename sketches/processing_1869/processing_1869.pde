
float grosor = 5.0;
punto pts[];

int limite = 2000;
int contPts=0;
int cont2 = 0;

int r= 0,radio = 100;

boolean ratonPresionado;
Timer timer,timer_text,timer_sun;
int index = 0;
boton btn_si;
String texto = "";

PFont fontA;
void setup(){
  size(400,300);
  background(255);
  smooth();
  //  noLoop();
  fontA = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  textFont(fontA, 24);
  ///
  pts = new punto[limite];
  timer = new Timer(9500);
  timer_text = new Timer(80);
  timer_sun = new Timer(5);
  //pinta el cielo
  noStroke();
  int _split = (int) ((float)height/4.0)+10;
  int alpha_value;
  for(int i=0; i<_split; i++){
    alpha_value = (int) map(i,0,_split,150,0);
    fill(0,119,219,alpha_value);
    rect(0,i,width,1);
  }
  /*
    //dibuja el sol//////////////////////////////
   int radio = 100;
   for(int i=0; i<radio; i++){
   int tmp = (int)map(i,0,radio,180,0);
   noFill();    
   stroke(255,255,0,tmp);
   ellipse(50,height/2,i,i);
   }
   */
  //pinta la arena
  int _split2 = height;
  for(int i= _split; i<_split2; i++){
    alpha_value = (int) map(i,_split,_split2,0,100);
    fill(255,255,0,alpha_value);
    rect(0,i,width,1);
  }



  //dibuja el tronco
  strokeWeight(grosor);
  stroke(105,56,16,212);
  float aux_x =random(width/2-10,width/2+10);
  curve(width/2,random(height-20,height),
  width/2,height,
  aux_x,height-20,
  aux_x,random(height-20,height)
    );
  //line(width/2,height,width/2,height-20);
  pts[contPts++] = new punto(aux_x,height-20);
  btn_si = new boton("hola",100,200);
  timer.start();
  timer_text.start();
  timer_sun.start();
  r = 0;

}

void draw(){
  //  btn_si.display();

  if(timer_text.terminado()){
    fill(0);    
    if (index < texto.length() ){

      text(texto.charAt(index),40+index*15,100);
      index++;    
      timer_text.start();    
    }
  }
  if(timer_sun.terminado()){
    //dibuja el sol//////////////////////////////
    int radio = 100;
    if(r < radio){
      int tmp = (int)map(r,0,radio,180,0);
      noFill();    
      stroke(255,255,0,tmp);
      ellipse(width/2,50,r,r);
      timer_sun.start();
      r++;
    }
  }
  branch();

}

void branch(){
  float gx = map(contPts,0,limite,15,2);
  float gy = map(contPts,0,limite,20,2);
  if(contPts < limite-7){
    if(grosor > 1.2)
      grosor-=random(.5,.6);
    int n_branches = (int)random(2,2+random(0,3));
    for(int i=0; i< n_branches; i++){ //2 branches for each branch
      int deltay = (int)random(gy-10,gy+10);
      int deltax = (int)random(gx-10,gx+10);
      strokeWeight(grosor); 
      int value_green = (int) map(contPts,0,limite/2,56,128);     
      stroke(105,value_green,16,122);
      //line(pts[cont2].x,pts[cont2].y,pts[cont2].x+deltax,pts[cont2].y-deltay);
      curve(random(pts[cont2].x,pts[cont2].x+deltax),
      random(pts[cont2].y,pts[cont2].y-deltay),

      pts[cont2].x,pts[cont2].y,
      pts[cont2].x+deltax,pts[cont2].y-deltay,

      random(pts[cont2].x,pts[cont2].x+deltax),
      random(pts[cont2].y,pts[cont2].y-deltay)
        );
      pts[contPts++] = new punto( pts[cont2].x+deltax,pts[cont2].y-deltay);
      gx*=-1;
    }
    cont2++;
    if(timer.terminado()){
      branch();
      timer.start();
    }
  }

}
class Timer{
  int t_inicial;
  int lapso;
  Timer(int milisegundos){
    lapso = milisegundos;
  }
  void start(){
    t_inicial = millis();
  }
  boolean terminado(){
    return (millis()-t_inicial >= lapso);      
  }

}
class punto{
  float x,y;

  punto(float x, float y){
    this.x = x;
    this.y = y;
  }  
}
void mousePressed(){
  ratonPresionado = true;
}
void mouseReleased(){
  ratonPresionado = false;
}
class boton{
  String caption;
  int x,y;
  color color_value=220;  
  private int ancho,alto;
  boton(String etiqueta,int x, int y){
    caption = new String(etiqueta);
    this.x = x;
    this.y = y;
    ancho = 80;
    alto=40;
  }

  private boolean isOver(){
    return (mouseX>=x-ancho/2 && mouseX<= x+ancho/2 &&
      mouseY>=y-alto/2 && mouseY<= y+alto/2);

  }
  void display(){
    rectMode(CENTER);
    stroke(200);
    strokeWeight(5);
    //    strokeJoin(ROUND);
    if(ratonPresionado && isOver())
      color_value = color(210);
    else
      color_value = color(220);    
    fill(color_value);
    rect(100,200,ancho,alto);
  }
}





