
void setup()
{ // la taille, le fond, et le non remplissage des formes de mon sketch
  size(500,500);
  smooth();
  background(0);
  noFill();
}

void draw ()
{ //je crée une boucle for pour faire tourner mes formes
    translate(width/2,height/2);
   for (int i=0;i<360;i+=20)
  { // rotation triangle1 bleu clair
    rotate(radians(20));
    stroke(#03FFFD,90);
    strokeWeight(8);
    triangle(0,0,200,0,0,200);
  }
   for (int i=0;i<360;i+=20)
  { // rotation 2 exté
    rotate(radians(20));
    stroke(#0343FF,90);
    strokeWeight(10);
    triangle(100,100,200,100,100,200);
  }
   for (int i=0;i<360;i+=10)
  { // rotation 3 inté
    rotate(radians(10));
    stroke(#0343FF,90);
    strokeWeight(10);
    triangle(50,0,100,100,0,50);
  }
  noLoop();
}


