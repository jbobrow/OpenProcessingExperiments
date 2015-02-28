
// taille
size(1200,800);
background(#FFFFFF);


// pas remplir


// Toujours centrer
translate(width/2, height/2);

noStroke();
 
for (int i=0;i<360;i+=30){
  rotate(radians(5));
  quad(0, 30, 330, 15, 70, 360, 20, 360);
    rotate(radians(5));
  quad(0, 30, 330, 15, 70, 360, 20, 360);
 
}
 



 
fill(0,40);
 


///////////

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 310, 530, 115, 170, 60, 20, 60);
}




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
stroke(#FFFFFF,80);
noFill();

// option de tourné sur sois meme la forme
for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 110, 230, 115, 170, 60, 20, 60);
    quad(0, 110, 400, 115, 170, 60, 20, 60);
  quad(0, 110, 120, 115, 170, 60, 20, 60);
  quad(0, 110, 190, 115, 170, 60, 20, 60);
}
for (int i=0;i<360;i+=10){
  rotate(radians(8));
  quad(0, 0, 30, 115, 170, 60, 20, 60);
  quad(0, 0, 30, 115, 170, 60, 20, 60);
}
