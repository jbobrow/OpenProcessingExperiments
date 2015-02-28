
size(250,250);
smooth();
background (0);
fill (#FAAD12,50);
noStroke();
for (int c=20; c<240; c+=20){
  quad(0,0,c,c,c/2,20,0,20);
    quad(250,0,c,c,c,20,0,20);
    quad(0,0,c,c,50,50,0,50);
    triangle(0,0,20,20,0,50);
   
}
         fill(#1274FA,30);
         for (int c=20; c<240; c+=20){
       ellipse(250,20,-c*2,-c*3);
         }


