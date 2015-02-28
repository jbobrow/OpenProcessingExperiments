
size (600, 600); // este comando define a janela
background (0);  // defenir cor fundo
smooth(); // define o render de graficos com anti-alissing

// enunciar variaveis de posiçao da flor vermelha
float x1;
float x2;
float y1;
float y2;

/// variavel para criar espaçamento
int step;

// atribuir valores as variaveis
//margens do dseho 
x1 = 70;
x2 = width-70;

y1 = 70;
y2 = height-70;

step = 3;//numero de repetiçoes





      
      
            
     
// calculto do Interpolante

float stepSize = 10.0/ step;
for ( float tx = 0; tx<= 10;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          
 

      noStroke();//sem preenchimento
       fill(255,0,0,50);//preenchimento de cor vermelha e alpha de 50
       
       
       
       //desenho das varias ellipse que contituem a flor
          ellipse ( x,y, 10,10);
          
          ellipse(x+25, y,   50,50);
          ellipse(x,    y+25,50,50);   
          ellipse(x-25, y,   50,50);   
          ellipse(x,    y-25,50,50);



          ellipse(x+25, y,   100,100);
          ellipse(x,    y+25,100,100);   
          ellipse(x-25, y,   100,100);   
          ellipse(x,    y-25,100,100); 
        
          

          
      }
}


