
// taille
size(700,700);
background(#FFFFFF);

// pas remplir
fill(0,30);
noStroke();

// Toujours centrer
translate(width/2, height/2);


for (int i=0;i<360;i+=3){
  rotate(radians(1));
  quad(0, 0, 10, 05, 670, 60, 50, 10);
   quad(0, 0, 10, 05, 670, 120, 50, 10);
    quad(0, 0, 10, 05, 670, 240, 50, 10);
     quad(0, 0, 10, 05, 670, 480, 50, 10);

}
