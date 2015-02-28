
//Déterminons la taille de la feuille pour commencer
size(800,800);
background(#FFFFFF);


smooth();
// Toujours centrer
translate(width/2, height/2);

noStroke();

fill(0,50,2,0);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 1980, 105, 91, 80, 20, 80);

}

fill(0, 50);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 80, 205, 10, 80, 20, 80);

}

fill(#10C6B9, 20);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 10, 05, 670, 60, 10, 80);
  
}



// REMPLIR
noFill();
stroke(2,80);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 980, 9205, 910, 980, 920, 980);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 1980, 105, 91, 80, 20, 980);

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

stroke(2, 75);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 80, 405, 370, 360, 540, 560);

}

stroke(2,97,50,95);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 50, 1005, 670, 60, 10, 80);

}

translate (850, 0);

stroke(1,50);
for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 980, 9205, 910, 980, 920, 980);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 980, 9205, 910, 980, 920, 980);

}
