
//INICIALIZAÇÃO PDF
import processing.pdf.*;
boolean pdf;

//VARIÁVEIS GERAIS
char  escolha;
int xc;
int yc;
int mouse;
int dn;
int cn;
int xl;


//VÁRIAVEIS MALHA INTERATIVA
int xm;
int ym;
int pxn;
int pyn;
int [][] elipses;
int indice;




//SETUP
void setup()
{
  size(1040,605);
  elipses = new int [100][3];
  indice = 0;
  background(0);
  textSize(28);
  textAlign(CENTER);
  text("BEM-VINDO", 500, 125); 
  fill(random(255),random(255),random(255));
  text("Aperte 0 para ver o Water Cube de dia e para trocar a cor da fachada!", 500, 175);
  fill(random(255),random(255),random(255));
  text("Aperte 1 para ver o Water Cube de noite e para trocar a cor da fachada!", 500, 225);
  fill(random(255),random(255),random(255));
  text("Para personalizar a fachada do prédio clique e arraste o mouse!", 500, 275);
}




//PROGRAMA FINAL! DRAW
void draw()
{
  if (pdf == true)
  {
    beginRecord(PDF, "frame-####.pdf"); 
  }
  
  predn();
  if (pdf == true)
  {
    endRecord();
    println("Acabou");
    pdf = false;
  }
}



//COR DA FACHADA
color parede = color(20,100,40);




//CRIA A ESTRUTURA INICIAL MODIFICANDO AS CORES CASO SEJA DIA OU NOITE
void predn()
{
  keyPressed();
  //PRÉDIO DE NOITE
  if (dn == '1')
  {
    noite();
  }
  //PRÉDIO DE DIA
  if (dn == '0')
  {
    dia();
  }
}

//FUNÇÃO DE AUXILIO: DIA & NOITE
void keyPressed()
{
  dn = key;
}



//FUNÇÃO QUE CRIA EDIFICIO DE DIA
void dia ()
{
    stroke(1);
    //PAREDES
    fill (parede);
    quad(35,443,521,190,521,550,14,560);
    quad(521,190, 1027,437,1060,560,521,550);
    noFill();
    malhapar();
    
    //CALÇADA
    noStroke();
    fill(140);
    quad(1040,573,521,590,521,610,1040,610);
    quad(521,590,521,610,0,610,0,570);
    
    //ESTRUTURAS INFERIORES
    stroke(1);
    fill(60);
    quad(521,550,521,590, 8,574,14,557);
    quad(521,550,521,590,1040,572,1040,558);
    
    //PORTARIA
    fill(200);
    quad(584,588,579,492,1010,530,1014,573);
    fill(60);
    quad(650,585,644, 520,980,540,983,574);
      

    //CÉU
    fill(0,100,255);
    noStroke();
    quad(0,461,0,0,521,0,521,190);
    quad(35,442,0,458,0,550,15,550);
    quad(521,0,521,190,1040,442,1040,0);
    triangle(1028, 436,1040,481,1040,441);
    
    //SOL
    fill(255,255,0);
    noStroke();
    ellipse(150,130, 100,100);
   
   
    
   //NUVENS
   if (cn < 1040)
   {
     fill(255,170);
     ellipse(cn+100, 150, 150, 50);
     ellipse(cn+200, 160, 150, 50);
     ellipse(cn+300, 40, 150, 50);
     ellipse(cn+400, 80, 150, 50);
     ellipse(cn-100, 100, 150, 50);
     ellipse(cn-200, 150, 150, 50);
     ellipse(cn-300, 10, 150, 50);
     ellipse(cn-400, 80, 150, 50);
     cn++;
     if (cn >= 1040)
     {
       cn = 0;
     }
   }
   
    
    //HELP
    textSize(32);
    textAlign(LEFT);
    fill(255);
    text("?", 25, 35);
    if (mouseX < 40 && mouseY<40)
    {
      textSize(16);
      fill(255);
      text("Aperte 0 para ver o Water Cube de dia e para trocar a cor da fachada!", 45, 45);
      fill(255);
      text("Aperte 1 para ver o Water Cube de noite e para trocar a cor da fachada!", 45, 60);
      fill(255);
      text("Para personalizar a fachada do prédio clique e arraste o mouse!", 45, 75);
    }
    
    
    //LUZES NA CALÇADA
    int  luzy1= 580;
    for (int luzx1= 9; luzx1 <= 500; luzx1 = luzx1 + 76)
    {
      luzes(luzx1, luzy1);
      luzy1 = luzy1+ 3;
    }  
    int luzy2 = 580;
    for (int luzx2= 1000; luzx2 >= 650; luzx2 = luzx2 - 76)
    {
      luzes(luzx2, luzy2);
      luzy2 = luzy2+ 3;
    } 
       
  }





