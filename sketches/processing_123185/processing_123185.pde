
PImage images[];
int r;
int u;
int p;
int nombre_images = 27;


void setup() {
  size(530, 600);
  PImage img;
  img = loadImage("image_4.png"); // Première image de fond
  background(img);

  imageFolder("image_", nombre_images);
}

void draw() {

  if (mousePressed) {
    copy(images[r], mouseX, mouseY, 30, 30, mouseX, mouseY, 30, 30); // Lorsque que l'on clic et déplace la souris, un carré de 30x30pix dévoile une autre photo
  }
    if (keyPressed) {
    if (key == 'z') {
      u = int(random(0, nombre_images + 1)); // Lorsque l'on appuis sur 'z', l'image de fond change aléatoirement
      p = p+1;
      background(images[u]);
    }
    if (key == 'r') {
      r = int(random(0, nombre_images + 1)); // Lorsque que l'on appuis sur 'r', l'image qui recouvre le fond change avec un autre photo choisi aléatoirement
      p = p+1;
    }
  }


  if (p >= nombre_images) {  // Lorsque la dernière photo est afficher, la boucle recommence à zéro
    p = 0;
  }

}


void imageFolder(String image_, int hasard) {

  images = new PImage[hasard];

  for ( int i = 0; i < images.length; i++ ) {
    images[i] = loadImage(image_ + (i) + ".png" ); // Cela permet d'afficher une image au hasard parmis celles proposées
  }
}







