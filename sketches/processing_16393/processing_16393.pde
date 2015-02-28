
//import fullscreen.*;
//FullScreen fs; 

//import japplemenubar.*;

//import hypermedia.video.*;

//OpenCV opencv;

//can't destroy the love - antonio radovcic - 2010 - radovcic.net

//EIGENSCHAFTEN DER UMWELT
float grav = 0;         //GLOBALE GRAVITATION (std 0)
float drag = 1.2;      //GLOBALER LUFTWIDERSTAND (std 0.5)
float abstand = 2;    //ABSTAND DER PIXEL (std 2)


//EIGENSCHAFTEN DER PARTIKEL

float dicke = 1;            //DICKE DER PARTIKEL (std 1)
float traegheit = 5;       //PARTIKELTRÄGHEIT (std 5)
float PSchwer = 550000;    //ANZIEHUNG AN URSPRÜNGLICHE POSITION (std 1000000)
float PMinDist = 300;    //MINIMALE DISTANZ DER ANZIEHUNG (std 300)


//EIGENSCHAFTEN DER MAUS

float MSchwer = 1000;        //ANZIEHUNG AN MAUS (std 400/800)
float MMinDist = 5;       //MINIMALE DISTANZ DER ANZIEHUNG DER MAUS (std 1)

String bildName = "heart.jpg";
float bg = 125;
float strokeCol = 0;

PFont myFont;
float t = 2;


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
PImage heart;
PImage cake;


int zaehl;


void setup() {
  
  size(800, 600);
    // Create the fullscreen object
//  fs = new FullScreen(this); 
  // enter fullscreen mode
//  fs.enter(); 
  
  myFont = createFont ("Arial", 9);
  textFont(myFont, 595);
  textAlign (CENTER,CENTER);


    // open video stream
//    opencv = new OpenCV( this );
 //   opencv.capture(800, 600);
    

//  bild = loadImage("heart.jpg");
  heart = loadImage("heart.jpg");
//  cake = loadImage("cake.jpg");

  //standard processing setup
  size(heart.width, heart.height);
  background(bg);
//  stroke(strokeCol);
//  strokeWeight(dicke);
 // noFill();
  smooth();
  physics = new ParticleSystem(grav,drag);

  physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 




  //---------------------------------------------bild auslesen
  //----hier werden alle Pixel des geladenen Bildes ausgelesen
  //----und die Koordinaten aller schwarzen Pixel in arrays (pixelX und Y) geladen. 

  for(float i = 0; i < heart.width; i+=8) {
    for(float j = 0; j < heart.height; j+=8) {

      color c = heart.get(int(i),int(j));
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
  
    imageMode(CENTER);
    background(#000000);  
//    image(cake, width/2, height/2,cake.width/1.7, cake.height/1.7);
 
   
//    opencv.read();           // grab frame from camera
//    opencv.threshold(80);    // set black & white threshold 

    // find blobs
//    Blob[] blobs = opencv.blobs(100, width*height/2, 1, true, OpenCV.MAX_VERTICES*4);

   
    // draw blob results
/*    
    for( int i=0; i<blobs.length; i++ ) {
    
  mouse.position().set( blobs[i].centroid.x, blobs[i].centroid.y, 0);
   fill(255,255,255,160);
  ellipse( blobs[i].centroid.x, blobs[i].centroid.y,50,50);
*/  

  mouse.position().set( 10000, 10000, 0 );
  if(mousePressed == true) {
    mouse.position().set( mouseX, mouseY, 0 );
  }

    
  physics.tick(1);
  
  t -= 0.008;
  fill(255, 0, 0, 50 );
  text("♥",heart.width/2, 210);

 // image(heart, 100, 80,heart.width/1.63, heart.height/1.63);

  for(int m=0; m < pixelX.length; m++) {
    //male einen Pixel an jede Partikelstelle
     fill(255, 17, 160);
     noStroke();     
     ellipse(flying[m].position().x(), flying[m].position().y(),3,3); 
  }
  
  
}

void keyPressed() {
/*  
 Blob[] blobs = opencv.blobs(100, width*height/2, 1, true, OpenCV.MAX_VERTICES*4);
  for( int i=0; i<blobs.length; i++ ) {
      beginShape();
        for( int j=0; j<blobs[i].points.length; j++ ) {
            vertex( blobs[i].points[j].x, blobs[i].points[j].y );
        }
        endShape(CLOSE);
    }
 */     
}



