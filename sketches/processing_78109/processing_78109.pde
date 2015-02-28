
//Taular de dibuix creat per Luis Romero Ballesta
//alumne de 1ºASIX, de Programació amb Isaac Muro
int tamany = 15;
int tamanyx = 20;

   void setup (){
    size (600,600);
    background (#D400FF);
    noSmooth ();
    noStroke();
   }
   
   void draw (){
     //Instruccions d'us del Tauler de Dibuix
     fill (10,10,10);
     text ("Per veure les instruccions, presiona - i o I - ", 175,130,360,200); 
     //Tauler de Dibuix
     strokeWeight (1);
     stroke (int(random(255)),int(random(255)), int(random(255)));
     fill  (255,0,0);
     ellipse (550-mouseX,550-mouseY,tamanyx,25);
     fill (#0006FF);
     ellipse (600-mouseX, 600-mouseY, tamanyx, tamany);     
     if (mousePressed){          
          fill (#00FF0E);
          rect( 123,123,tamanyx,tamany);
          strokeWeight (1);
          stroke(int(random(255)),int(random(255)), int(random(255)));
          fill  (10,mouseX,mouseY);
          ellipse (500-mouseX,500-mouseY,25,tamany);
          fill (255,mouseX,mouseY);
          ellipse (600-mouseX, 600-mouseY, tamanyx, tamany);  
          //triangulo amarillo
          stroke(10,10,10);
          strokeWeight (3);
          fill(#FAFF00);          
          triangle(0,300,0,0,300,0);
          //relleno amarillo
          stroke (10,10,10);
          strokeWeight (3);
          fill (#1000FF);
          triangle(148,150,0,149,149,0);
          //triangulo naranja
          fill(#FF7C00);
          triangle(300,600,0,300,0,600);
          //relleno naranja
          fill(#2DFA39);
          triangle(0,450,143,445,150,600);
          //tringulo verde
          fill(#00FF0E);          
          triangle(600,300,600,600,300,600);
          //relleno verde
          fill(#F6FF00);          
          ellipse(600,600,250,250);
          //triangulo azul
          fill(#00DBFF);
          triangle(600,300,300,0,600,0); 
          //relleno azul
          fill (#FF0000);
          rect (450,0,200,150);
       } 
   
         if (mouseX <600){
             cursor (CROSS);
           }    
   }  

void keyPressed (){
  if (key == 'l'){
    stroke (10,10,10);
    strokeWeight (3);
    fill(#FAFF00);
    triangle(0,300,0,0,300,0);
    fill(#FF7C00);
    triangle(300,600,0,300,0,600);          
    fill(#98FF00);
    triangle(600,300,600,600,300,600);
    fill(#00DBFF);
    triangle(600,300,300,0,600,0); }
  if (key == 'r'){
   //triangulo amarillo
          stroke(10,10,10);
          strokeWeight (3);
          fill(#FAFF00);          
          triangle(0,300,0,0,300,0);
          //relleno amarillo
          stroke (10,10,10);
          strokeWeight (3);
          fill (#1000FF);
          triangle(148,150,0,149,149,0);
          //triangulo naranja
          fill(#FF7C00);
          triangle(300,600,0,300,0,600);
          //relleno naranja
          fill(#2DFA39);
          triangle(0,450,143,445,150,600);
          //tringulo verde
          fill(#00FF0E);          
          triangle(600,300,600,600,300,600);
          //relleno verde
          fill(#F6FF00);          
          ellipse(600,600,250,250);
          //triangulo azul
          fill(#00DBFF);
          triangle(600,300,300,0,600,0); 
          //relleno azul
          fill (#FF0000);
          rect (450,0,200,150);
  }
  if (key == 'd'){
          background (#D400FF);
  }
  if (key =='i'||key =='I'){
         stroke (10,10,10);
         strokeWeight (2);
         fill (10,10,10);
         text ("Primera instrucció: Si presionem -l- es formaran quatre triangle a les cantonades del Tauler, un de cada color. Segona Instrucció:Si presionem -r-, veurem els triangles de colors cadascun a una cantonada i, a més, dintre de cada triangle es posarà una figura d'un color diferent a cada triangle. Tercera instrucció: Si presionem -d-, s'esborrarà tot el tauler i, tornarà a esta buit sense res dibuixat. Quarta instrucció: Si presionem el ratolí, es faran l'instrucció 1 i 2 a la vegada, i si el deixem de presionar tornarà a estar el Tauler com aban de fer qualsevol dibuix. En Premer el ratolí el dibuix no entrarà dins dels triangles, pero si prenem -l- o -r- si entrarà dins.",155,165,360,200);
   }else{
     if (key=='x'){
          noStroke();
          noFill();
          background (#D400FF);
       //triangulo amarillo
          stroke(10,10,10);
          strokeWeight (3);
          fill(#FAFF00);          
          triangle(0,300,0,0,300,0);
          //relleno amarillo
          stroke (10,10,10);
          strokeWeight (3);
          fill (#1000FF);
          triangle(148,150,0,149,149,0);
          //triangulo naranja
          fill(#FF7C00);
          triangle(300,600,0,300,0,600);
          //relleno naranja
          fill(#2DFA39);
          triangle(0,450,143,445,150,600);
          //tringulo verde
          fill(#00FF0E);          
          triangle(600,300,600,600,300,600);
          //relleno verde
          fill(#F6FF00);          
          ellipse(600,600,250,250);
          //triangulo azul
          fill(#00DBFF);
          triangle(600,300,300,0,600,0); 
          //relleno azul
          fill (#FF0000);
          rect (450,0,200,150);
     }
   }
}

void mouseReleased (){
   background (#D400FF);
  
}





 



