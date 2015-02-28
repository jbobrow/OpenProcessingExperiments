
//Déterminons la taille de la feuille pour commencer
size(800,800);
background(#FFFFFF);


smooth();
// Toujours centrer
translate(width/2, height/2);

noStroke();
fill(#10C6B9, 20);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 10, 05, 670, 60, 10, 80);

}


// REMPLIR
noFill();
stroke(2,50);


for (int i=0;i<360;i+=80){
  rotate(radians(120));
    quad(0, 0, 150, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 200, 20, 60);
    quad(0, 0, 30, 115, 170, 360, 20, 500);
}


for (int i=0;i<360;i+=80){
  rotate(radians(50));
    quad(0, 0, 150, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 200, 20, 60);
    quad(0, 0, 30, 115, 170, 360, 20, 500);
}

for (int i=0;i<360;i+=80){
  rotate(radians(50));
    quad(0, 0, 150, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 200, 20, 60);
    quad(0, 0, 30, 115, 170, 360, 20, 500);
}

for (int i=0;i<360;i+=80){
  rotate(radians(50));
    quad(0, 0, 150, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 60, 20, 60);
    quad(0, 0, 30, 115, 170, 200, 20, 60);
    quad(0, 0, 30, 115, 170, 360, 20, 500);
}
