


int total = 50;
traingles[] trainglesList = new traingles[total];

//declaramos variables
          PVector gravedad;

void setup() {
// size(600, 600, P3D);
 size(600, 600);
  //inicializamos variables
  gravedad = new PVector(0, 0.1);
  

  for (int i=0; i<total; i++) {
   
   

    trainglesList[i] = new traingles();
  
    
  }
}

void draw() {
  background(0);
 noStroke();
  noSmooth();
  for (traingles t : trainglesList) {
    if (mousePressed) {
      t.attractToMouse();
    } 
    else {
      PVector grav = gravedad.get();
      grav.mult(t.myMass);
      t.addForce(grav);
    }
    t.run();
  }
}

class traingles {

  PVector posicion, velocidad, acceleracion;
  float frictionScaleFactor, mySizeMax, mySizeMin, mySize, myMass;
   
    traingles() {
    posicion = new PVector(width/2, height);
    velocidad = new PVector(10, 0);
    acceleracion = new PVector(0, 0);
    mySizeMin = 10;
    mySizeMax = 50;
    mySize = random(mySizeMin, mySizeMax);
    myMass = map(mySize, mySizeMin, mySizeMax, 1, 2);
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

    if (posicion.y >height-mySize/2) {//||(posicion.y < 0)) {
      velocidad.y *= -1;
      velocidad.div(myMass*frictionScaleFactor);//FRICCION
      //para que no se enganche:
      posicion.y = height-mySize/2;
    } 
    else if (posicion.y - mySize/2 < 0) {
      velocidad.y *= -1;
      velocidad.div(myMass*frictionScaleFactor);//FRICCION
      //para que no se enganche:
      posicion.y = mySize/2;
    }
  }

  void drawMe() {
    float a = atan2(mouseY-height/2, mouseX-width/2);
    translate(width/2, height); 
    if (mouseX<=width/2 && mouseY<=height/2)
    {
      rotate(a);
    }
    else
    {
      rotate(-2);
      
     
      
    }

    scale(map(cos(radians(a*20)), -1, 1, .5, 1), 
    map(cos(radians(a*9)), -6, 1, .5, 1));



    fill(#ffffff);
    noStroke();
    //stroke(0);
    //box(mySize);   
    //triangle(width/2,height,posicion.x, posicion.y,-15,5);



    triangle(0, 0, posicion.x, posicion.y, -15, 5);
    ellipse(posicion.x, posicion.y, mySize, mySize);
  }

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



