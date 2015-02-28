


ArrayList Vapours = new ArrayList ();

Vapour V; //water droplets

void setup () {

  size (600, 700);
  smooth ();
  noStroke();
  colorMode(HSB);
}


// BRINGING UP THE VAPOUR
void keyPressed () {
  Vapour V = new Vapour (new PVector (random(50,550),random(550,680)), color(150,10,250,60),random(3,13) ); //NEED TO MAKE THE OPACITY RANDOM 
  Vapours.add(V);
}





void draw () {
  background(150, 100, 250);  

  /* Slows down the whole thing way too much to be included; annoying
   PImage b;
   b = loadImage("bg.jpg");
   background(b);
   */


  for (int i=0; i<Vapours.size(); i++) {  // PRESS DIFF KEYS FOR DIFF AMOUNT OF VAPOURS
    Vapour V = (Vapour) Vapours.get (i); //get a vapour
    V.move();
    V.render();
    V.run();
  }
}


// IMAGE SAVE
void mousePressed () {
  save("cloud.png"); 
}



