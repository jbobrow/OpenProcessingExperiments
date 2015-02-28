
//can't destroy the love - antonio radovcic - 2010 - radovcic.net

//EIGENSCHAFTEN DER UMWELT
float grav = 0;         //GLOBALE GRAVITATION (std 0)
float drag = 0.5;      //GLOBALER LUFTWIDERSTAND (std 0.5)
float abstand = 2;    //ABSTAND DER PIXEL (std 2)


//EIGENSCHAFTEN DER PARTIKEL

float dicke = 1;            //DICKE DER PARTIKEL (std 1)
float traegheit = 9;       //PARTIKELTRÄGHEIT (std 5)
float PSchwer = 5000000;    //ANZIEHUNG AN URSPRÜNGLICHE POSITION (std 1000000)
float PMinDist = 900;    //MINIMALE DISTANZ DER ANZIEHUNG (std 300)


//EIGENSCHAFTEN DER MAUS

float MSchwer = 1000;        //ANZIEHUNG AN MAUS (std 400/800)
float MMinDist = 5;       //MINIMALE DISTANZ DER ANZIEHUNG DER MAUS (std 1)

String bildName = "bild3.jpg";
float bg = 125;
float strokeCol = 255;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

















import traer.physics.*;
ParticleSystem physics;


float[] pixelX = new float[0];
float[] pixelY = new float[0];

Particle[] flying;
Particle[] attracting;
Particle mouse;


PImage bild;
int zaehl;


void setup() {

  bild = loadImage(bildName);

  //standard processing setup
  size(bild.width, bild.height);
  background(bg);
  stroke(strokeCol);
  strokeWeight(dicke);
  noFill();
 // smooth();
  physics = new ParticleSystem(grav,drag);

  physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 




  //---------------------------------------------bild auslesen
  //----hier werden alle Pixel des geladenen Bildes ausgelesen
  //----und die Koordinaten aller schwarzen Pixel in arrays (pixelX und Y) geladen. 

  for(float i = 0; i < bild.width; i+=abstand) {

    for(float j = 0; j < bild.height; j+=abstand) {

      color c = bild.get(int(i),int(j));
      float r = red(c);

      if(r < 100) {

        pixelX = (float[]) append(pixelX, i);
        pixelY = (float[]) append(pixelY, j);

      }
    }
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

  background(bg);  

  //  fill(bg,10);
  // rect(0,0,width,height);


  for(int i=0; i < pixelX.length; i++) {

    //male einen Pixel an jede Partikelstelle
    point(flying[i].position().x(), flying[i].position().y()); 


  }

}







