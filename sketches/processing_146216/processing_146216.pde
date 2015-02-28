
//10 globos con color aleatorio volando hacia arriba entre nubes.
//Si le das click al ratón, los globos se hinchan (hasta un tamaño en el que se deshinchan)
//El random walker acaba cuando todos los globos suben hacia arriba.

//Variables
int numGlobos=10;
int i;
int w=65; // Variables para mousePressed
int h=80;

// Matrices
float[] posicionesX= new float [numGlobos];
float[] posicionesY= new float [numGlobos];
color[] colorGlobos= new color [numGlobos]; // Determinará el color random de los globos


void setup(){
   size(800,600);   

for(int i=0;i<numGlobos;i++){
  posicionesX[i]=posicionesX[i]+width/2+(int)random(-10,10); //Inicializamos las posiciones empezando desde el centro 
  posicionesY[i]=posicionesY[i]+3*height/4+(int)random(-20,20); // y desde 3/4 de la altura
  colorGlobos[i]=color(random(250),random(140),random(200)); // Color random entre código (250,140,200)
  }
}

void draw (){
  background(182,241,247); // Fondo con nubes

for(int i=0; i<numGlobos; i++){ // Inicio de loop
  posicionesX[i]+=random(-10,10); // Actualización de posición X según coordenadas (va más lento en este eje)
  posicionesY[i]+=random(-20,20); // Actualización de posición Y según coordenadas (va más rápido en este eje)
 
if(posicionesX[i]-200<0){ // Límite únicamente establecidos en eje X para que sigan dirección hacia arriba
   posicionesX[i]=200;
  }
  
  if(posicionesX[i]+200>width){
    posicionesX[i]=width-200;
  }
 
// Fondo de nubes
strokeWeight(1);
stroke(255);
fill(250,30);
ellipse(200,400,140,90); // Nube 1
ellipse(230,430,80,50);
ellipse(160,360,50,30);
ellipse(160,410,100,50);
ellipse(340,20,120,80); //Nube 2
ellipse(280,20,80,40);
ellipse(320,50,80,40);
ellipse(760,490,120,80); // Nube 3
ellipse(700,480,80,40);
ellipse(740,500,70,30);
ellipse(860,90,100,60); // Nube 4
ellipse(860,120,160,90);
ellipse(920,140,80,40);
ellipse(540,280,70,35);
ellipse(500,270,40,25);

// Globo
 noFill();
  stroke(0);
  strokeWeight(1);
arc(posicionesX[i]-29, posicionesY[i]+70, 60, 250, -PI / 4, PI / 4); // Hilo suelto globo (40º)
  stroke(1);
  fill(colorGlobos[i]);
triangle(posicionesX[i],posicionesY[i]+30,posicionesX[i]-6,posicionesY[i]+50,posicionesX[i]+6,posicionesY[i]+50); // Sobrante globo (nudo)
ellipse(posicionesX[i],posicionesY[i],w,h); // Globo

  }
}

void mousePressed(){ // Esta función hace que al darle click con el ratón se hinchen los globos hasta un límite determinado en el que se deshinchan
    if(w<105){ // Si w es menor de 105 (en un principio mide 65 -eje X de la ellipse del globo-)
      w=w+10; // a w se le añadirá 10
    }
    if(h<102){ // Si h es menor de 102 (en un principio mide 80 -eje Y de la ellipse del globo-)
      h=h+12; // a h se le añadirá 12
    }
    if(w>=105){ // Si w es mayor o igual que 105
      w=35; // El ancho de la ellipse del globo disminuirá
      h=40; // el largo de la ellipse del globo también disminuirá produciendo un efecto de deshinchado
  }  
}



