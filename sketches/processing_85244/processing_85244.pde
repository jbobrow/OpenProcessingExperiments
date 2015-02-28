
void setup()
{ //la taille de mon sketc
  size (500,500);
  smooth();
  background(0);
  noFill();
}
void draw ()
{ //je crée une boucle for pour faire tourner mes arcs
    translate(width/2,height/2);
  for (int i=0;i<360;i+=30)
  {
    rotate(radians(30));
    //contour de l'arc
    strokeWeight(50);
    stroke(#A500FF,50);
    //arc1
    arc(50, 50, 90, 90, 0, PI); 
  } 
    //arc2
     for (int i=0;i<360;i+=30)
  {
    rotate(radians(30));
    stroke(#8B00FF,60);
arc(100,100, 200, 200, HALF_PI, PI+HALF_PI);

      }
      noLoop();
}

