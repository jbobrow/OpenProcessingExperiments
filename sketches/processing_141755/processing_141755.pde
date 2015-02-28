
// PROYECTO FINAL

// V A R I A B L E S 

//fam_1 y 2

//int cantidad= int (random (3,no));
int cont;
int tamano;
int tam;
int angulo;
int cantidad= 20;
int sz;
int contador;
int alpha;

// array hola
String [] palabras = {
 "a", "b" , "c", "d"};
PFont letra;


//arrays para posiciones
float [] posXa = new float [cantidad];
float [] posYa = new float [cantidad];

//arrays para variaciones velocidades Perlin
float [] vXa = new float [cantidad];
float [] vYa = new float [cantidad];

//arrays para ruidos Perlin
float [] rXa = new float [cantidad];
float [] rYa = new float [cantidad];







// S E T U P 
void setup() {
  background(190);
  noCursor();
  background(255);
  size(800, 600);
  smooth();
  Arreglos();
  
  letra=loadFont("Arial-ItalicMT-48.vlw");
  textFont(letra,random(20));

}




// D R A W 
void draw () {
  Mouse();



  for (int i = 0; i<cantidad; i++) {
    posXa[i] = noise (vXa[i])*width;
    posYa[i] = noise (vYa[i])*height;
    //variar ruido-velocidad
    vXa[i] += rXa[i];
    vYa[i] += rYa[i];
  }


if (keyPressed) {
    if (key=='a') {
       solo_linea();
    }
  }else{hola();}


//--

  if (keyPressed) {
    if (key=='b') {
      nodos_uno();
     
    }
  }else{hola();}
  
  //--
  
   if (keyPressed) {
      if (key=='c') {
     circulos();
     triangulo();
      
    }
    
  }
    
}

//////// funciones grales
void Arreglos() {
  for (int i=0; i<cantidad; i++) {
    // sii es menos al número de elipses, i aumenta en 1 cada vez
    // aplicación a r, que será aplicado para generar un ruido "ordenado" en posiciones / Perlin
    rXa[i] = random( 0.004, 0.012 );
    rYa[i] = random(0.003, 0.010);
  }
}//fin Arreglos



void Mouse() {
sz=5;
  noStroke();
  fill(255, random(50));
  ellipse(mouseX, mouseY, sz, sz);
}

void circulos () {
  
  int tam=int (random (1,2));
  //translate(200,height/2);
  fill(200,0, 80);
  rectMode(CENTER);
  rect(200,height/2, 400,height);
  
  fill(60,0, 72);
  rectMode(CENTER);
  rect(600,height/2, 400,height);
  
 
  
  noStroke();
    fill(255,255,255);
 ellipse(random(width), random(height),tam,tam);
  
alpha=1255;
  int tamano= int (random(200, 300));
  //background (224,0, 30);

  fill(105, 0, 60,alpha);
  ellipse(200, height/2, contador%tamano, contador%tamano);


  fill(105, 0, 60,alpha);
  ellipse(200, height/2, contador%400, contador%400);

  fill(237, 0, 119,alpha);
  ellipse(200, height/2, contador%300, contador%300);

  fill(156, 0, 214,alpha);
  ellipse(200, height/2, contador%tamano, contador%tamano);

  fill(255, 33, 13,alpha);
  ellipse(200, height/2, contador%100, contador%100);

  fill(160, 0, 112,alpha);
  ellipse(200, height/2, contador%70, contador%70);
  contador++;
  
   //lineafilm
  strokeWeight(random(5));
  stroke(255,random(10,60));
  //line(random(50,80), 0, random(50,80),0);
  line(random(50,80), 0, random(50,60),height);
}


void triangulo () {
 
 pushMatrix();
translate(600,height/2);
rotate(radians(angulo));
fill(255,random(50,90));
triangle(-30,30,30,30,0,-30);  
rotate(radians(angulo*0.1));
triangle(-80,80,80,80,0,-80);  
rotate(radians(angulo*0.3));
triangle(-110,110,110,110,0,-110); 
rotate(radians(angulo*0.55));
triangle(-140,140,140,140,0,-140); 

popMatrix();
  angulo++;
  
}

//

void hola () {
  
  
    int tam=int (random (1,2));
    
    
    fill(0);
   //fill(60,0, 72);;
rectMode(CENTER);
rect(width/2, height/2, width, height);


 

  noStroke();
    fill(255,255,255);
 ellipse(random(width), random(height),tam,tam);
 

pushMatrix();
translate(width/2,height/2);

//fill(255,random(50,120));
fill(random(255),random(50,120));
rotate(radians(angulo*0.55));
triangle(-50,50,50,50,0,-50); 

rotate(radians(angulo*0.15));
fill(random(255),random(50,120));
triangle(-35,35,35,35,0,-35); 

rotate(radians(angulo*0.15));
fill(random(255),random(50,120));
triangle(-20,20,20,20,0,-20); 

//rectMode(CENTER);
//rect(0,0, 50,50);

popMatrix();
  angulo++;




 

  
}


void solo_linea() {



  sz=20;

  noStroke();
  //fill(200,255,0,10);
// fill(random(190), random(190),random( 190), 10);
fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);



  for (int i=0; i<cantidad; i++) {
    float dist_ref=1000;
    float myX= -1;
    float myY=-1;
    for ( int j =0; j<cantidad; j++) {
      float d = dist(posXa[i], posYa[i], posXa[j], posYa[j]);
      if (d<dist_ref && d !=0) {
        dist_ref=d;
        myX=posXa[j];
        myY=posYa[j];
      }
    }

    strokeCap(ROUND);
    strokeWeight(random(0.5, 5));
    stroke(255,200);
    line(posXa[i], posYa[i], myX, myY);



  }
}

void nodos_uno () {



  sz=10;

  noStroke();
  fill(190, 190, 190, 50);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);



  for (int i=0; i<cantidad; i++) {
    float dist_ref=1000;
    float myX= -1;
    float myY=-1;
    for ( int j =0; j<cantidad; j++) {
      float d = dist(posXa[i], posYa[i], posXa[j], posYa[j]);
      if (d<dist_ref && d !=0) {
        dist_ref=d;
        myX=posXa[j];
        myY=posYa[j];
      }
    }

    /* strokeCap(ROUND);
     strokeWeight(random(0.5, 3));
     stroke(90,60);
     line(posXa[i], posYa[i], myX, myY);
     
     
     
     //stroke(255,60);
     noStroke();
     fill(0, 255, mouseY);
     //fill(255);
     ellipse(posXa[i], posYa[i], sz, sz);*/


    fill(100, 255, mouseY);
    //noStroke();
    strokeWeight(1);
    stroke(0, 40);
    ellipse(posXa[i], posYa[i], sz, sz);
    line (posXa[i], posYa[i], posXa[i]-random(30), posYa[i]+random(50));
  }
}



