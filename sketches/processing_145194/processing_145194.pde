
//POSICIÓN Y VELOCIDAD COORDENADAS
int posx, posy, velx, vely;

void setup() {//width és 590 i height és 380)
 //no se ve el cursor
 noCursor();
 //TÍTULO DEL TRABAJO Y DESCRIPCIÓN
 println("HOMER _ MOVEMENT");
 println("ALBERTO DE LAS HERAS - 2GEDI - 03 Elisava");
 //TAMAÑO DE LA PANTALLA
 size(700,700);




 posx=width/2; //homer simpson moviendose por la pantalla, defino las varibales de velocidad y posición
 velx=2;
 vely=2;
 posy=height/2;
}

void draw() {
  
  //DEFINO EL COLOR DE FONDO
  background(255);
 
 //POSICIÓN DE LA FIGURA DEPENDIENDO DE LA VELOCIDAD
 posx=posx+velx;
 posy=posy+vely;


//FIGURA QUE SE VA A MOVER Y REBOTAR
//Orejas Homer
stroke(255);
fill(255,217,15);
ellipse(posx-84,posy+40,30,30);
ellipse(posx+84,posy+40,30,30);

//Cara Homer 
fill(255,217,15);
rectMode(CENTER);
fill(255,217,15);
rect(posx,posy,156,180);
//Pelitos +Calva
fill(0);
arc(posx,posy-130,60,60,3.13,TWO_PI,OPEN);
fill(255);
arc(posx,posy-130,58,58,3.13,TWO_PI,OPEN);
fill(255,217,15);
arc(posx,posy-78,156,120,3.13,TWO_PI,OPEN);
//Barba Homer
stroke(0);
fill(209,178,112);
ellipseMode(CENTER);
ellipse(posx,posy+90,156,100);
//Nariz Homer
noFill();
arc(posx,posy+10,26,26, 0, PI, OPEN);
//Ojos Homer
fill(255);
ellipseMode(CENTER);
ellipse(posx-44,posy-20,80,80);
ellipseMode(CENTER);
ellipse(posx+44,posy-20,80,80);
//Pupilas Homer
fill(0);
ellipse(posx-64,posy-20,20,20);
ellipse(posx+26,posy-20,20,20);
//Boca Homer
stroke(0);
fill(0);
ellipse(posx-44,posy+80,20,20);


//LÍMITES DE LA PANTALLA
//EJE X
 
  if ((posx > width-width/4)||(posx < width/4)) {velx=-velx;}
//EJE Y  
  if(posy > height-((2*height)/9)||(posy < 0+(2*height)/9)) {vely=-vely;}
  
}
void mousePressed(){// cuando presiono maouse la figura vuelve al centro y cambian de color distintas partes
  
  
  //HOMER VUELVE AL CENTRO
  posx=width/2;
  posy=height/2;
  
 

  
  //HOMER COLOR DE OJOS CAMBIA (guiri)
  fill(134,216,178);
  ellipse(posx-64,posy-20,20,20);
  ellipse(posx+26,posy-20,20,20);
  
  //COLOR DE PIEL CAMBIADO (gamba)
  //Orejas Homer
  stroke(255);
  fill(255,84,91);
  ellipse(posx-84,posy+40,30,30);
  ellipse(posx+84,posy+40,30,30);
  //Cara Homer 
  fill(255,84,91);
  rectMode(CENTER);
  fill(255,84,91);
  rect(posx,posy,156,180);
  //Pelitos +Calva
  fill(0);
  arc(posx,posy-130,60,60,3.13,TWO_PI,OPEN);
  fill(255);
  arc(posx,posy-130,58,58,3.13,TWO_PI,OPEN);
  fill(255,84,91);
  arc(posx,posy-78,156,120,3.13,TWO_PI,OPEN);
 
  //BARBA DE HOMER DE DIFERENTE COLOR (viejete)
  stroke(0);
  fill(222,211,126);
  ellipseMode(CENTER);
  ellipse(posx,posy+90,156,100);

}









