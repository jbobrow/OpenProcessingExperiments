
//Gemma Mier Cervantes
//Pràctica nº3 - Moviment (random walker + canvi de color de fons)
//La tortuga de l'anterior pràctica està en mode random walker
//Segons ón es es seleccioni amb el mouse en el fons, hi ha un canvi de color


//Declaració de les variables posX, posY i colorback 
int posX, posY;
color colorback; //per el canvi de color de fons


//Inicialització del programa, es donen els valors de les entitats i variables definides
void setup(){
  size(700,700);
  background(60,195,206);
  
  posX = 0;
  posY = 0;
  colorback = 0;
}


void draw(){
  if (mousePressed){background(247,155,246);}
    else {background(60,195,206); 
  }
    
    //Es determinen els máxims i mínims del recorregut del random walker per què el dibuix no surti dels límits (aprox)
  if ((posX<50) || (posX>width-50)) {
    posX = width/2;
  }
  if ((posY<70) || (posY>height-60)) {
    posY = height/2;
  }
   
      
  background(colorback); //el fons canviarà de color cada cop que s'activi la variable colorback apretant el mouse
  posX = int(random(0, width-100)); //posició inicial en X
  posY = int(random(0, height-100)); //posició inicial en Y
  dibuixarTortuga(posX, posY);
  

  }

void mousePressed(){
  colorback = color(mouseX, mouseY,mouseX); //es determinen els colors del fons de la pantalla segons com es mogui el cursor
  
}


// La funció creada "dibuixarTortuga" és una variable "meva" per no haver de posar-ho tot al void draw
void dibuixarTortuga(int _x, int _y)
{
  
noStroke();

  //mans//
  fill(13,113,18);
  ellipse(_x-45,_y-45,30,30);
  ellipse(_x-45,_y+45,30,30);
  ellipse(_x+45,_y-45,30,30);
  ellipse(_x+45,_y+45,30,30);
  ellipse(_x,_y-55,50,50);
  triangle(_x,_y+70,_x-5,_y+50,_x+5,_y-50);
  
  //ulls//
  fill(0);
  ellipse(_x-20,_y-70,5,5);
  ellipse(_x+20,_y-70,5,5);
  
  //carcassa//
  stroke(255);
  strokeWeight(10);
  fill(200,_y,_x);
  ellipse(_x,_y,100,100);
  
  // --línies carcassa
  strokeWeight(0.1);
  stroke(0);
  line(_x-10,_y-15,_x+10,_y-15);
  line(_x-10,_y-15,_x-20,_y);
  line(_x-20,_y,_x-10,_y+15);
  line(_x-10,_y+15,_x+10,_y+15);
  line(_x+10,_y+15,_x+20,_y);
  line(_x+20,_y,_x+10,_y-15);
  line(_x+10,_y-15,_x+17,_y-30);
  line(_x+17,_y-30,_x+33,_y-30);
  line(_x+20,_y,_x+35,_y);
  line(_x+35,_y,_x+42,_y-12);
  line(_x+10,_y+15,_x+20,_y+30);
  line(_x+20,_y+30,_x+10,_y+42);
  line(_x-10,_y+15,_x-20,_y+30);
  line(_x-20,_y+30,_x-10,_y+42);
  line(_x-10,_y+42,_x+10,_y+42);
  line(_x-10,_y-42,_x+10,_y-42);
  line(_x+10,_y-42,_x+17,_y-30);
  line(_x-10,_y-42,_x-18,_y-30);
  line(_x-18,_y-30,_x-10,_y-15);
  line(_x-18,_y-30,_x-34,_y-30);
  line(_x-20,_y,_x-35,_y);
  line(_x-35,_y,_x-42,_y-12);
  line(_x-43,_y+15,_x-35,_y);
  line(_x-20,_y+30,_x-34,_y+30);
  line(_x+20,_y+30,_x+34,_y+30);
  line(_x+35,_y,_x+43,_y+9);

  
}


