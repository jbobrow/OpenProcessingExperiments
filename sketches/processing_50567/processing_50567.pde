
//classe About.

class About 
{
  //variavel para carregar a imagem.
  PImage about;
    
  About() 
  {
    //define background cinza para apagar as outras telas.
    background(170);
    
    //barra superior - menu / instruçoes 
    fill(170);
    noStroke();
    rect(0,0,502,40);
    
    //carrega e exibe a imagem.
    about = loadImage("instruçoes.png");
    image(about, 0, 40);
    
    //insere botao para voltar ao menu.
    textAlign(LEFT);        
    back = new Button(10,5,54,30,170,255,"Menu",255,170,18);
    
    //cria uma especie de breadcrumbs.
    fill(255);
    textFont(PalatinoLinotypeBold48,18);
    text("  >  Instruções",60,27);    
  }
   
}// fim da class


