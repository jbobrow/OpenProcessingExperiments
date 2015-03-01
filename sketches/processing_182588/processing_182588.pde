
/*questo sketch è ispirato ai colori del quadro 'composizione in rosso, nero, blu, giallo e grigio' di Piet Mondrian.
Nel momento in cui premiamo il da 1 a 6 il programma disegnerà un ellisse seguendo il mouse (1rosso), (2giallo), (3blu), (4bianco), (5grigio).
Mentre se premiamo le lettere r,y,b,w,g il programma disegnerà un numero predefinito di quadrati dei medesimi colori. Inoltre se premiamo i tasti d,a,l,x,o c 
il programma disegnerà una serie di triangoli in rotazione in modo da formare la corolla di un fiore. Infine se premiamo il tasto t ci apparirà a video il
titolo dell'opera.*/

//dichirazione delle variabili
String s; //variabile che conterrà la scritta a video
int i,x, y; //variabili di tipo intero per
void setup () {
  s="GEOMETRIE MULTICOLOR di Laura Saccotelli"; //scritta a video
  x=100; 
  y=100;
  size(1280, 1000); //dimensione della finestra
  background(0); //sfondo nero
  PFont fnt; 
  fnt=createFont("Courier",30); //uso il font courier
  textFont(fnt); //assegno il font alla scritta
}
//funzione disegna per le varie forme geometriche
void draw() {
 x=100;
 y=100;
  if (key=='r'){ //disegno quadrati rossi se premo il tasto r
    for(i=1;i<=20;i=i+1){//implemento un ciclo for per disegnare i 20 quadrati
      x=(x+10); //incremento la x di 10
      y=(y+10);//incremento la y di 10
     fill(255,0,0);//assegno il rosso(valore rgb)per il riempimento
     rect(x,y,200,200);//disegno il quadrato
    } 
   } else if (key=='y') { //disegno quadrati gialli se premo il tasto y
      for(i=1;i<=40;i=i+1){ //implemento il ciclo for per disegnare i 40 quadrati
       x=(x+5);//implemento la x di 5
       y=(y+5);//implemento la y di 5
       fill(255,255,0);//riempimento giallo
       rect(x,y,250,250);//disengno il quadrato
       }
     } else if (key=='w') { //disegno quadrati bianchi se premo il tasto w
     for(i=1;i<=20;i=i+1){ //implemento il ciclo for per disegnare 20 quadrati
       x=(x+10); //implemento la x di 10
       y=(y+60); //implemento la y di 60
       fill(255,255,255);//riempimento bianco
       rect(x,y,100,100);//disegno il rettangolo
     }
  } else if (key=='g') { //disegno quadrati grigi se premo il tasto g
     for(i=1;i<=80;i=i+1){ //implemento il ciclo for per disegnare 80 quadrati
       x=(x+100); //implemento la x di 100
       y=(y+10); //implemento la y di 10
       fill(128,128,128); //riempimento grigio
       rect(x,y,50,50); //disegno il rettangolo
      }
    } else if (key=='b') { //disegno quadrati blu se premo il tasto b
       for(i=1;i<=100;i=i+1){ //implemento il ciclo for per disegnare 100 quadrati
         x=(x+40);// implemento la x di 40
         y=(y+10);//implemento la y di 10
         fill(0,0,255);//riempimento blu
         rect(x,y,10,10); //disegno il quadrato
       }
      } else if (key=='s') { //cancella lo schermo
         background(255);//assegno il bianco come colore di sfondo
      } if (key=='t'){ //mostro a video il titolo dell'opera se premo il tasto t
         background(0);//sfondo nero
         text(s,x,y);//disegno il testo
      } if (key=='1'){ //disegno un ellisse rosso se premo il tasto 1
          fill(255,0,0);//riempiento rosso
          ellipse(mouseX,mouseY,100,100);//disegno l'ellisse
         } else if (key=='2') { //disegno un ellisse giallo se premo il tasto 2
            fill(255,255,0);//riempimento giallo
            ellipse(mouseX,mouseY,150,150);
         } else if (key=='3') { //disegno un ellisse blu se premo il tasto 3
             fill(0,0,255);
             ellipse(mouseX,mouseY,200,200); 
         } else if (key=='4') { //disegno un ellisse bianco se premo il tasto 4
            fill(255,255,255);
             ellipse(mouseX,mouseY,80,80);
         } else if (key=='5') { //disegno un ellisse grigio se premo il tasto 5
             fill(128,128,128);
             ellipse(mouseX,mouseY,250,250);
         }else if (key=='6') { //disegno un ellisse nero se premo il tasto 6
            background(255);
            fill(0,0,0);
            ellipse(mouseX,mouseY,500,500);
         } else if (key=='l'){ //disegna un tringolo che ruota di colore blu premendo il tasto l
             translate(width*0.40, height*0.10);//serve a translare la figura
             rotate(frameCount / -60.0);//rotazione della figura
             fill(0,0,255);
             quad(500,500,100,250,130,300,300,30);
          } else if (key=='c'){ //disegna un tringolo che ruota di colore grigio premendo il tasto a
              translate(width*0.20, height*0.10);
              rotate(frameCount / -100.0);
              fill(128,128,128);//riempimento grigio
              quad(300,300,80,200,150,60,60,50);
          }else if (key=='a'){ //disegna un tringolo che ruota di colore giallo premendo il tasto a
            translate(width*0.40, height*0.10);
            rotate(frameCount / -80.0);
            fill(255,255,0);//riempimento giallo
            quad(300,300,150,125,130,150,150,15);
          } else if (key=='d'){ //disegna un tringolo che ruota di colore rosso premendo il tasto d
             translate(width*0.1, height*0.10);
              rotate(frameCount / -30.0);
              fill(255,0,0);//riempimento rosso
              quad(100,100,200,300,130,30,30,30);
          }else if (key=='x'){ //disegna un tringolo che ruota di colore bianco premendo il tasto x
            translate(width*0.10, height*0.10);
            rotate(frameCount / -5.0);
            fill(255,255,255);
            quad(40,40,80,10,130,30,30,30);
          }
}

