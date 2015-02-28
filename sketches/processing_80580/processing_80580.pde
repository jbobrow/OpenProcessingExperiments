
//la taille
size(500,500);

//essai de fond
noStroke();
colorMode(HSB, 500);
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, j, 500);
    point(i, j);
      }
}
//je fais une 

//les formes qui vont suivre n'auront pas de bordures
noStroke ();

//je teste les triangles
triangle(30, 75, 58, 20, 86, 75);

triangle(30, 75, 80, 30, 80, 75);

triangle(60, 150, 116, 40, 122, 150);

triangle(250, 75, 250, 20, 86, 75);

ellipse(250,250,210,210);



