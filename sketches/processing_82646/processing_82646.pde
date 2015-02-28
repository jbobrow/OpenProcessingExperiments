
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
  for (int i=0;i<360;i+=40)
  { //premiere rotation (triangles)
    rotate(radians(40));
    stroke(255,90);
    strokeWeight(8);
    triangle(20, 100, 100, 20, 100, 100);
  }
   for (int i=0;i<360;i+=40)
  { //deuxième rotation 
    rotate(radians(40));
    stroke(255,90);
    strokeWeight(2);
    triangle(10,10,50,0,25,43);
  }
  
  noLoop();
}

