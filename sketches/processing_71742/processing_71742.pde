
smooth();
size(900,712);


PImage jockey;
jockey = loadImage("19300001241054130771988641381.jpg");
tint(#BF5711);
image(jockey, 0, 0);

for(int x=30; x<=900; x +=125){
  for(int y=40; y<=700; y+=125){
   noStroke();
   fill(#FF7417);
 beginShape();
vertex(40,40);
vertex(x+5,y+5);
vertex(x+35,y+68);
vertex(x-9,y+15);
vertex(x,y);
endShape();
    }
}



      














