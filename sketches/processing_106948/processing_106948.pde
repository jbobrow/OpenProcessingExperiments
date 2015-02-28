

/*
Função que desenha as linhas na tela.
*/
void scribble(int n, int cl, int alpha){
  stroke(cl, mouseY/4 ,mouseX/4, alpha);
    
    for(i=(n-1);i>0;i--){  
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    
    
    for(i=(n-1);i>0;i--)
        line(x[i], y[i], x[0], y[0]);
    
}

/*
Função para aumentar o número de linhas na tela desenhada, diminuir e limpar o programa;
Muda o tom das cores e a opacidade.
*/

void keyPressed() {
  if(keyCode == 90)
    if(quant < (tam-1))
      quant++;     

  if(keyCode == 88)
    if(quant > 3)
      quant--;
  
  if(keyCode == 67)
    background(255);
  
   if(keyCode == 65)
     if(clar < 255)
       clar++;
   
   if(keyCode == 83)
     if(clar > 0)
       clar--;
   
   if(keyCode == 68)
     if(opac < 255)
       opac++;
   if(keyCode == 70)
     if(opac > 0)
       opac--;
/*
   Atualiza a variável recuperação para verdadeiro
*/
   if(keyCode == 81){
     save("bemloko.png");
     recuperacao = true;
   }
   if(keyCode == 87){
     if(recuperacao){
       img = loadImage("bemloko.png");
       background(img);
     }
   }
      
}


/*
Função para saber quando o mouse esta sendo clicado e arrastado
*/
void mousePressed(){
 drag = true; 
}
/*
Função para saber se o mouse parou de clicar e arrastar
*/
void mouseReleased(){
 drag = false; 
}


