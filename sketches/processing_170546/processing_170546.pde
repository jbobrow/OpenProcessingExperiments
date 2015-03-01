
void setup(){
size(500,500);
background(0);
}
 
void draw(){
  println("eje x "+mouseX+" eje y "+mouseY);
  
 background(190);
fill (255);// blanco 
rect (0,0, 500,180); //Puerta 
fill (0);// blanco
line (30,500, 190,235); // calle izq
line (470,500, 310,235); // calle der
line (1,235, 190,235); // cruce izq
line (500,235, 310,235); // cruce der
line (1,180, 500,180); // linea fondo
line (110,1, 110,180); // edificios
line (390,1, 390,180); // edificios
fill (220,140,100);
rect (220,20, 60,160); //Puerta
fill (0); // negro
ellipse (275, 120, 5,5); //pomo
ellipse (250, 80, 2,2); //mirilla
fill (220,140,100);
rect (130,70, 60,60); //ventana
rect (310,70, 60,60); //ventana

fill (130); //gris
ellipse (130, 265, 40,30); // palo
ellipse (130, 260, 39,30); // palo
ellipse (130, 255, 38,30); // palo
ellipse (130, 250, 37,30); // palo
ellipse (130, 245, 36,30); // palo
ellipse (130, 240, 35,30); // palo
ellipse (130, 235, 34,30); // palo
ellipse (130, 230, 33,30); // palo


ellipse (370, 265, 40,30); // palo
ellipse (370, 260, 39,30); // palo
ellipse (370, 255, 38,30); // palo
ellipse (370, 250, 37,30); // palo
ellipse (370, 245, 36,30); // palo
ellipse (370, 240, 35,30); // palo
ellipse (370, 235, 34,30); // palo
ellipse (370, 230, 33,30); // palo
ellipse (370, 225, 33,30); // palo
ellipse (370, 220, 33,30); // palo
ellipse (370, 215, 33,30); // palo
ellipse (370, 210, 34,30); // palo
ellipse (370, 205, 35,30); // palo
ellipse (370, 200, 37,30); // palo
ellipse (370, 195, 39,30); // palo
ellipse (370, 190, 40,30); // palo
fill (0); // negro

fill (160); //gris 
ellipse (mouseX , mouseY +153, 120 , mouseY /3); // sombra 1
fill (0); // negro

println("eje x "+mouseX+" eje y "+mouseY);

fill (#52B73F);
rect (mouseX-10,mouseY+30, 20,80);//Cuerpo
fill (255);


fill (255);// blanco
ellipse (mouseX, mouseY, 120,70);// Cabeza
//image = loadImage("cabezatransparente.png");

//image(cabezatransparente.png)
//image(image, mouseX, mouseY, mouseX, mouseY)

//image (mouseX, mouseY, 120,70);
line (mouseX-30,mouseY-50, mouseX-10,mouseY-30); //1antena izq
line (mouseX+30,mouseY-50, mouseX+10,mouseY-30); //1antena derecha
line (mouseX-30,mouseY-50, mouseX-54,mouseY-40); //2antena izq
line (mouseX+30,mouseY-50, mouseX+55,mouseY-30); //2antena derecha
fill (0);
ellipse (mouseX-54,mouseY-40, 4,4); //3 antena izq
ellipse (mouseX+54,mouseY-30, 4,4); //3 antena izq

line (mouseX-15,mouseY-25, mouseX-5,mouseY-18); //ceja izquierda
line (mouseX+15,mouseY-25, mouseX+5,mouseY-18); //ceja derecha
line (mouseX-5,mouseY+25, mouseX+5,mouseY+30); //boca
ellipse (mouseX , mouseY +15, 3,5); //nariz


fill (0); // negro
ellipse (mouseX-20,mouseY, 22,38); //ojo izquierdo
ellipse (mouseX+20,mouseY, 22,38); //ojo derecho

fill (255); // blanco
ellipse (mouseX-20,mouseY, 22,mouseY /25); //ojo izquierdo
ellipse (mouseX+20,mouseY, 22,mouseY /25); //ojo derecho
fill (0); // negro
line (mouseX-10,mouseY+40, mouseX-20,mouseY+70); // 1 brazo izq
line (mouseX-40,mouseY+50, mouseX-20,mouseY+70); // 2 brazo izq
fill (#E82A2A);
ellipse (mouseX-30,mouseY+40, 18,20); // manzana
fill (#FFFFB9);
ellipse (mouseX-25,mouseY+35, 9,7); // manzana
fill (0); // negro
ellipse (mouseX-40,mouseY+45, 10,15);//bola mano
ellipse (mouseX-40,mouseY+40, 2,6); //mechero
ellipse (mouseX-35,mouseY+40, 2,6); //dedo activador
line (mouseX+10,mouseY+40, mouseX+20,mouseY+70); // 1 brazo derecho
line (mouseX+20,mouseY+70, mouseX+10,mouseY+105); // 2 brazo derecho
fill (200,100,200); // verde
//ellipse (mouseX-40,mouseY+35, 3,5); //fuego

fill (0); // negro


line (mouseX-20,mouseY+150, mouseX-10,mouseY+110); // pata izquierda
line (mouseX+20,mouseY+150, mouseX+10,mouseY+110); // pata izquierda

fill (255); // blanco
ellipse (mouseX -22, mouseY +153, 35,15); // suela zapato izquierdo
ellipse (mouseX +22, mouseY +153, 35,15); //suela zapato derecho
fill (0); // negro
ellipse (mouseX -22, mouseY +150, 35,15); //zapato izquierdo
ellipse (mouseX +22, mouseY +150, 35,15); //zapato derecho

fill (130); //gris

ellipse (130, 225, 33,30); // palo
ellipse (130, 220, 33,30); // palo
ellipse (130, 215, 33,30); // palo
ellipse (130, 210, 34,30); // palo
ellipse (130, 205, 35,30); // palo
ellipse (130, 200, 37,30); // palo
ellipse (130, 195, 39,30); // palo
ellipse (130, 190, 40,30); // palo


ellipse (370, 225, 33,30); // palo
ellipse (370, 220, 33,30); // palo
ellipse (370, 215, 33,30); // palo
ellipse (370, 210, 34,30); // palo
ellipse (370, 205, 35,30); // palo
ellipse (370, 200, 37,30); // palo
ellipse (370, 195, 39,30); // palo
ellipse (370, 190, 40,30); // palo


fill (#9B9B9B);
ellipse (35, 300, 190,90); // bola arbol
fill (#2E8B00);
ellipse (30, 290, 170,80); // bola arbol

fill (#C15B0C);
rect (20, 70, 40,210); // tronco arbol
fill (#3EAA1B);
ellipse (70, 10, 250,200); // bola arbol
fill (#389819);
ellipse (100, 125, 80,50); // bola arbol

fill (#3EAA1B);
ellipse (70, 130, 100,50); // bola arbol

fill (#E82A2A);
ellipse (20, 5, 20,20); // bola arbol
ellipse (140, 10, 30,30); // bola arbol
ellipse (20, 50, 20,20); // bola arbol
ellipse (80, 30, 25,25); // bola arbol
ellipse (110, 70, 18,20); // bola arbol


if (mouseY >= height ){
   background(250 /1);
    
    }
fill (0); // negro

 
}



