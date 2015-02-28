
size (810,480); 
background (218,227,224); 

noStroke ();
fill (109,183,123);
quad (0,350,850,350,850,530,0,530); // gramado

noStroke (); 
fill (255,255,255);
quad (390,140,390,195,310,195,183,140); // teto interno
quad (390,140,390,175,620,175,620,140); // teto interno

fill (255,255,255);
quad (176,400,290,350,390,350,390,400); // chão interno
quad (390,400,390,374,620,374,620,400); // continuação do chão interno

stroke (0,0,0);

fill (206,201,189);
quad (206,410,350,410,270,440,120,440); // bloco que leva a porta de entrada
quad (100,460,0,490,190,490,260,460); // bloco que leva a porta de entrada

fill (67,158,175);
quad (232,368,0,368,0,460,10,460); // pscina

fill (206,177,104);
rect (620,140,120,280); // parede marrom externa

fill (206,201,189);
rect (30, 120, 770, 20); // parte do telhado vista de frente
rect (30, 115, 770,5); // parte do telhado vista de frente

fill (255,255,255);
triangle (130,140,31,140,130,174); // beiral à esquerda
quad (141,140,141,178,176,190,176,155); // continuação do beiral à esquerda

fill (255,255,255);
quad (290,350,390,350,390,195,290,195); // parede branca ao fundo

fill (211,176,98);
rect (390,175,230,199); // parede marrom interna

noFill();
quad (176,155,176,400,290,350,290,206); // parede lateral (à esquerda) em vidro

fill (108,55,4); 
quad (141,120,141,140,310,215,310,195); // viga marrom
quad (141,140,141,145,307,217,310,215); // continuação viga marrom

fill (155,160,144);
quad (176,155,176,400,206,387,206,169); // primeira coluna interna cinza
line (181,158,181,397); // dermarca a lateral da primeira coluna interna cinza

fill (155,160,144);
quad (236,183,236,373,264,362,264,194); // segunda coluna interna cinza
line (241,185,241,371); // demarca a lateral da segunda coluna interna cinza

fill (217,219,212,120);
rect (176,155,444,245); // porta frontal em vidro

fill (155,160,144);
rect (420,155,5,245); // divisória da porta frontal em vidro

fill (108,55,4); 
rect (130,120,11,300); // primeiro pilar à esquerda
quad (141,140,145,142,145,417,141,420); // lateral do primeiro pilar à esquerda
