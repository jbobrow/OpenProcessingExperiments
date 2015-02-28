
/**From, dancing shapes by jordan bilich.
LD_0: Felipe Yerimen Elgueta Collado
Conjunto de Pelotas que se unen desde sus nucleos, cuando se acercan. 
Desde cada nucleo surgen 2 lineas que unen al primero con otras 2 esferas distintas.
El color por defecto es celeste, con precionar el boton derecho del mouse cambia a rosado y con el izquierdo a verde.
**/


int numParticles = 25;//Cantidad de Pelotas
int diam; //Diametro
float damp = .9;//desplazamiento
Particle[] myParticle = new Particle[numParticles];


void setup(){
  diam = 70;//se declara el valor del diametro

  smooth();
  size(500, 500);
  frameRate(25);
  fill(0);
  stroke(0, 50);
  for(int i = 0; i < numParticles; i++){
    myParticle[i] = new Particle(random(width), random(height), random(-1, 1), random(-1, 1), i);



  }
}

void draw(){


  background(255);
  fill(0);
  for(int i = 0; i < numParticles; i++){
    myParticle[i].move();



  }

}

class Particle {
  float x;
  float y;
  float velx;
  float vely;
  float accx;
  float accy;
  int[] distances; //toma las distancias y asigna valores en el lardo y posicion para cada linea
  int myNum;
  int nearest;//cercania 1
  float nearestDist;//calcula la cercania de cada pelota para tirar una linea
  int nearest2;//cercania 2
  float nearestDist2;//calcula la cercania con otra pelota para tirar otra linea


  Particle(float x_, float y_, float velx_, float vely_, int myNum_){
    x = x_;
    y = y_;
    myNum = myNum_;
    velx = velx_;
    vely = vely_;
  }


  void move(){
    if(myNum != 0){
      nearestDist = dist(myParticle[0].x, myParticle[0].y, myParticle[myNum].x, myParticle[myNum].y);
    }
    if(myNum == 0){
      nearestDist = dist(myParticle[1].x, myParticle[1].y, myParticle[myNum].x, myParticle[myNum].y);
    }
    for(int i = 0; i < numParticles; i++){
      if(i != myNum){
        if(dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y) < nearestDist){
          nearest = i;
          nearestDist = dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y);
        }
      }
    }
    if(nearest != 0 && myNum != 0){
      nearestDist2 = dist(myParticle[0].x, myParticle[0].y, myParticle[myNum].x, myParticle[myNum].y);
    } 
    else if(nearest != 1 && myNum != 1){
      nearestDist2 = dist(myParticle[1].x, myParticle[1].y, myParticle[myNum].x, myParticle[myNum].y);
    } 
    else if(nearest != 2 && myNum != 2){
      nearestDist2 = dist(myParticle[2].x, myParticle[2].y, myParticle[myNum].x, myParticle[myNum].y);
    }
    for(int i = 0; i < numParticles; i++){
      if(i != myNum && i != nearest){
        if(dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y) < nearestDist2){
          nearest2 = i;
          nearestDist2 = dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y);
        }
      }
    }


    accx = (myParticle[myNum].x - myParticle[nearest].x)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest].x, myParticle[nearest].y) - 1*(myParticle[myNum].x - myParticle[nearest2].x)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest2].x, myParticle[nearest2].y);
    accy = (myParticle[myNum].y - myParticle[nearest].y)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest].x, myParticle[nearest].y) - 1*(myParticle[myNum].y - myParticle[nearest2].y)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest2].x, myParticle[nearest2].y);
    velx += accx;
    vely += accy;
    velx *= damp;
    vely *= damp;


    if(x > 500){//Especifica un rango de movimineto en x
      x = 499;
      velx *= -1;

    }
    if(y < 0){ //Especifica un rango de movimineto en y
      y = 1;
      vely *= -1;

    }
    if(y > 500){//Especifica un rango de movimineto en y
      y = 499;
      vely *= -1;

    }
    if(x < 0){//Especifica un rango de movimineto en x
      x = 1;
      velx *= -1;

    }
    x += velx;
    y += vely;
    stroke(0, 255-nearestDist*2.7);//Primera linea que une centros
    line(x, y, myParticle[nearest].x, myParticle[nearest].y);
    stroke(0, 255-nearestDist2*2.7);//Segunda linea que une centros
    line(x, y, myParticle[nearest2].x, myParticle[nearest2].y);

    noStroke();
    //fill(113,168,205,100);//Pelotas
    
    ellipse(round(x), round(y),diam, diam);
   
   
  
    stroke(0, 255-nearestDist*2.7);//El color de la linea depende de la dstancia ente pelotas
    if (mouseButton == LEFT) {
             fill(75,255,48,100); // Ceselte
    } else if (mouseButton == RIGHT) {
           fill(252,48,48,100); // Rosado
      } else {
  fill(113,168,205,100); // Verde
  
}

 

  }
}








