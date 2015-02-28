
// taille
size(700,700);
background(#FFFFFF);


// pas remplir
noStroke();
fill(#FF7C7C,30);

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
}

// pas remplir
noStroke();
fill(#FF7C7C,30);


// Toujours centrer
translate(width/2, height/2);

for (int i=0;i<360;i+=10){
  rotate(radians(5));
  quad(0, 10, 130, 15, 70, 60, 20, 60);
}
for (int i=0;i<360;i+=10){
  rotate(radians(3));
  quad(0, 30, 110, 15, 70, 60, 120, 60);
  quad(30, 0, 40, 135, 170, 60, 20, 60);
}

// pas remplir
stroke(#FF7C7C,80);
noFill();

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 110, 530, 115, 170, 60, 20, 60);
}
for (int i=0;i<360;i+=10){
  rotate(radians(8));
  quad(0, 0, 30, 115, 170, 60, 20, 60);
  quad(0, 0, 30, 115, 170, 60, 20, 60);
}
