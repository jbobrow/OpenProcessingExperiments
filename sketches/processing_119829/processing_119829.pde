
/*
Constantly Spawning Particle System
 Written by Ka Kit Cheong, Modified by Michael Kontopoulos
 Project C | Template 1
 */
PImage refe; //A PImage to store our reference image

//float angle = 2.0;
//float offset = 160;
//float scalar = 80;
//float speed = 430;

boolean touching;
ParticleSystem ps;

void setup() {
  size(690, 460);
  smooth();
  noStroke();

  colorMode(HSB, 360, 100, 100);
  //Start the system off with just one particle.
  ps = new ParticleSystem(1, new PVector(width/2, height/2));
  //  noCursor();
  refe = loadImage("eed.png");
}

void draw() {
  background(40);
  //Run the ParticleSystem object. 
  ps.run();
  //Add one new Particle to it each frame.
  //  angle += speed;




  int xpos = int( random( width ));
  int ypos = int( random( height));

  int xpos1 = int( random( width ));
  int ypos1 = int( random( height));

  int xpos2 = int( random( width ));
  int ypos2 = int( random( height));

  int xpos3 = int( random( width ));
  int ypos3 = int( random( height));

  int xpos4 = int( random( width ));
  int ypos4 = int( random( height));

  int xpos5 = int( random( width ));
  int ypos5 = int( random( height));

  int xpos6 = int( random( width ));
  int ypos6 = int( random( height));

  int xpos7 = int( random( width ));
  int ypos7 = int( random( height));

  int xpos8 = int( random( width ));
  int ypos8= int( random( height));

  int xpos9 = int( random( width ));
  int ypos9 = int( random( height));

  int xpos10 = int( random( width ));
  int ypos10 = int( random( height));

  int xpos12 = int( random( width ));
  int ypos12 = int( random( height));

  int xpos13 = int( random( width ));
  int ypos13 = int( random( height));

  int xpos14 = int( random( width ));
  int ypos14 = int( random( height));

  int xpos15 = int( random( width ));
  int ypos15 = int( random( height));

  int xpos16 = int( random( width ));
  int ypos16 = int( random( height));

  int xpos17 = int( random( width ));
  int ypos17 = int( random( height));

  int xpos18 = int( random( width ));
  int ypos18= int( random( height));

  int xpos19 = int( random( width ));
  int ypos19 = int( random( height));

  int xpos20 = int( random( width ));
  int ypos20 = int( random( height));

  int xpos21 = int( random( width ));
  int ypos21 = int( random( height));

  int xpos22 = int( random( width ));
  int ypos22 = int( random( height));

  int xpos23 = int( random( width ));
  int ypos23 = int( random( height));

  int xpos24 = int( random( width ));
  int ypos24 = int( random( height));

  int xpos25 = int( random( width ));
  int ypos25 = int( random( height));

  int xpos26 = int( random( width ));
  int ypos26 = int( random( height));

  int xpos27 = int( random( width ));
  int ypos27 = int( random( height));

  int xpos28 = int( random( width ));
  int ypos28= int( random( height));

  int xpos29 = int( random( width ));
  int ypos29 = int( random( height));

  int xpos30 = int( random( width ));
  int ypos30 = int( random( height));

  int xpos31 = int( random( width ));
  int ypos31 = int( random( height));

  int xpos32 = int( random( width ));
  int ypos32 = int( random( height));

  int xpos33 = int( random( width ));
  int ypos33 = int( random( height));

  int xpos34 = int( random( width ));
  int ypos34 = int( random( height));

  int xpos35 = int( random( width ));
  int ypos35 = int( random( height));

  int xpos36 = int( random( width ));
  int ypos36 = int( random( height));

  int xpos37 = int( random( width ));
  int ypos37 = int( random( height));

  int xpos38 = int( random( width ));
  int ypos38= int( random( height));


  int xpos39 = int( random( width ));
  int ypos39 = int( random( height));

  int xpos40 = int( random( width ));
  int ypos40= int( random( height));
  
  
  //  float y1 = offset + sin(angle+20) * scalar;
  //  float y2 = offset + sin(angle + 160) * scalar;


  int xpos41 = int( random( width ));
  int ypos41 = int( random( height));

  int xpos42 = int( random( width ));
  int ypos42 = int( random( height));

  int xpos43 = int( random( width ));
  int ypos43 = int( random( height));

  int xpos44 = int( random( width ));
  int ypos44 = int( random( height));

  int xpos45 = int( random( width ));
  int ypos45 = int( random( height));

  int xpos46 = int( random( width ));
  int ypos46 = int( random( height));

  int xpos47 = int( random( width ));
  int ypos47 = int( random( height));

  int xpos48 = int( random( width ));
  int ypos48= int( random( height));

  int xpos49 = int( random( width ));
  int ypos49 = int( random( height));

  int xpos50 = int( random( width ));
  int ypos50 = int( random( height));

int xpos51 = int( random( width ));
  int ypos51 = int( random( height));
  
  int xpos52 = int( random( width ));
  int ypos52 = int( random( height));

  int xpos53 = int( random( width ));
  int ypos53 = int( random( height));

  int xpos54 = int( random( width ));
  int ypos54 = int( random( height));

  int xpos55 = int( random( width ));
  int ypos55 = int( random( height));

  int xpos56 = int( random( width ));
  int ypos56 = int( random( height));

  int xpos57 = int( random( width ));
  int ypos57 = int( random( height));

  int xpos58 = int( random( width ));
  int ypos58= int( random( height));

  int xpos59 = int( random( width ));
  int ypos59 = int( random( height));

  int xpos60 = int( random( width ));
  int ypos60 = int( random( height));

  int xpos61 = int( random( width ));
  int ypos61 = int( random( height));

  int xpos62 = int( random( width ));
  int ypos62 = int( random( height));

  int xpos63 = int( random( width ));
  int ypos63 = int( random( height));

  int xpos64 = int( random( width ));
  int ypos64 = int( random( height));

  int xpos65 = int( random( width ));
  int ypos65 = int( random( height));

  int xpos66 = int( random( width ));
  int ypos66 = int( random( height));

  int xpos67 = int( random( width ));
  int ypos67 = int( random( height));

  int xpos68 = int( random( width ));
  int ypos68= int( random( height));

  int xpos69 = int( random( width ));
  int ypos69 = int( random( height));

  int xpos70 = int( random( width ));
  int ypos70 = int( random( height));

  int xpos71 = int( random( width ));
  int ypos71 = int( random( height));

  int xpos72 = int( random( width ));
  int ypos72 = int( random( height));

  int xpos73 = int( random( width ));
  int ypos73 = int( random( height));

  int xpos74 = int( random( width ));
  int ypos74 = int( random( height));

  int xpos75 = int( random( width ));
  int ypos75 = int( random( height));

  int xpos76 = int( random( width ));
  int ypos76 = int( random( height));

  int xpos77 = int( random( width ));
  int ypos77 = int( random( height));

  int xpos78 = int( random( width ));
  int ypos78= int( random( height));


  int xpos79 = int( random( width ));
  int ypos79 = int( random( height));

  int xpos80 = int( random( width ));
  int ypos80= int( random( height));
  

  color temp = refe.get(xpos, ypos);
  color temp1 = refe.get(xpos1, ypos1);
  color temp2 = refe.get(xpos2, ypos2);
  color temp3 = refe.get(xpos3, ypos3);
  color temp4 = refe.get(xpos4, ypos4);
  color temp5 = refe.get(xpos5, ypos5);
  color temp6= refe.get(xpos6, ypos6);
  color temp7 = refe.get(xpos7, ypos7);
  color temp8 = refe.get(xpos8, ypos8);

  color temp9 = refe.get(xpos9, ypos9);
  color temp10 = refe.get(xpos10, ypos10);
  color temp12 = refe.get(xpos12, ypos12);
  color temp13 = refe.get(xpos13, ypos13);
  color temp14 = refe.get(xpos14, ypos14);
  color temp15 = refe.get(xpos15, ypos15);
  color temp16= refe.get(xpos16, ypos16);
  color temp17 = refe.get(xpos17, ypos17);
  color temp18 = refe.get(xpos18, ypos18);
  color temp19 = refe.get(xpos19, ypos19);

  color temp20 = refe.get(xpos20, ypos20);
  color temp21 = refe.get(xpos21, ypos21);
  color temp22 = refe.get(xpos22, ypos22);
  color temp23 = refe.get(xpos23, ypos23);
  color temp24 = refe.get(xpos24, ypos24);
  color temp25 = refe.get(xpos25, ypos25);
  color temp26= refe.get(xpos26, ypos26);
  color temp27 = refe.get(xpos27, ypos27);
  color temp28 = refe.get(xpos28, ypos28);

  color temp29 = refe.get(xpos29, ypos29);
  color temp30 = refe.get(xpos30, ypos30);
  color temp31 = refe.get(xpos31, ypos31);
  color temp32 = refe.get(xpos32, ypos32);
  color temp33 = refe.get(xpos33, ypos33);
  color temp34 = refe.get(xpos34, ypos34);
  color temp35 = refe.get(xpos35, ypos35);
  color temp36= refe.get(xpos36, ypos36);
  color temp37 = refe.get(xpos37, ypos37);
  color temp38 = refe.get(xpos38, ypos38);
  color temp39 = refe.get(xpos39, ypos39);
  color temp40 = refe.get(xpos40, ypos40);
  
  
  
  
 
  color temp41 = refe.get(xpos41, ypos41);
  color temp42 = refe.get(xpos42, ypos42);
  color temp43 = refe.get(xpos43, ypos43);
  color temp44 = refe.get(xpos44, ypos44);
  color temp45 = refe.get(xpos45, ypos45);
  color temp46= refe.get(xpos46, ypos46);
  color temp47 = refe.get(xpos47, ypos47);
  color temp48 = refe.get(xpos48, ypos48);

  color temp49 = refe.get(xpos49, ypos49);
  color temp50 = refe.get(xpos50, ypos50);
    color temp51 = refe.get(xpos51, ypos51);
  color temp52 = refe.get(xpos52, ypos52);
  color temp53 = refe.get(xpos53, ypos53);
  color temp54 = refe.get(xpos54, ypos54);
  color temp55 = refe.get(xpos55, ypos55);
  color temp56= refe.get(xpos56, ypos56);
  color temp57 = refe.get(xpos57, ypos57);
  color temp58 = refe.get(xpos58, ypos58);
  color temp59 = refe.get(xpos59, ypos59);

  color temp60 = refe.get(xpos60, ypos60);
  color temp61 = refe.get(xpos61, ypos61);
  color temp62 = refe.get(xpos62, ypos62);
  color temp63 = refe.get(xpos63, ypos63);
  color temp64 = refe.get(xpos64, ypos64);
  color temp65 = refe.get(xpos65, ypos65);
  color temp66= refe.get(xpos66, ypos66);
  color temp67 = refe.get(xpos67, ypos67);
  color temp68 = refe.get(xpos68, ypos68);

  color temp69 = refe.get(xpos69, ypos69);
  color temp70 = refe.get(xpos70, ypos70);
  color temp71 = refe.get(xpos71, ypos71);
  color temp72 = refe.get(xpos72, ypos72);
  color temp73 = refe.get(xpos73, ypos73);
  color temp74 = refe.get(xpos74, ypos74);
  color temp75 = refe.get(xpos75, ypos75);
  color temp76= refe.get(xpos76, ypos76);
  color temp77 = refe.get(xpos77, ypos77);
  color temp78 = refe.get(xpos78, ypos78);
  color temp79 = refe.get(xpos79, ypos79);
  color temp80 = refe.get(xpos80, ypos80);
  
  if ( blue(temp)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos, ypos);
  }

  if ( blue(temp1)  < 100) {
    ps.addParticle(xpos1, ypos1);
  }


  if ( blue(temp2)  < 100 ) {
    ps.addParticle(xpos2, ypos2);
  }



  if ( blue(temp3)  < 100 ) {

    ps.addParticle(xpos3, ypos3);
  }


  if ( blue(temp4)  < 100 ) {

    ps.addParticle(xpos4, ypos4);
  }


  if ( blue(temp5)  < 100 ) {
    ps.addParticle(xpos5, ypos5);
  }

  if ( blue(temp6)  < 100 ) {
    ps.addParticle(xpos6, ypos6);
  }

  if ( blue(temp7)  < 100 ) {
    ps.addParticle(xpos7, ypos7);
  }

  if ( blue(temp8)  < 100 ) {
    ps.addParticle(xpos8, ypos8);
  }

  if ( blue(temp9)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos9, ypos9);
  }

  if ( blue(temp10)  < 100) {
    ps.addParticle(xpos10, ypos10);
  }


  if ( blue(temp12)  < 100 ) {
    ps.addParticle(xpos12, ypos12);
  }



  if ( blue(temp13)  < 100 ) {

    ps.addParticle(xpos13, ypos13);
  }


  if ( blue(temp14)  < 100 ) {

    ps.addParticle(xpos14, ypos14);
  }


  if ( blue(temp15)  < 100 ) {
    ps.addParticle(xpos15, ypos15);
  }

  if ( blue(temp16)  < 100 ) {
    ps.addParticle(xpos16, ypos16);
  }

  if ( blue(temp17)  < 100 ) {
    ps.addParticle(xpos17, ypos17);
  }

  if ( blue(temp18)  < 100 ) {
    ps.addParticle(xpos18, ypos18);
  }



  if ( blue(temp19)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos19, ypos19);
  }


  if ( blue(temp20)  < 100 ) {
    ps.addParticle(xpos20, ypos20);
  }

  if ( blue(temp21)  < 100) {
    ps.addParticle(xpos21, ypos21);
  }


  if ( blue(temp22)  < 100 ) {
    ps.addParticle(xpos22, ypos22);
  }



  if ( blue(temp23)  < 100 ) {

    ps.addParticle(xpos23, ypos23);
  }


  if ( blue(temp24)  < 100 ) {

    ps.addParticle(xpos24, ypos24);
  }


  if ( blue(temp25)  < 100 ) {
    ps.addParticle(xpos25, ypos25);
  }

  if ( blue(temp26)  < 100 ) {
    ps.addParticle(xpos26, ypos26);
  }

  if ( blue(temp27)  < 100 ) {
    ps.addParticle(xpos27, ypos27);
  }

  if ( blue(temp28)  < 100 ) {
    ps.addParticle(xpos28, ypos28);
  }

  if ( blue(temp29)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos29, ypos29);
  }

  if ( blue(temp30)  < 100) {
    ps.addParticle(xpos30, ypos30);
  }


  if ( blue(temp31)  < 100 ) {
    ps.addParticle(xpos31, ypos31);
  }


  if ( blue(temp32)  < 100 ) {
    ps.addParticle(xpos32, ypos32);
  }


  if ( blue(temp33)  < 100 ) {

    ps.addParticle(xpos33, ypos33);
  }


  if ( blue(temp34)  < 100 ) {

    ps.addParticle(xpos34, ypos34);
  }


  if ( blue(temp35)  < 100 ) {
    ps.addParticle(xpos35, ypos35);
  }

  if ( blue(temp36)  < 100 ) {
    ps.addParticle(xpos36, ypos36);
  }

  if ( blue(temp37)  < 100 ) {
    ps.addParticle(xpos37, ypos37);
  }

  if ( blue(temp38)  < 100 ) {
    ps.addParticle(xpos38, ypos38);
  }
  
  if ( blue(temp39)  < 100 ) {
    ps.addParticle(xpos39, ypos39);
  }

  if ( blue(temp40)  < 100 ) {
    ps.addParticle(xpos40, ypos40);
  }


