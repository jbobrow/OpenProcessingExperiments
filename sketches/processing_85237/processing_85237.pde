
//Déterminons la taille de la feuille pour commencer
size(1200,700);
background(0);


// REMPLIR
fill(#001448,50);
noStroke();

smooth();
// Toujours centrer
translate(width/2, height/2);


for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 100, 100, 700, 600, 100, 800);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 10, 05, 70, 60, 10, 80);
}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 10, 10, 10, 10, 10, 10);

}




for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 610, 05, 70, 60, 10, 80);

}

fill(0,40);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(350, 350, 60, 105, 70, 60, 10, 80);

}

fill(0);
ellipse(0, 0, 0, 200);


noFill();
stroke(#0032B7,80);
for (int i=0;i<360;i+=20){
  rotate(radians(1));
  quad(50, 350, 60, 105, 70, 60, 10, 80);
  rotate(radians(1));
  quad(50, 350, 60, 105, 70, 60, 10, 80);
    rotate(radians(1));
  quad(50, 350, 60, 105, 70, 60, 10, 80);
    rotate(radians(1));
  quad(50, 350, 60, 105, 70, 60, 10, 80);
    rotate(radians(1));
  quad(50, 1350, 60, 35, 170, 60, 10, 80);
      rotate(radians(1));
  quad(50, 1350, 60, 35, 170, 60, 10, 80);
      rotate(radians(1));
  quad(50, 1350, 60, 35, 170, 60, 10, 80);
}

for (int i=0;i<360;i+=5){
  rotate(radians(1));
  quad(350, 350, 1160, 105, 70, 60, 10, 80);
    quad(350, 350, 1160, 105, 70, 60, 10, 80);

}
