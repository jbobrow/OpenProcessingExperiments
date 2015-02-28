
//Déterminons la taille de la feuille pour commencer
size(800,800);
background(#FFFFFF);

// REMPLIR
noStroke();
fill(#FF7C7C,30);

smooth();
// Toujours centrer
translate(width/2, height/2);


for (int i=0;i<360;i+=40){
  rotate(radians(4));
  quad(350, 350, 100, 100, 700, 600, 100, 800);

}

for (int i=0;i<360;i+=10){
  rotate(radians(8));
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

fill(#FF7C7C,50);

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(350, 350, 60, 105, 70, 60, 10, 80);
    rotate(radians(2));
    quad(350, 350, 60, 105, 70, 60, 10, 80);
      rotate(radians(2));
      quad(350, 350, 60, 105, 70, 60, 10, 80);
        rotate(radians(2));
        quad(350, 350, 60, 105, 70, 60, 10, 80);

}

fill(#FF7C7C,30);
ellipse(0, 0, 0, 200);


noFill();
stroke(#FF7C7C);

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(50, 250, 60, 105, 70, 60, 10, 80);
    rotate(radians(2));
    quad(50, 250, 60, 105, 70, 60, 10, 80);
      rotate(radians(2));
      quad(50, 50, 60, 105, 70, 60, 10, 80);
        rotate(radians(2));
        quad(50, 50, 60, 105, 70, 60, 10, 80);

}
