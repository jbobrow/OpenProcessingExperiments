
size(500, 500);
background(#678381,200);
noStroke();
 smooth();
translate(width/2, height/2);
for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 400, 5, 20, 60, 450, 20);
 
}



