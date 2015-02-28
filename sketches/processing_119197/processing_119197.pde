
//declaro el número de boles que vull 
int numBoles = 100;
//renovo les dades x, y, velx i vely per a totes les boles
float [] x = new float [numBoles];
float [] y = new float [numBoles];
float [] velx = new float [numBoles];
float [] vely = new float [numBoles];
float [] r = new float [numBoles];
float [] cr = new float [numBoles];
float [] cg = new float [numBoles];
float [] cb = new float [numBoles];

void setup () {

  size (900, 600);
  background (255);
  smooth();
//declaro la variable i, que anirà sumant boles fins a arribar al 100
//indico la ubicació d'inici i les velocitats
  for (int i=0; i<numBoles; i++) {
    x[i] = random(0,width);
    y[i] = random(0,height);
   
   //velocitat
    velx [i] = random (1,4);
    vely [i] = random (1,4);
    
   //diferents colors
    cr [i] = random(0,225);
    cg [i] = random(0,225);
    cb [i] = random(0,225);
    
   //diferents radis
    r [i] = random (10,20);
  }
}

void draw () {

  background (255);

  for (int i=0; i<numBoles; i++) {
    
//indico que la ubicació anirà sumant valors en funció de la velocitat donada
    
    x[i] += velx[i];
    y[i] += vely[i];
    
 //si la trajectòria es surt de l'eix de les x, aquesta invertirà la seva direcció
     
    if ((x[i]<0+1+(r[i]/2))||(x[i]>width-1-(r[i]/2))) {

      velx [i] =-velx [i];

  //si la trajectòria es surt de l'eix de les y, aquesta invertirà la seva direcció
      
    }
    else {

      if ((y[i]<0+1+(r[i]/2))||(y[i]>height-1-(r[i]/2))) {

        vely [i]=-vely [i];
      }
    }
  noStroke();
  fill(cr[i],cg[i],cb[i]);
  ellipse (x [i], y [i], r[i], r[i]);
  }

  //  x=x+velx;
  //  y=y+vely;
}
