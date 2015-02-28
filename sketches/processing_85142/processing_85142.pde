
// taille
size(700,700);
background(#FFFFFF);

// pas remplir
noStroke();
fill(#FF7C7C,30);

// Toujours centrer
translate(width/2, height/2);

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=10){
  rotate(radians(30));
  quad(0, 0, 30, 115, 170, 60, 20, 60);
  quad(40, 20, 30, 215, 170, 60, 20, 60);

}



// position ed la forme dans l espace (deux premier numero) 
//  3 et 4  point le plus bas   son x et son y
// 4 et 6 point le plus loin   son x et son y 
// 7 et 8 point ds l angle 

quad(0, 0, 15, 115, 170, 60, 20, 60);

for (int i=0;i<360;i+=10){
  rotate(radians(8));
  quad(0, 10, 130, 15, 170, 60, 20, 60);
  stroke(#FF7C7C,80);
noFill();
quad(0, 10, 440, 215, 70, 220, 1020, 60);
}


// pas remplir
stroke(#FF7C7C,80);
noFill();

for (int i=0;i<360;i+=10){
  rotate(radians(5));
  quad(0, 0, 30, 115, 170, 60, 20, 60);

}


quad(0, 0, 15, 115, 170, 60, 20, 60);
