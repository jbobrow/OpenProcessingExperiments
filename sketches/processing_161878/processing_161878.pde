
//by Maxime
//Modified by Antoine M evaluated by Sophie Lejot

 //1. ***
 //2. ** 
 //3. *** 
 //4. ***
 //5. **
 //6. ***
 //7. ***
 //8. ***

void setup() {
  size(300, 300);
  background(255);
}

void draw() {
  for (int y = 0; y<height; y++) {
    //Seconde boucle (largeur)
    for (int x = 0; x<width; x++) {
      rect(x*15, y*15, 10, 10);
    }
  }

  if (mousePressed == true) {
    stroke(random(100, 255), 0, random(100, 255));
    strokeWeight(random(8));
  }
}


void keyPressed() {
  if (key == 's') {
    saveFrame("image_##.png"); //enregistre et numÃ©rote les images
  }
}
