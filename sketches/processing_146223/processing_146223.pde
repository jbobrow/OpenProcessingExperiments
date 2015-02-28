
//Creacion matriz walker
Walker[] Homerwkrs = new Walker[12];


//POSICIÓN Y VELOCIDAD COORDENADAS
int posxx, posyy;

void setup() {//width és 590 i height és 380)
 //no se ve el cursor
 noCursor();
 //TÍTULO DEL TRABAJO Y DESCRIPCIÓN
 println("HOMER _ MOVEMENT");
 println("ALBERTO DE LAS HERAS - 2GEDI - 03 Elisava");
 //TAMAÑO DE LA PANTALLA
 size(700,700);


 //movimiento walker mediante el condicional for
  for (int i=0; i<Homerwkrs.length;i++) {
    Homerwkrs[i] = new Walker(2,posxx,posyy);

}
}

void draw() {
  
  //DEFINO EL COLOR DE FONDO
  background(255);
 //ejecución del walker
 for (int i=0; i<Homerwkrs.length;i++) {
    Homerwkrs[i].run();
  }
}
class Walker {
  //movimiento (variables que lo definen)
  int mystep,myszx,myszy;
  float posx, posy;
  //variables para definir posicion tamaño y medidas
  Walker (int _st, int _szx, int _szy) {
    mystep= _st;
    myszx= _szx;
    myszy= _szy;
    posx= width/2;
    posy= height/2;
  }
  
  void run () {
    updatePosition ();
    drawMe ();
  }
  // posición aleotoria para cada walker
  void updatePosition (){
    float randX=random(100);
    float randY=random(100);
  
    //establecemos limites para que no se salga de la pantalla
    if(randX >=50){
      posx += mystep;
    } 
    else {
      posx -= mystep;
    }
    if (randY >= 50) {
      posy += mystep;
    } 
    else {
      posy -= mystep;
    }
    //Con CONSTRAIN se asegura que el cuerpo no salga de la ventana
    posx = constrain(posx, 0, width);
    posy = constrain(posy, 0, height);
  }
  
  void drawMe (){
  homer (posxx,posyy);
  }

void homer(int posxx,int posyy) {
//homer
//Orejas Homer
  stroke(255);
  fill(255,217,15);
  ellipse(posx-84,posy+40,30,30);
  ellipse(posx+84,posy+40,30,30);
  if(mousePressed) {
  stroke(255);
  fill(255,84,91);
  ellipse(posx-84,posy+40,30,30);
  ellipse(posx+84,posy+40,30,30);
}
//Cara Homer 
  fill(255,217,15);
  rectMode(CENTER);
  fill(255,217,15);
  rect(posx,posy,156,180);
  if (mousePressed){
   fill(255,84,91);
  rectMode(CENTER);
  fill(255,84,91);
  rect(posx,posy,156,180);
}
//Pelitos +Calva
  fill(0);
  arc(posx,posy-130,60,60,3.13,TWO_PI,OPEN);
  fill(255);
  arc(posx,posy-130,58,58,3.13,TWO_PI,OPEN);
  fill(255,217,15);
  arc(posx,posy-78,156,120,3.13,TWO_PI,OPEN);
  if(mousePressed) {
  fill(0);
  arc(posx,posy-130,60,60,3.13,TWO_PI,OPEN);
  fill(255);
  arc(posx,posy-130,58,58,3.13,TWO_PI,OPEN);
  fill(255,84,91);
  arc(posx,posy-78,156,120,3.13,TWO_PI,OPEN);
}

//Barba Homer

  stroke(0);
  fill(209,178,112);
  ellipseMode(CENTER);
  ellipse(posx,posy+90,156,100);
  if(mousePressed) {
   stroke(0);
  fill(222,211,126);
  ellipseMode(CENTER);
  ellipse(posx,posy+90,156,100);
}

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
  if(mousePressed) {
  strokeWeight(1); 
  fill (random(255),random(255),random(255));
  ellipse(posx-64,posy-20,20,20);
  ellipse(posx+26,posy-20,20,20);
  fill(0);
  ellipse(posx-64,posy-20,10,10);
  ellipse(posx+26,posy-20,10,10);
}

//Boca Homer
  stroke(0);
  fill(0);
  ellipse(posx-44,posy+80,20,20);

}
void mousePressed(){// cuando presiono maouse la figura vuelve al centro y cambian de las pupilas y la cara

  
  
  //HOMER VUELVE AL CENTRO
  posx=width/2;
  posy=height/2;
  
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
}










