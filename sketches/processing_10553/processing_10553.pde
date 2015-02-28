

//PROYECTO 01 SESION 3 : Controlando nuestro codigp
 
 //Título: Andreu Particulas
 //Nombre: Andreu Llopart
 //Lugar: Barcelona
 



//lovehatelove - antonio radovcic - 2010 - radovcic.net


import traer.physics.*;
//EIGENSCHAFTEN DER UMWELT
float grav = 0;         //GLOBALE GRAVITATION (std 0)
float drag = 0.5;      //GLOBALER LUFTWIDERSTAND (std 0.5)
float abstand = 2;    //ABSTAND DER PIXEL (std 2)


//EIGENSCHAFTEN DER PARTIKEL

float dicke = 1;            //DICKE DER PARTIKEL (std 1)
float traegheit = 3;       //PARTIKELTRÄGHEIT (std 5)
float PSchwer = 5000000;    //ANZIEHUNG AN URSPRÜNGLICHE POSITION (std 1000000)
float PMinDist = 900;    //MINIMALE DISTANZ DER ANZIEHUNG (std 300)


//EIGENSCHAFTEN DER MAUS

float MSchwer = 100000;        //ANZIEHUNG AN MAUS (std 400/800)
float MMinDist = 15;       //MINIMALE DISTANZ DER ANZIEHUNG DER MAUS (std 1)

String bildName1 = "love.jpg";
String bildName2 = "hate.jpg";
float bg = 255;
float strokeCol = 0;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------


















ParticleSystem physics;


float[] pixelX = new float[0];
float[] pixelY = new float[0];
float[] pixelX2 = new float[0];
float[] pixelY2 = new float[0];
float[] t_pixelX2 = new float[0];
float[] t_pixelY2 = new float[0];



Particle[] flying;
Particle[] attracting;
Particle mouse;
boolean checkLove = true;

PImage bild1;
PImage bild2;
int zaehl;
float pixelZaehler;

void setup() {

  bild1 = loadImage(bildName1);
  bild2 = loadImage(bildName2);

  //standard processing setup
  //size(bild1.width, bild1.height);
  size(749, 357);
  background(255, 204, 0);
  stroke(strokeCol);
  strokeWeight(dicke);
  noFill();
  // smooth();
  physics = new ParticleSystem(grav,drag);

  physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 




  //---------------------------------------------bild auslesen
  //----hier werden alle Pixel des geladenen Bildes ausgelesen
  //----und die Koordinaten aller schwarzen Pixel in arrays (pixelX und Y) geladen. 

  for(float i = 0; i < bild1.width; i+=abstand) {

    for(float j = 0; j < bild1.height; j+=abstand) {

      color c = bild1.get(int(i),int(j));
      float r = red(c);

      if(r < 100) {

        pixelX = (float[]) append(pixelX, i);
        pixelY = (float[]) append(pixelY, j);

      }
    }
  }




  for(float i = 0; i < bild2.width; i+=1) {

    for(float j = 0; j < bild2.height; j+=1) {

      color c = bild2.get(int(i),int(j));
      float r = red(c);

      if(r < 100) {

        t_pixelX2 = (float[]) append(t_pixelX2, i);
        t_pixelY2 = (float[]) append(t_pixelY2, j);

        pixelZaehler++;

      }
    }
  }



  float neuerAbstand =  pixelZaehler / pixelX.length;



  for(float i = t_pixelX2.length-neuerAbstand; i > 0; i-=neuerAbstand) {


    pixelX2 = (float[]) append(pixelX2,  t_pixelX2[int(i)]);

    pixelY2 = (float[]) append(pixelY2,t_pixelY2[int(i)]);


  }

  //---------------------------------------------------------





  //---------------------------------------------Partikel machen
  //------jeder schwarze Pixel bekommt einen fliegenden und einen
  //------festen Partikel zugewiesen. Zwischen diesen beiden wird eine
  //------attraction (anziehung) erzeugt, welche dafür sorgt dass die partikel
  //------wieder zu ihrem ursprünglichen Platz wollen


  flying = new Particle[pixelX.length];
  attracting = new Particle[pixelX.length];
  mouse = physics.makeParticle();

  for(int i = 0; i < pixelX.length; i++) {


    flying[i] = physics.makeParticle(traegheit, pixelX[i], pixelY[i], 0);
    attracting[i] = physics.makeParticle(1,pixelX[i], pixelY[i],0);

    attracting[i].makeFixed();


    physics.makeAttraction(flying[i], attracting[i], PSchwer,PMinDist);

    //------Die Maus bekommt einen Partikel zugewiesen, der alle anderen anzieht.
    physics.makeAttraction(flying[i], mouse, MSchwer,MMinDist);
  }
  //---------------------------------------------
}



void draw() {


  mouse.position().set( 10000, 10000, 0 );



  if(mousePressed == true) {

    mouse.position().set( mouseX, mouseY, 0 );


  }



  physics.tick(1);

background(153, 153, 153);  

  fill(bg,10);
  rect(0,0,width,height);


  for(int i=0; i < pixelX.length; i++) {

    //male einen Pixel an jede Partikelstelle
    point(flying[i].position().x(), flying[i].position().y()); 


  }

}





void mousePressed() {



  if(checkLove == true) {
    for(int i = 0; i < pixelX.length; i++) {

      attracting[i].position().set(pixelX2[i], pixelY2[i],0);
    }
    checkLove = false;
  } 
  else




      if(checkLove == false) {

      for(int i = 0; i < pixelX.length; i++) {

        attracting[i].position().set(pixelX[i], pixelY[i],0);
      }
      checkLove = true;
    }



}






