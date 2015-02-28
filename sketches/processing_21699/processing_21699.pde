

/*
processing javascipt must use preload for images
/*

/* @pjs preload="frame_0000.png,frame_0001.png,frame_0002.png,frame_0003.png,frame_0004.png,frame_0005.png,frame_0006.png,frame_0007.png,frame_0008.png,frame_0009.png"; */


int images = 10;

PImage[] img;

int temps;
int compteur;

void setup() {
  size(200,200);
  img = new PImage[images];

  for ( int i = 0; i < images ; i ++ ) {
    img[i] = loadImage("frame_000"+i+".png");
  }

  
}

void draw() {

  background(100);

  // Changer l'image de l'animation a chaque 250 ms
  if ( millis() - temps >= 250 ) {
    temps = millis();
    compteur = (compteur + 1) % images;
  }

  imageMode(CENTER);
  image( img[compteur], width/2, height/2);
}



