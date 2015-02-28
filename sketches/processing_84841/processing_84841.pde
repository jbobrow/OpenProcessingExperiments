
size(500,500);
background(#641515);
smooth();
noStroke();
fill(#EADBA6,90);
//stroke(#641515);
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(80));
triangle(10,150,55,10,100,150);
}


