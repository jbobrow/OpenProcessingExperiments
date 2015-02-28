
size(500,500);
background(#641515);
smooth();
noStroke();
fill(#EADBA6,50);
//stroke(#641515);
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(190));
triangle(0,90,30,10,50,90);
fill(#EADBA6,122);
rotate(radians(15));
triangle(10,150,30,10,50,150);
fill(#EADBA6,50);
}


