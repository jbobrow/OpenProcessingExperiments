
//PREPARATIVOS: 
//escenario, arma y los invasores. 

//para que sea más facil vamos a hacer un arreglo
//es int que son valores enteros de la pantalla. 
//coordenadasXinvasor es el arreglo, cuando pones eso le estas diciendo que solo con poner eso pongas 5 bolitas en random
int[] coordenadasXinvasor={int(random (600)), int (random (600)), int(random(600)),int(random(600)),int(random(600)),int(random(600))};
int[] coordenadasYinvasor={0,0,0,0,0};
  
  int diametroInvasor=10;
  PFont palabra;
PImage imagen1;
void setup (){
  size (600,600);
  
  palabra=createFont("WalkwayBold-48.vlw",5);
  textFont (palabra,60);
  
}

void draw(){
 imagen1=loadImage("espacioniños.jpeg");
  background (0);
  arma ();
  invasores ();
  finJuego();
  //imagen1=loadImage("espacioniños.jpeg");
}
//EL ARMA 
void arma(){
  fill (128,130,133);
  stroke (color(128,130,133));

  triangle (mouseX-30,580,mouseX+30,580,mouseX,520);
  fill(0,0,255);
  ellipse(mouseX-1,550,15,30);
}

//INVASORES 
void invasores(){
  stroke(255,242,0);
  fill (255,242,0);
  
  for (int i=0; i<5; i++){
    ellipse (coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor, diametroInvasor);
    
  }
}

//DISPARO (cuAndo hacemos click)

void mousePressed (){
  proyectil(mouseX);
}

//EL PROYECTIL
void proyectil(int disparoX){//declarando la funcion, diciendo tu vas a recibir un valor entero que es disparoX (que es el valor del mouse)disparoX=mouseXcon un valor
  boolean acertar= false; //aqui es cuando preguntas si le atino o no, es una variable boolean solo dice que es falso o verdadero 
  for(int i=0; i<5; i++){
      if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) && (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
      acertar=true;
      line(mouseX,565,mouseX,coordenadasYinvasor[i]);
        ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i], diametroInvasor+25, diametroInvasor+25);
       coordenadasYinvasor[i]=int(random(600));
        coordenadasYinvasor[i]=0;
        //coordenadasXinvasor[i]=-100; si activas esto desaparecen los invasores y no vuelven a salir 
        //coordenadasYinvasor[i]=-100;
      }
  }
  
  if(acertar==false){
    line(mouseX,565,mouseX,0);
  }
}
      
//FINAL DEL JUEGO 
void finJuego(){
  for (int i=0; i<5; i++){
    if (coordenadasYinvasor[i]==600){
      fill(color(255,0,0));
      noLoop();
      fill(255,0,0);
      text("GAME OVER", 130,300);
    }
  }
}

  