/////////////////////////////////////


  if ( blue(temp41)  < 100) {
    ps.addParticle(xpos41, ypos41);
  }


  if ( blue(temp42)  < 100 ) {
    ps.addParticle(xpos42, ypos42);
  }



  if ( blue(temp43)  < 100 ) {

    ps.addParticle(xpos43, ypos43);
  }


  if ( blue(temp44)  < 100 ) {

    ps.addParticle(xpos44, ypos44);
  }


  if ( blue(temp45)  < 100 ) {
    ps.addParticle(xpos45, ypos45);
  }

  if ( blue(temp46)  < 100 ) {
    ps.addParticle(xpos46, ypos46);
  }

  if ( blue(temp47)  < 100 ) {
    ps.addParticle(xpos47, ypos47);
  }

  if ( blue(temp48)  < 100 ) {
    ps.addParticle(xpos48, ypos48);
  }

  if ( blue(temp49)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos49, ypos49);
  }

  if ( blue(temp50)  < 100) {
    ps.addParticle(xpos10, ypos50);
  }

  if ( blue(temp51)  < 100 ) {
    ps.addParticle(xpos51, ypos51);
  }
  
  if ( blue(temp52)  < 100 ) {
    ps.addParticle(xpos52, ypos52);
  }



  if ( blue(temp53)  < 100 ) {

    ps.addParticle(xpos53, ypos53);
  }


  if ( blue(temp54)  < 100 ) {

    ps.addParticle(xpos54, ypos54);
  }


  if ( blue(temp55)  < 100 ) {
    ps.addParticle(xpos55, ypos55);
  }

  if ( blue(temp56)  < 100 ) {
    ps.addParticle(xpos56, ypos56);
  }

  if ( blue(temp57)  < 100 ) {
    ps.addParticle(xpos57, ypos57);
  }

  if ( blue(temp58)  < 100 ) {
    ps.addParticle(xpos58, ypos58);
  }



  if ( blue(temp59)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos59, ypos59);
  }


  if ( blue(temp60)  < 100 ) {
    ps.addParticle(xpos20, ypos60);
  }

  if ( blue(temp61)  < 100) {
    ps.addParticle(xpos61, ypos61);
  }


  if ( blue(temp62)  < 100 ) {
    ps.addParticle(xpos62, ypos62);
  }



  if ( blue(temp63)  < 100 ) {

    ps.addParticle(xpos63, ypos63);
  }


  if ( blue(temp64)  < 100 ) {

    ps.addParticle(xpos64, ypos64);
  }


  if ( blue(temp65)  < 100 ) {
    ps.addParticle(xpos65, ypos65);
  }

  if ( blue(temp66)  < 100 ) {
    ps.addParticle(xpos66, ypos66);
  }

  if ( blue(temp67)  < 100 ) {
    ps.addParticle(xpos67, ypos67);
  }

  if ( blue(temp68)  < 100 ) {
    ps.addParticle(xpos68, ypos68);
  }

  if ( blue(temp69)  < 100 ) //100 is an arbitrary threshold between 0-255
  {

    //    float s = random(5, 30);
    //    ellipse(xpos, ypos, s, s);


    ps.addParticle(xpos69, ypos69);
  }

  if ( blue(temp70)  < 100) {
    ps.addParticle(xpos70, ypos70);
  }


  if ( blue(temp71)  < 100 ) {
    ps.addParticle(xpos71, ypos71);
  }


  if ( blue(temp72)  < 100 ) {
    ps.addParticle(xpos72, ypos72);
  }


  if ( blue(temp73)  < 100 ) {

    ps.addParticle(xpos73, ypos73);
  }


  if ( blue(temp74)  < 100 ) {

    ps.addParticle(xpos74, ypos74);
  }


  if ( blue(temp75)  < 100 ) {
    ps.addParticle(xpos75, ypos75);
  }

  if ( blue(temp76)  < 100 ) {
    ps.addParticle(xpos76, ypos76);
  }

  if ( blue(temp77)  < 100 ) {
    ps.addParticle(xpos77, ypos77);
  }

  if ( blue(temp78)  < 100 ) {
    ps.addParticle(xpos78, ypos78);
  }
  
  if ( blue(temp79)  < 100 ) {
    ps.addParticle(xpos79, ypos79);
  }

  if ( blue(temp80)  < 100 ) {
    ps.addParticle(xpos80, ypos80);
  }

 //ps.addParticle(xpos, ypos);

}


