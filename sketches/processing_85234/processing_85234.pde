
// taille
size(1000,400);
background(#FFFFFF);

// pas remplir
fill(0,30);
noStroke();

// Toujours centrer
translate(width/2, height/2);

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=10){
  rotate(radians(8));
  quad(0, 100, 10, 05, 670, 60, 10, 80);
  quad(0, 100, 10, 05, 670, 60, 10, 80);
}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 10, 05, 670, 60, 50, 10);

}
