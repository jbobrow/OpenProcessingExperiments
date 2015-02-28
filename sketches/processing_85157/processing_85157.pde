
//Déterminons la taille de la feuille pour commencer
size(800,800);
background(#FFFFFF);

// REMPLIR
fill(#7EB9FF,30);
noStroke();

smooth();
// Toujours centrer
translate(width/2, height/2);

for (int i=0;i<360;i+=30){
  rotate(radians(5));
  quad(0, 30, 330, 15, 70, 360, 20, 360);
    rotate(radians(5));
  quad(0, 30, 330, 15, 70, 360, 20, 360);

}

for (int i=0;i<360;i+=50){
  rotate(radians(10));
  quad(1350, 350, 110, 05, 70, 160, 10, 80);

}

for (int i=0;i<360;i+=10){
  rotate(radians(15));
  quad(0, 35, 61, 05, 70, 60, 10, 180);

}

fill(0,40);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 60, 105, 70, 60, 10, 80);

}

fill(0);
ellipse(0, 0, 0, 200);
