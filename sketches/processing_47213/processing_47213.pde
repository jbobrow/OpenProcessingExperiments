
import netscape.javascript.*;


 PImage img1,img11,img2,img21, img211, img2111, img212, img2121, img213, img2131; 
 int pag=1;

void setup()
{
size (800,450);
//background(random(233),random(233),random(233));
background(255,255,255);
}

void draw()
{ 
  img11=loadImage ("TremBao.png");
  img1=loadImage ("home1.png");
    img2=loadImage("sumare2.png");
      img21=loadImage("sumare_opcoes3.png");
        img211=loadImage("sumare_zilda6.png");
          img2111=loadImage("sumare_zilda_rota7.png");        
        img212=loadImage("sumare_palestra4.png");
          img2121=loadImage("sumare_palestra_rota5.png");
        img213=loadImage("sumare_centro8.png");
          img2131=loadImage("sumare_centro_Rota9.png");

if(pag==1) // se pag==1
{
  image(img1,0,0); // carrega img1  
}

  if(pag==2) // se pag==2
  {
    image(img2,0,0); //cerraga img2
  }

    if(pag==21) // se pag==21
    {
      image(img21,0,0); // carrega img21
    }

      if(pag==211) // se pag==211
      {
        image(img211,0,0); //carrega img211
      }

        if(pag==2111) // se pag==2111
        {
          image(img2111,0,0); //carrega img2111
        }

      if(pag==212) // se pag==212
      {
        image(img212,0,0); //carrega img212
      }

        if(pag==2121) // se pag==2121
        {
          image(img2121,0,0); //carrega img2111
        }

      if(pag==213) // se pag==213
      {
        image(img213,0,0); //carrega img213
      }

        if(pag==2131) // se pag==2131
        {
          image(img2131,0,0); //carrega img2131
        }

noFill();
//rect(264,360,15,15); //sumare 2
//rect(640,115,35,40); //opcao_lazer 2.1
//rect(670,145,30,30); //opcao_Zilda Natanael 2.1.1
//rect(670,195,30,30); //opcao_palestra 2.1.2
//rect(670,245,30,30); //centro  2.1.3

//rect(593,51,25,25); //rotas
//rect(655,7,75,25); //home
//rect(720,410,70,30); //voltar 

}

void mousePressed()

//img11=loadImage ("TremBao.png");
//image(img11,0,0);


{
    //Retorna Pagina 1 (home)
  if(mouseX>655 && mouseX<730 && mouseY>7 && mouseY<32)
  {
    pag=1;
  } 

  //Abre Pagina 2 (sumare)
  if(mouseX>264 && mouseX<279 && mouseY>360 && mouseY<375)
  {
    if(pag==1){ // se estiver na pag 1 vai para pag 2.
    pag=2;}
  }
  
  //Abre Pagina 2.1 (Opcoes de lazer)
  if(mouseX>640 && mouseX<675 && mouseY>110 && mouseY<150)
  {
    if(pag==2){
    pag=21;}
  }

  //Abre Pagina 2.1.1 (Zilda)
    if(mouseX>670 && mouseX<700 && mouseY>145 && mouseY<175)
  {
     if(pag==21){
    pag=211;}
  }
  
   //Abre Pagina 2.1.2 (palestra)
    if(mouseX>670 && mouseX<7000 && mouseY>195 && mouseY<225)
  {
    if(pag==21){
    pag=212;}
  }
  
     //Abre Pagina 2.1.3 (centro)
    if(mouseX>670 && mouseX<700 && mouseY>245 && mouseY<275)
  {
    if(pag==21){
    pag=213;}
  }
  
   //Abre Pagina 2.1.1.1 (zilda_rota)
    if(mouseX>593 && mouseX<618 && mouseY>51 && mouseY<76)
  {
    if(pag==211){
    pag=2111;}
  }
  
   //Abre Pagina 2.1.2.1 (palestra_rota)
    if(mouseX>593 && mouseX<618 && mouseY>51 && mouseY<76)
  {
    if(pag==212){
    pag=2121;}
  }
    
   //Abre Pagina 2.1.3.1 (centro_rota)
    if(mouseX>593 && mouseX<618 && mouseY>51 && mouseY<76)
  {
    if(pag==213){
    pag=2131;}
  }

  
  //Botao VOLTAR
      if(mouseX>720 && mouseX<790 && mouseY>410 && mouseY<440)
      {
       if(pag==2)
       {pag=1;}
       
       if(pag==21)
       {pag=2;}
       
       if(pag==211)
       {pag=21;}
      
       if(pag==212)
       {pag=21;}
       
       if(pag==213)
       {pag=21;}
       
       if(pag==2111)
       {pag=211;}
       
       if(pag==2121)
       {pag=212;}
       
       if(pag==2131)
       {pag=213;}
       
      }
  
}
void mouseMoved(){
// tint(random(255),random(255),random(255));
 image(img11,mouseX,mouseY,50,70); 
}
void mouseReleased(){
  loop();
}

void mouseDragged(){
noLoop();


}

