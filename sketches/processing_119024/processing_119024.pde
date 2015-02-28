
//declaro el número de boles que vull 
int numBoles = 100;
//renovo les dades x, y, velx i vely per a totes les boles
float [] x = new float [numBoles];
float [] y = new float [numBoles];
float [] velx = new float [numBoles];
float [] vely = new float [numBoles];
//radi de la bola
int r=30;

void setup () {

  size (900, 600);
  background (255);
  smooth();
//declaro la variable i, que anirà sumant boles fins a arribar al 100
//indico la ubicació d'inici i les velocitats
  for (int i=0; i<numBoles; i++) {
    x[i] = 0;
    y[i] = 0;
    velx [i] = random (1,8);
    vely [i] = random (1,8);
  }
}

void draw () {

  background (255);

  for (int i=0; i<numBoles; i++) {
    
//indico que la ubicació anirà sumant valors en funció de la velocitat donada
    
    x[i] += velx[i];
    y[i] += vely[i];
    
 //si la trajectòria es surt de l'eix de les x, aquesta invertirà la seva direcció
     
    if ((x[i]<0-(r/2))||(x[i]>width-(r/2))) {

      velx [i] =-velx [i];

  //si la trajectòria es surt de l'eix de les y, aquesta invertirà la seva direcció
      
    }
    else {

      if ((y[i]<0-(r/2))||(y[i]>height-(r/2))) {

        vely [i]=-vely [i];
      }
    }
    noStroke();
  fill(0);
 //elipse en la que la seva posició és donada per a totes les boles
  ellipse (x [i], y [i], r, r);
  }

  //  x=x+velx;
  //  y=y+vely;
}
