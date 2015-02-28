
void setup() {
  size(200,200);
  background(255);
  noStroke();
}
void draw() {
  fill(random(0),random(150),random(255));
  rect(0,0,10,200);
  fill(random(100),random(200),random(120));
  rect(20,0,50,200);
  fill(random(5),random(200),random(175));
  rect(80,0,30,200);
  fill(random(255),random(50),random(100));
  rect(120,0,75,200);
  
  PImage icone_reseau_vecto;
  PImage complex_tuyaux;
  complex_tuyaux = loadImage("complex_tuyaux.png");
  icone_reseau_vecto = loadImage("icone_reseau_vecto.png");


  image(complex_tuyaux,-20,7);
  image(icone_reseau_vecto,60,55);
}

 void keyPressed () {
  saveFrame("export-###.png");
}


