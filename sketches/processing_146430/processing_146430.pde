
/* Autor:Ruy Samuel Hinsching;  data da criação:27/04/2014
Esta representação da Música "Pela Internet" de Gilberto Gil 
transmite os principais versos de forma gráfica, com base 
em trechos da musica que podem ser visualizados tal qual;
disquete, home-Page, uma jangada de gigabytes, hot-link, Gabão, 
velejar sobre o mar de informação ao qual possui códigos 
binários que significam trechos da música(vide código).
O código foi criado com o intuito de ser proporcional ao 
tamanho da janela definido no inicio do código (size) então 
se mudar o tamanho da janela a imagem gerada pelo código 
continuará proporcional*/
size (800,800);
background(255);
    // Declaração da Váriavel em razão da largura da tela
int espessura_linha = width/50;
    // Disquete
fill(0);
rect(0,0,width,height,20);
fill(255);
triangle(0,0,0,(height/40)*1.5,(width/40)*1.5,0);
triangle((width/40)*11,0,(width/40)*14,0,(width/40)*14,(height/40)*2);
quad((width/40)*27,0,(width/40)*27,(height/40)*1.2,(width/40)*33,(height/40)*1.2,(width/40)*34,0);
fill(140,140,140);
rect((width/40)*13,0,(width/40)*15,(height/40)*5,10);
fill(0);
rect((width/40)*15,(height/40)*1,(width/40)*2,(height/40)*3,5);
rect((width/40)*25,(height/40)*1,(width/40)*2,(height/40)*1,7);
fill(255);
rect((width/40)*1,(height/40)*22,(width/40)*2,(height/40)*1.5);
rect((width/40)*37,(height/40)*22,(width/40)*2,(height/40)*1);
    //Céu sob o mar de Informação
noStroke();
fill(220,220,255);
rect(0,(height/20)*13,width,(height/20)*10);
fill(255);
    // Sol
fill(255,255,0);
ellipse((width/40)*33,(height/40)*29,(width/40)*5,(height/40)*5);
    // Nuvens do céu
      //nuvem 1
fill(255);
ellipse((width/40)*4,(height/40)*29,width/20,height/20);
ellipse((width/40)*6,(height/40)*29,(width/20)*2,(height/20)*2);
ellipse((width/40)*8,(height/40)*29,width/20,height/20);
      //nuvem 2
ellipse((width/40)*34,(height/40)*29,width/20,height/20);
ellipse((width/40)*36,(height/40)*29,(width/20)*2,(height/20)*2);
ellipse((width/40)*38,(height/40)*29,width/20,height/20);
      //nuvem 3
ellipse((width/40)*24,(height/40)*29,(width/20)+3,(height/20));
ellipse((width/40)*26,(height/40)*29,(width/40)*5,(height/40)*3);
ellipse((width/40)*28,(height/40)*29,(width/20)+3,(height/20));
    //Home-page
stroke(200);
strokeWeight(espessura_linha);
fill(255,255,255);
rect(width/10,height/10,(width/20)*16,(height/20)*10,5,5,0,0);
fill(0,0,255);
textSize(espessura_linha);
text("Home-page",(width/40)*18,(height/80)*9);
      //Hot-link
textSize(espessura_linha*2);
text("hot-link",(width/40)*8,(height/80)*15);
stroke(0,0,255);
strokeWeight(espessura_linha/3);
line((width/40)*7,(height/80)*16,(width/40)*15,(height/80)*16);
      //Bandeira do Gabão
noStroke();
fill(0,200,0);
rect((width/40)*8,(height/40)*10,(width/40)*14,(height/40)*3);
fill(200,200,0);
rect((width/40)*8,(height/40)*13,(width/40)*14,(height/40)*3);
fill(0,0,200);
rect((width/40)*8,(height/40)*16,(width/40)*14,(height/40)*3);
fill(0);
text("Gabão",(width/40)*12,(height/40)*21);
      //Foto do Perfil
fill(200,200,255);
rect((width/40)*25,(height/40)*6,(width/40)*8,(height/40)*10);
fill(255);
ellipse((width/40)*29,(height/40)*10,(width/40)*4,(height/40)*5);
ellipse((width/40)*29,(height/40)*16,(width/40)*4,(height/40)*8);
    //Mar de Informação
fill(0,0,255);
rect(0,(height/40)*35,width,height);
    // Texto em binário significa, respectivamente: Informaré,informação,lares do nepal ,oriki ao orixá, juntar via internet.
fill(255);
    //informaré
textSize(espessura_linha);
text("01101001 01101110 01100110 01101111 01110010 01101101 01100001 01110010 11101001",1,height);
textSize(espessura_linha-2);
    //informação
text("01101001 01101110 01100110 01101111 01110010 01101101 01100001 11100111 11100011 01101111 ",1,(height/40)*39);
textSize(espessura_linha-4);
    //lares do nepal
text("01101100 01100001 01110010 01100101 01110011 00100000 01100100 01101111 00100000 01101110 01100101 01110000 01100001 01101100",1,(height/40)*38);
textSize(espessura_linha-6);
    //oriki ao orixá
text("01101111 01110010 01101001 01101011 01101001 00100000 01100001 01101111 00100000 01101111 01110010 01101001 01111000 11100001 ",1,(height/40)*37);
textSize(espessura_linha-9);
    //juntar via internet
text("01101010 01110101 01101110 01110100 01100001 01110010 00100000 01110110 01101001 01100001 00100000 01101001 01101110 01110100 01100101 01110010 01101110 01100101 01110100",1,(height/40)*36);
    // jangada
fill(90,50,0);
rect((width/40)*9,(height/40)*33,(width/40)*6,(height/40)*3);
triangle((width/40)*9,(height/40)*33,(width/40)*6,(height/40)*33,(width/40)*9,(height/40)*36);
triangle((width/40)*15,(height/40)*33,(width/40)*18,(height/40)*33,(width/40)*15,(height/40)*36);
    // Mastro da Jangada
fill(150,75,50);
rect((width/40)*14,(height/40)*28,(width/100),(height/40)*5);
    // Vela da jangada
fill(150);
triangle((width/40)*14,(height/40)*28,(width/40)*10,(height/40)*32,(width/40)*14,(height/40)*32);
    // Texto da jangada
fill(0);
textSize(espessura_linha+5);
text("GigaBytes",(width/40)*9,(height/40)*33);

