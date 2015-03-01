
//Steven Bolaños Arango

follower[] f = new follower[int(random(200, 500))];
String texto = "You are in the periphery of the cosmos";
PImage fondo;

void setup() {
  size(400, 400);
  fondo = loadImage ("fondo.jpg");
  cursor(CROSS);
  for (int i = 0; i < f.length; i++)
  {
    //f[i] = new follower(i,i,40*(i*1.2),20*(i*1.2),1); 
    //f[i] = new follower(i,i,40*i,20*i,10);
    f[i] = new follower(random(width)*2, random(height)*2, i*20, i*20, int(random(1, 8)));
  }
  noStroke();
}

void draw() {
  imageMode(CORNER);
  image(fondo, 0, 0);
  //fondo con alfa
  // fill(0,100,45,10);
  //rect(0,0,width,height);
  //ejecutamos el objeto
  for (int i=0; i<f.length; i++) {
    f[i].run();
  }
 // textSize(12);
  text (texto, 100, 190, mouseX, 20);
  fill(255, 255, 255, 25);
  //text("Please make circles", 10, 15, mouseX, 20);
}

///////////////////////////////////////
///////////////////////////////////////
//Classe follower
class follower {
  //variables
  float myX, myY, vx, vy;
  int sz; 
  //constructor
  follower(float _x, float _y, float _vx, float _vy, int _sz) {
    myX = _x;
    myY = _y;
    vx = _vx;
    vy = _vy;
    sz = _sz;
  }

  //funciÃ³n run (la que invocamos des del draw)
  void run() {
    update();
    drawing();
  }

  //actualizaciÃ³n (de posiciones, aquÃ­)  
  void update() {
    //calculamos la distancia entre mouse i bola
    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY; 

    // actualizamos posiciÃ³n a lo tortuga de zenÃ³n
    myX += distanceX/vx;
    myY += distanceY/vy;
  }

  //dibujo
  void drawing() {
    fill(255);
    ellipse(myX, myY, sz, sz);
  }
}



