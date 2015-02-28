


int total = 500;
cosa[] cosasList = new cosa[total];

//declaramos variables
          PVector gravedad;

void setup() {
  size(600, 600);
  //inicializamos variables
  gravedad = new PVector(0, 0.1);
  for (int i=0; i<total; i++) {
    cosasList[i] = new cosa();
  
    
  }
}

void draw() {
  background(0);

 fill(0,255,255,100);
 for(int i=1;i<40;i++)
// ellipse( i*random(50),400, 400,  200);

  


  noStroke();
  noSmooth();

  fill(0,255,255,50);
  for (cosa c : cosasList) {
    if (mousePressed) {
      c.attractToMouse();
    } 
    else {
      PVector grav = gravedad.get();
      grav.mult(c.myMass);
      c.addForce(grav);
    }
    c.run();
  }
}

class cosa {

  PVector posicion, velocidad, acceleracion;
  float frictionScaleFactor, mySizeMax, mySizeMin, mySize, myMass;

  cosa() {
    posicion = new PVector(random(width), random(10,40 ));
    velocidad = new PVector(10,0);
    acceleracion = new PVector(0, 0);
    mySizeMin = 10;
    mySizeMax = 50;
    mySize = random(mySizeMin, mySizeMax);
    //ktla
    myMass = map(mySize, mySizeMin, mySizeMax, 1, 2);
   //e7ticac
    frictionScaleFactor = 1.2;//mayor a 1 mejor
  }

  void run() {
    update();
    drawMe();
  }

  void update() {  
    //Añadimos el valor de gravedad (aceleración) a la velocidadocidad y velocidadocidad a posicionición
    velocidad.add(acceleracion);
    velocidad.limit(10);
    posicion.add(velocidad);
    acceleracion.mult(0);

    //comprobamo los bordes de la ventana
    //en lo horizontal, como siempre
    if (posicion.x < mySize/2) {
      velocidad.x *= -1;
      velocidad.div(myMass*frictionScaleFactor);//FRICCION e7ticac
      posicion.x = mySize/2;
  
    } 
    else if (posicion.x > width-mySize/2) {
      velocidad.x *= -1;
      velocidad.div(myMass*frictionScaleFactor);//FRICCION
      posicion.x = width-mySize/2;
     
     
    }
    //pero en lo vertical sólo abajo, y reduciendo cada vez la velocidadocidad, para simular fricción.

    if (posicion.y >random(300,400)-mySize/2) {//||(posicion.y < 0)) {
      velocidad.y *= -1;
      velocidad.div(myMass*frictionScaleFactor);//FRICCION
      //para que no se enganche:
      posicion.y = 300-mySize/2;
      

    } 
    else if (posicion.y - mySize/2 < 0) {
      velocidad.y *= -1;
      velocidad.div(myMass*frictionScaleFactor);//FRICCION
      //para que no se enganche:
      posicion.y = mySize/2;
     
    }
  }

  void drawMe() {
    //y finalmente, dibujamos
     
      fill(#ffffff);
    ellipse(posicion.x, posicion.y, mySize, mySize);
   
    float a = atan2(mouseY-height/2, mouseX-width/2);
  //tra
 translate(width/2,height/2); 
rotate(a);
fill(#ffffff);
stroke(0);
    
triangle(0,0,posicion.x, posicion.y,-15,5);
 triangle(0,0,posicion.x, posicion.y,25,-8);

 noFill();
 fill(0);

//ellipse(20,8/3,4,4 );
    noFill();


  }
// 8wah
  void addForce(PVector _f) {
    PVector f = PVector.div(_f, myMass);
    acceleracion.add(f);//.add(f);
  }

  void attractToMouse() {
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector dis = PVector.sub(mouseVector, posicion);
    //dis.normalize();
    //dis.mult(0.9);
    dis.div(50);
    addForce(dis);
  }
}



