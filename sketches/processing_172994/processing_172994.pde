
//Codigo modificado por daniel B
follower f;
PImage fondo;
PImage img;

void setup(){
  size(600,324);
  //instanciamos el objeto en medio de la pantalla, con velocidades 40 y tamaÃ±o 20
  f = new follower(width/2,height/2,40,40,20); 
  noStroke();
  img = loadImage("sincara.gif");
  fondo = loadImage("fondo.jpg");
}

void draw(){
  //fondo con alfa
  tint(255, 25);
  image(fondo, 0, 0);
  
  //ejecutamos el objeto
  f.run();

}

///////////////////////////////////////
///////////////////////////////////////
//Classe follower
class follower{
  //variables
  float myX, myY, vx, vy;
  float sz; 
  float sz2;
  //constructor
  follower(float _x, float _y, float _vx, float _vy, int _sz){
    myX = _x;
    myY = _y;
    vx = _vx;
    vy = _vy;
    sz = 35;
    sz2= 50;
  }
  //funciÃ³n run (la que invocamos des del draw)
  void run(){
    update();
    drawing();
  }
  //actualizaciÃ³n (de posiciones, aquÃ­)
  void update(){
    //calculamos la distancia entre mouse i bola
    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;
 

    // actualizamos posiciÃ³n a lo tortuga de zenÃ³n
    myX += distanceX/vx;
    myY += distanceY/vy;
  }

  //dibujo
  void drawing(){
    noTint();
    image(img, myX-15, myY-22.5);
    fill(0,100);
     
    ellipse(myX,myY,sz,sz2);
     

    
  
  }

}





