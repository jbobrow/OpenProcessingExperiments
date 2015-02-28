
size(250,250);
smooth();
fill (#FA0D15,25);
noStroke();
for (int c=20; c<240; c+=20){
  rect(0,0,c,c);
    rect(250,250,-c,-c);
      }
      
for (int e=40; e<150; e+=20){
  rect(0,0,e,e);
    rect(250,250,-e,-e);
      strokeWeight(1.5);
      fill(#0D51FA,20);
                ellipse(0,250,e,-e);
                ellipse(250,0,-e,e);
                ellipse(150,150,e,e);
}
      fill(#0D51FA,40);
ellipse (85, 200, 40, 40);
ellipse (120, 170, 60, 60);
ellipse (150, 150, 60, 60);

