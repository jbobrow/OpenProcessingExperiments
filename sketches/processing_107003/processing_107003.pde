
//variaveis globais
  //PImage webImg;//variavel utilizada para colocar imagem de fundo 
  int move_nave;//variavel para deslocamento horizontal
  int valor_tiro=350;
  int totalPts = 300;
  float steps = totalPts + 1;
  

void setup()
{
     size(400,400);
     frameRate(4);
     //String url = "http://hypescience.com/wp-content/uploads/2012/07/nebulosa-tulipa-600x565.jpg"; // Load image from a web server
     //webImg = loadImage(url, "jpg");/carrega a imagem e no formato defnido
 }
 void draw()
 {
    //carrega a imagem varias vezes para que nao se imprima nada sobre o background   
    //image(webImg, 0, 0 ,400 ,400);
       //fundo escuro
       background(0);
       // recebe  numeros aleatorios para definir a posição das estrelas
         float rand = 0; 
         for (int i = 1; i < steps; i++)// cria as elipses que representão as estrelas
         {
           stroke(5,57,255);//cor do contono da ellipse e do point
           //cria a ellipse em uma posição randômica
           ellipse((width/steps) * i, (height/2) + random(-rand, rand), 5 ,5 );
           point( (width/steps) * i, (height/2) + random(-rand, rand) );
           rand += random(-250, 250);
         }
     //cor da nave
     fill(141 , 141 ,141);
     //retangulo da nave
     rect(move_nave,370, 40, 50);
     //tamanho do texto da nave 
     textSize(8);
     //cor do texto
     fill(0);
     //texto escrito sobre a nave 
     text("Millenium", move_nave+2, 377);
     text("Falcon", move_nave+6, 385);
     // cor da estrela da morte
     fill(94,95,93);
     //desenha a estrela da morte
     arc(200, 50, 80, 80, 0, PI+PI);
     line(167 , 70 , 240 , 50);
     fill(165,165,165);
     ellipse(183 , 43 , 15 ,15);
    
 }
 //condição quando o mouse for clicado
 void mouseClicked()
 {
     //cria o tiro da nave
     while( valor_tiro > 0)
     {
       //cor do tiro
       fill(255,0,0);
       //imagem do tiro
       ellipse( move_nave+20,  valor_tiro+15 , 10 , 10);
        valor_tiro -=1;
         //condição para quando a estrela da morrte for acertada pelo tiro
         if(valor_tiro == 50 && move_nave >= 125 && move_nave <= 225)
         {
           background(0);
           textSize(32);
           fill(255,255,0);
           text("GAME OVER", 100, 250);
           noLoop();//para o loop do void draw
         }
     }
   valor_tiro=350;
 }
 void keyPressed()
 {
   if (key == CODED)
   {
     if (keyCode == RIGHT)//movimenta a nave para a direita com a seta " -> "
     {
       move_nave += 3;//o valor do deslocamento
     }
     if (keyCode == LEFT)//movimenta a nave para a esquerda com a seta " <- "
     {
       move_nave -= 3;//o valor do deslocamento
     } 
   }
   else if(keyPressed){
     if (key == 'r' || key == 'R')//começa de novo
      {
        loop();//retorna o loop do void draw
      }
    }
 }