class Particle {
  //http://processing.org/learning/pvector/
  //PVector is just a way of storing X and Y values in one object.
  PVector loc;
  PVector vel;
  PVector acc;
  float life;
  float h; //hue


  Particle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(random(-0.009, 0.009), random(-0.39, 0.009), 0);
    acc = new PVector(random(-0.004, 0.004), random(-0.019, 0.004), 0);
    life = 430.0;
    h = random(185,260);
  }

  void run() {
    display();
    update();
  }

  void display() {
    
  
  

    //Fill with the selected hue. Sat/Bright = 90. Alpha is linked to the life.
    fill(h, 90, 90, life);

    float a = life * 0.016; //Size also linked to life.

 ellipse(loc.x, loc.y, a, a);
 



//           stroke(0);
//            strokeWeight(0.5);
//            line(loc.x, loc.y, loc.x, loc.y+6);
//         line(loc.x-3, loc.y+3, loc.x+3, loc.y+3);
  }

  void update() {
    //"add" for PVectors is identical to 
    //velocityX += accelerationX, velocityY += accelerationY
    vel.add(acc); //Add acceleration to velocity
    loc.add(vel); //Add velocity to position
    life -= 2.9;  //Decrease the lifespan by 2
  }

  boolean dead() {
    if (life <= 0.00) { //Am I dead???
      return true;
    } 
    else {
      return false;
    }
  }
}

/*  ParticleSystem class.
 Manages a list of Particle objects.
 We use an ArrayList because it's easier to remove things from and the size
 can change dynamically: http://www.processing.org/reference/ArrayList.html
 */

class ParticleSystem {

  ArrayList particles; //The list of Particles
  PVector origin;  

  ParticleSystem(int num, PVector _origin) {
    particles = new ArrayList();
    origin = _origin.get();
    //Add "num" particles to this system. 
    for ( int i=0; i<num; i++) {
      particles.add(new Particle(origin));
     
    }
  }

  void run() {
    //Cycle through the list of particles
    for (int i = particles.size()-1; i>=0; i--) {
      //Grab a reference to the current particle we're looking at
      Particle p = (Particle) particles.get(i);
      //Call this particle's "run" method
      p.run();
      //Check to see if it's dead. If so, remove it from this list.
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }
  //Add a single Particle
  void addParticle(float _x, float _y) {
    particles.add(new Particle(new PVector(_x, _y)));
    particles.add(new Particle(new PVector(_x, _y)));
  }

  //Is the particle system dead for whatever reason?
  boolean dead() {
    if (particles.isEmpty())
      return true;
    else
      return false;
  }
}



