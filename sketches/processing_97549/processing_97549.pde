
//Brennda
size(200,200);
background(255);
noStroke();
colorMode(RGB, 100); // cor do fundo
for (int i = 0; i<200; i++) {
  for (int j = 0; j<200; j++) {
    stroke(i*i/600, j*j/500, 50);
    point(i, j);
  }
} 
 int l=1;
 int k=20;
  stroke(#FFFFFF);//cor das linhas
  strokeWeight(3);// espessura das linhas
 for(l=120; l<200; l=l+15){
   line(l,k,180,20); // direita
   line(20,20,-l+200,k); // esquerda
   k=k+25;
 }

 

