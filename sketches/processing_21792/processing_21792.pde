

//LA SOLUTION AUX FIN DE SESSIONs
//maintenir le clic gauche et le clic droit enfoncé pour des heures de plaisirs.


//Déclaration des images
PImage redbull;
PImage redbullfree;
PImage davidwings;
PFont futura;

void setup () {
  //déclaration des propriétés du montage
  size( 400, 400);
  background(255);
  frameRate(16);
  redbull = loadImage( "redbull.png");
  redbullfree = loadImage( "redbullfree.png");
  davidwings = loadImage ( "moiwings.png");
  smooth();
  futura = loadFont ( "Futura.vlw");
  textFont (futura, 20);
  textAlign (CENTER, CENTER);
}

void draw () {
  background(255);

  // Fonctions des touches de la sourie
  if (mousePressed) {
    if (mouseButton == LEFT ) {
      for ( int i = 0 ; i < 7 ; i++ ) {
        for ( int j = 0 ; j < 8 ; j++ ) {

          pushMatrix();
          translate(i*75, j*75);
          rotate(frameCount*  0.5);
          image( redbull, 0, 0, 75, 75);
          popMatrix();
        }
      }
    }
    if (mouseButton == RIGHT ) {
      for ( int i = 0 ; i < 50 ; i=i+1 ) {
        image( redbull, random(width),random(height), 75, 75);
      }
      for ( int i = 0 ; i < 50 ; i=i+1 ) {
        image( redbullfree, random(width), random(height), 75, 75);
      }
    }
  }


  else {

    for ( int i = 0 ; i < 7 ; i++ ) {
      for ( int j = 0 ; j < 8 ; j++ ) {
        pushMatrix();
        translate(i*75, j*75);
        image( redbull, 0, 0, 75, 75);
        popMatrix();
      }
    }
  }
  image ( davidwings, mouseX, mouseY);
}


