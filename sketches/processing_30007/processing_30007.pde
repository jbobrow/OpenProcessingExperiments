
void setup() {
  //largeur, hauteur du sketch
  size(1024, 300);
  //couleur de fon du sketch
  background(255);
  //antialiasing des lignes
  smooth();
  //frameRate(10);
}
float Mspeed;
 
void draw() {
  Mspeed=abs(mouseX-pmouseX);
  println(Mspeed);
  noStroke();
  float taille_ellipse=Mspeed;
 // color ellipse_color = color(random(0,200), random(0,200), random(0,200));
  color ellipse_color = color(55+random(0,300), random(0,15), random(0,100));
   // color ellipse_color = color(150+Mspeed*10, Mspeed*20, Mspeed*10 );
  fill(ellipse_color);
  ellipse(mouseX+random(-20,20),mouseY+random(-20,20), taille_ellipse,taille_ellipse);
  if (mousePressed == true) {
    strokeWeight(0.1+Mspeed/20);
    stroke(0, 50);
    strokeWeight(0.1+Mspeed/20);
    line(mouseX, mouseY, width, mouseX);
    line(mouseX, mouseY, 0, mouseX);
    stroke(0);
    strokeWeight(0.5+Mspeed/20);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  //fermeture de draw
  if (keyPressed == true) {
    //saveFrame();
    background(255);
  }
}
 
void mouseMoved() {
 
}

