
size(500, 500);
smooth();

translate(width/2, height/2);
// ceci est une experimentation et n'a rien avoir avec mon logo, j'essai juste de reproduit une sorte de rosase //en jouant les supperpositions et les transparence.
for (int i=0;i<360;i+=30) {
  noStroke();
  fill(243, 124, 5, 127);
  rotate(radians(30));

  rect(0, 0, 20, 55, 80, 70, 30, 70);
  rect(0, 0, 30, 65, 90, 60, 20, 60);
  rect(0, 0, 40, 75, 100, 50, 10, 50);
  fill(#5864E0);
  rect(0, 0, 70,85,110,40,5,40);

  fill(245, 87, 161, 127);
  rect(0, 0, 50, 85, 110, 80, 40, 80);
  fill(157, 235, 255, 90);
  rect(0, 0, 70, 95, 150, 121, 90, 120); 
   
  fill(#FFAFFB,80); 
  rect(0, 0, 100, 100, 100, 100, 100, 100);
  rect(0, 0, 130, 130, 130, 130, 130, 130);
}