void noite ()
{
    stroke(1);
    //PAREDES
    fill (parede);
    quad(35,443,521,190,521,550,14,560);
    quad(521,190, 1027,437,1060,560,521,550);
    noFill();
    malhapar();
    
    
    // CALÇADA
    noStroke();
    fill(110);
    quad(1040,573,521,590,521,610,1040,610);
    quad(521,590,521,610,0,610,0,570);
    
    
    //ESTRUTURAS INFERIORES
    stroke(0);
    fill(40);
    quad(521,550,521,590, 8,574,14,557);
    quad(521,550,521,590,1040,572,1040,558);
   
    
    //PORTARIA
    fill(160);
    quad(584,588,579,492,1010,530,1014,573);
    fill(40);
    quad(650,585,644, 520,980,540,983,574);
    

    //CÉU
    fill(0,0,128);
    noStroke();
    quad(0,461,0,0,521,0,521,190);
    quad(35,442,0,458,0,550,15,550);
    quad(521,0,521,190,1040,442,1040,0);
    triangle(1028, 436,1040,481,1040,441);
    
    //LUA
    fill(255);
    noStroke();
    ellipse(150,130,100,100);
    
    //ESTRELAS
    stroke(255);
    strokeWeight(2);
    point(random(1, 1039), random(0, 200));
    point(random(1, 1039), random(0, 200));
    point(random(1, 1039), random(0, 200));
    point(random(1, 1039), random(0, 200));
    point(random(1, 1039), random(0, 200));
      
    
    //HELP
    textSize(32);
    textAlign(LEFT);
    fill(255);
    text("?", 25, 35);
    if (mouseX < 40 && mouseY<40)
    {
      textSize(16);
      fill(255);
      text("Aperte 0 para ver o Water Cube de dia e para trocar a cor da fachada!", 45, 45);
      fill(255);
      text("Aperte 1 para ver o Water Cube de noite e para trocar a cor da fachada!", 45, 60);
      fill(255);
      text("Para personalizar a fachada do prédio clique e arraste o mouse!", 45, 75);
    }
   
 
    stroke(0); 
    strokeWeight(1);  
    //LUZES NA CALÇADA
    int  luzy1= 580;
    for (int luzx1= 9; luzx1 <= 500; luzx1 = luzx1 + 76)
    {
      luzes(luzx1, luzy1);
      luzy1 = luzy1+ 3;
    }  
    int luzy2 = 580;
    for (int luzx2= 1000; luzx2 >= 650; luzx2 = luzx2 - 76)
    {
      luzes(luzx2, luzy2);
      luzy2 = luzy2+ 3;
    }  
}
    
    
    
//FUNÇÃO LUZES
void luzes (int x , int y)
{
  if (dn == '0')
  {
    rectMode(CENTER);
    fill(100);
    rect(x, y-25, 5, 60);
    fill(255);
    rect(x,y -25, 2, 50);
  }
  if (dn == '1')
  {
      rectMode(CENTER);
      fill(70);
      rect(x, y-25, 5, 60);
      fill(20,200,200);
      rect(x,y -25, 2, 50);
  }
}  




//COR DE FACHADA INTERATIVA
void keyReleased()
{
  parede = color(random(255),random(255),random(255));
}



//FUNÇÃO MALHA
void malhapar()
{
    for (int i = 0; i < indice; i++)
  {
    fill(random(255),random(255),random(255), 70);
    ellipse(elipses[i][0], elipses[i][1], elipses[i][2], elipses[i][2]);
  }
}



//FUNÇÃO MOUSEORESSED - ANEXO FUNÇÃO MALHA
void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    pdf = true;
  }
  else
  {
    elipses[indice][0] = mouseX;
    elipses[indice][1] = mouseY;
  }
}


//FUNÇÃO MOUSERELEASED - ANEXO FUNÇÃO MALHA
void mouseReleased()
{
  float d;
  float x,y;
  x = elipses[indice][0];
  y = elipses[indice][1];
  d = sqrt((x-mouseX)*(x-mouseX)+ pow(y-mouseY,2));
  elipses [indice][2] = floor(d);
  indice ++;
}
