

size (500,500, P3D);
background (#030008);



translate(7, 7);
//Première boucle (hauteur)
for (int y = 0; y < 18; y = y + 1) {
//Seconde boucle (largeur)
for (int x = 0; x < 6; x = x + 1) {
  fill(140,02,20);
 
rect(x * 75, y * 75, 70, 70);
 fill(140,02,20);
rect(x * 55, y * 55, 50, 50);
strokeWeight (1);
rotate(2);
scale(1);
 stroke(255);
 
rect(x * 45, y * 45, 40, 40);

rect(x * 95, y * 95, 90, 90);
  noStroke();
rect(x * 85, y * 55, 50, 50);
rect(x * 105, y * 55, 50, 50);

rect(x * 155, y * 55, 50, 50);
rect(x * 205, y * 105, 100, 100);

 


}
}



