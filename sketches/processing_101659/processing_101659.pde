
void setup() {
 size (500,400); //tamanho tela
 background(188, 207, 255); //azul ceu

}

void draw() {
noStroke(); // gramado
   fill (118, 147, 93, 50);
   rect (0, 335, 500, 200);

stroke  (0);
/*  rect(1-x, 2-y, 3-t, 4-h);  */
  
  fill  (255); // BLOCO PRINCIPAL
   rect (50, 200, 400, 75); 
  fill  (95, 144, 136, 90); // vidros frente
   rect (67, 230, 366, 20);
  
  fill (255);
for (int x=67; x<433; x+=30){ // janela frente
  strokeWeight (1.5); 
   line (x, 231, x, 249);  
  strokeWeight (1);
for (int y=70; y<400; y+=46)
   line (y, 231, y, 249);
}
  
  strokeWeight(1);
  fill  (255); // PARTE SUPERIOR
   rect (70, 150, 350, 50);
  fill  (250); //detalhe
   rect (75, 150, 130, 50);
  fill  (188, 207, 255); //janela ceu
   rect (205, 162, 40, 25);
  fill  (245); //detalhe coluna
   rect (350, 150, 5, 50);
  fill  (255); 
   rect (355, 150, 7, 50);
  
  fill  (255);  // PARTE INFERIOR
   rect (140, 275, 220, 60);
  fill  (95, 144, 136, 90); 
   rect (140, 275, 220, 60);
  
  fill  (95, 144, 136, 50);// porta entrada
   rect (225, 275, 50, 60);
  fill  (95, 144, 136, 1); 
   rect (225, 280, 50, 15);
  fill  (100); 
   rect (238, 295, 24, 40);
 
  fill  (193, 214, 188); // detalhe lateral
   rect (340, 275, 20, 60); 
  
for (int w=140; w<225; w+=3) { // vidros base - verticais
  line (w, 275, w, 335);
for (int z=274; z<340; z+=3)
  line (z, 275, z, 335);
  
}
  strokeWeight (1.5); // vidros base - horizontal
   line (141, 320, 224, 320);
   line (274, 320, 339, 320);
 
  strokeWeight (1);
  fill  (255); // colunas
   rect (50, 275, 5, 60);
   rect (145, 275, 5, 60);
   rect (247.5, 275, 5, 60);
   rect (350, 275, 5, 60);
   rect (445, 275, 5, 60);
 
  strokeWeight(0.5);
  fill  (232, 183, 155); // CHÃO - base
   rect (45, 335, 410, 2);

  noStroke();
  fill (90, 65, 45); // árvores
   rect (15, 255, 5, 80);
   rect (485, 255, 5, 80);
  fill (36, 85, 10, 5);
   ellipse (15, 240, 60, 90);
   ellipse (485, 240, 80, 90);
   
}
