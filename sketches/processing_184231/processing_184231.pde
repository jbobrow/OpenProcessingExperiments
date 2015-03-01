
int total=10;
int totalStrings = 5;
float[] x = new float[total];
float[] y = new float[total];
float[] velx = new float[total];
float[] vely = new float[total];
float[] sz = new float[total];
float easing = 0.05;
color[] colorRelleno = new color[total];

void setup() {
  size(400, 400);

  //noSmooth();
  //frameRate(40);
  // inicialització
  /* No oblidar que totes les variables que es volen aplicar al núm total d'elements s'han de crear
   també com a MATRIUS, no com simples variables. Si creo velx en lloc de velx[i] - amb la seva matriu-,
   per exemple, i inicialitzo + actualitzo, el que fa es aplicar *la mateixa* velocitat a tots els
   elements. Idem amb els colors */
  for (int i=0; i < total; i++) {
    x[i] = width/2;
    y[i] = height/2;
    velx[i] = random(5);
    vely[i] = random(5);
    sz[i]= random(15, 70);
    colorRelleno[i]= color(random(0, 255), random(0, 255), random(0, 255));
  }

}

void draw() {
  background(0);
  // rectangulo bordes
  int margen = 50;
  int margen2 = 100;
  stroke(255, 99);
  noFill();
  rect(0+margen, 0+margen, width-margen*2, height-margen*2);
  stroke(255, 70);
  rect(0+margen2, 0+margen2, width-margen2*2, height-margen2*2);

  //actualització
  for (int i=0; i< total; i++) { 
    x[i]= x[i] + velx[i];
    y[i]= y[i]+ vely[i];


    // xoca parets
    /* No oblidar sintaxis correcta: x<0 || x> width és incorrecte, perquè no li estic dient que 
     és una matriu x amb el valor de la posició i, sinó només x (que no existeix) */
    if ((x[i]<0) || (x[i]>width)) {
      velx[i]=-velx[i];
    }
    if ((y[i]<0) || (y[i]>height)) {
      vely[i]=-vely[i];
    }// tancament if


    //clic

    // moviment cap a ratolí
    if (mousePressed == true) {
      x[i]= (1-easing) * x[i] + easing * mouseX;

      /*el easing aquí funciona com una "ponderació" en quan a la posició de l'element: 
       com més alt és el núm, més ràpid es mou, perquè augmenta més el SEGON valor, 
       la nova posició. 1 equival a moviment instantani, perquè és el mateix que 
       dir-li que x(1) = x(2), ja que el primer número 
       (x1, antiga posició) hauria de quedar multiplicat per 0(en total sumen 1). 
       Multiplicar per 0.95 i 0.05 respectivament és com dir-li, 'agafa
       la major part de la posició antiga i una mica de la nova'. Com la posició 
       es guarda en cada bucle, es produeix el moviment 
       (o la versió més simple de x = x + v no podria funcionar)*/

      println("x[i] equival a " + x[i] + " = " + (1-easing) + " * " + x[i]+ "["+(1-easing) * x[i]+"]"
        + " + " + easing + " * " + mouseX+ "[" + easing * mouseX+"]");
      y[i] = (1-easing) * y[i] + easing * mouseY;

      //fils
      strokeWeight(2);
      stroke(255, 50);
      line(x[i], y[i], mouseX, mouseY);

      // text

      /* Hauria de sortir text al mig de la pantalla en quant es fa clic, amb el valors de x[i], 
      però al passar-ho a Java no ho llegeix (deixen d'apareixer també les esferes)
       
       fill(255, 30);
       textSize(10);
       //background(0)
       for(int x = 0; x <width; x = x +50) {
       for (int y = height/2; y <height-170; y = y + 20){
       text(stringXi, x, y);
       }
       }*/
       
    }


    fill(colorRelleno[i], 85 );
    noStroke();
    ellipseMode(CENTER);
    ellipse(x[i], y[i], sz[i], sz[i]);
    fill(255);
    ellipse(x[i], y[i], sz[i]-sz[i]*0.50, sz[i]-sz[i]*0.50);
  }//tancament for

  
  
} // tancament draw
