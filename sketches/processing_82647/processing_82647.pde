
void setup()
{ // la taille, le fond, et le non remplissage des formes de mon sketch
  size(500,500);
  smooth();
  background(0);
  noFill();
}

void draw ()
{ //je crée une boucle for pour faire tourner mes rectangles
    translate(width/2,height/2);
  for (int i=0;i<360;i+=20)
  { //premiere rotation de rectangles 
    rotate(radians(20));
    strokeWeight(4);
    stroke(#A830AF,90);
   rect(10,10,80,80);
  }

  for (int i=0;i<360;i+=20)
  { // deuxième rotation de rectangles
    rotate(radians(20));
    strokeWeight(10);
    stroke(#F200FF,80);
   rect(5,5,100,100);
  }
  
  noLoop();
}

