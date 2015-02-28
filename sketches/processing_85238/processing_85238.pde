
//Déterminons la taille de la feuille pour commencer
size(1300,600);
background(#FFFFFF);
// REMPLIR
noFill();
stroke(2,80);

smooth();
// Toujours centrer
translate(width/2, height/2);

for (int i=0;i<360;i+=80){
  rotate(radians(5));
    quad(0, 0, 150, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 360, 20, 500);
}

for (int i=0;i<360;i+=8){
  rotate(radians(5));
    quad(0, 0, 150, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 60, 20, 60);

}

for (int i=0;i<360;i+=80){
  rotate(radians(50));
    quad(0, 0, 150, 115, 170, 60, 20, 60);

}

stroke(2, 75);

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 0, 80, 405, 370, 360, 540, 560);

}



// REMPLIR
fill(#7EB9FF,30);
noStroke();



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
