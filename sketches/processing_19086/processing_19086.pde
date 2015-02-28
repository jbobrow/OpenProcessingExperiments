
import com.twitter.processing.*;
import traer.physics.*;

float grav = 0;         
float drag = 0.5;     
float abstand = 2;    

float dicke = 1;         
float traegheit = 3;       
float PSchwer = 5000000;  
float PMinDist = 900;   
float MSchwer = 100000;       
float MMinDist = 15;       

String bildName1 = "love.jpg";
String bildName2 = "hate.jpg";
float bg = 255;
float strokeCol = 4;

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

int tweets = 0;
String tweetText = "";
PFont f;             
String[] pinakas; 
int counter = 1509;  


String delimiters = " ,.?!;:[]";

void setup() {
  size(700,500);
 bild1 = loadImage(bildName1);
  bild2 = loadImage(bildName2);

  
 
 
  stroke(strokeCol);
  strokeWeight(dicke);
  noFill();
   
  physics = new ParticleSystem(grav,drag);

  physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 


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


  flying = new Particle[pixelX.length];
  attracting = new Particle[pixelX.length];
  mouse = physics.makeParticle();

  for(int i = 0; i < pixelX.length; i++) {


    flying[i] = physics.makeParticle(traegheit, pixelX[i], pixelY[i], 0);
    attracting[i] = physics.makeParticle(1,pixelX[i], pixelY[i],0);

    attracting[i].makeFixed();


    physics.makeAttraction(flying[i], attracting[i], PSchwer,PMinDist);


    physics.makeAttraction(flying[i], mouse, MSchwer,MMinDist);
  }
 
  TweetStream s = new TweetStream(this, "stream.twitter.com", 80, "1/statuses/sample.json", "spyrbril", "atsikipr1234");
  s.go();
 
  f = loadFont( "Georgia-Bold-16.vlw" );

}
  int love=0;
  int hate=0;

void draw() {
   background(255);
 
  pinakas = splitTokens(tweetText,delimiters);

mouse.position().set( 10000, 10000, 0 );



  if(mousePressed == true) {

    mouse.position().set( mouseX, mouseY, 0 );

  }

  physics.tick(1);

  background(bg);  


  for(int i=0; i < pixelX.length; i++) {

   
    point(flying[i].position().x(), flying[i].position().y()); 


  }


  String theword="love";
 
  String theword1="loves";
   String theword2="good";
   String theword3="likes";
   String theword4="like";
  
  String theword5="hate";
 
  String theword6="hates";
  String theword7="die";
  String theword8="dies";
   String theword9="bad";
  String theword10="fuck";
    String theword11="fucks";
  
  

  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword.equals(pinakas[i])) {
      love++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword1.equals(pinakas[i])) {
      love++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword2.equals(pinakas[i])) {
      love++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword3.equals(pinakas[i])) {
      love++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword4.equals(pinakas[i])) {
      love++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword.equals(pinakas[i])) {
      love++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword5.equals(pinakas[i])) {
      hate++;
    }
  }
   for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword6.equals(pinakas[i])) {
      hate++;
    }
  }
   for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword7.equals(pinakas[i])) {
      hate++;
    }
  }
   for (int i = 0; i <pinakas.length; i ++ ) {
    if (theword8.equals(pinakas[i])) {
      hate++;
    }
   }
    for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword9.equals(pinakas[i])) {
      hate++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword10.equals(pinakas[i])) {
      hate++;
    }
  }
  for (int i = 0; i < pinakas.length; i ++ ) {
    if (theword11.equals(pinakas[i])) {
      hate++;
    }
  }


  textFont(f);
  fill(0);
  text(theword,30,470);
  text(theword5,300,470);
  text(hate,300,490);
  text(love,30,490);  
  stroke(4);
  fill(175);
  rect(30,400,love/4,20);
  rect(300,400,hate/4,20);
  rect(30, 320, tweets, 20);
  text(tweetText, 10, 370);
  
  println(pinakas);
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

void tweet(Status tweet) {
  
  tweetText = tweet.text();
  
  tweets += 1;
}


