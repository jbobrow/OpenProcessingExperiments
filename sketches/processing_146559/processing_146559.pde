
//quantitat d'androids
int numAndroids = 10;
 
 
//matriu posició X
float[] posicionesX = new float[numAndroids];

//matriu posició Y
float[] posicionesY = new float[numAndroids];

//matriu velocitat X
float[] velocidadesX = new float[numAndroids];

//matriu velocitat Y
float[] velocidadesY = new float[numAndroids];


void setup(){
//nom i titol del treball
println("Camil Raich, Grup 3. Informatica");

  size(500,500);
//iniciem velocitats i posicions

for(int i=0; i<numAndroids; i++){
  posicionesX[i] = random(width/2-100, width/2+100);
  posicionesY[i] = random(height/2-100, height/2+100);
 
//les velocit250ts són random
velocidadesX[i] = random(1,6);
velocidadesY[i] = random(1,6);
}

}

void draw(){


background(255);


stroke(115,178,255);


//creem el búcle
 
for(int i = 0; i<numAndroids; i++){
  
  //actualitzem les posicions
  posicionesX[i] += random(-3,3);
  posicionesY[i] += random(-3,3);
   
  //comprovem els límits en X
  if((posicionesX[i]<0)||(posicionesX[i]>width)){
    velocidadesX[i] = -velocidadesX[i];
  }
   
  //comprovem els límits en Y
  if((posicionesY[i]<0)||(posicionesY[i]>height)){
    velocidadesY[i] = -velocidadesY[i];
  }
   
  //Dibuixem el personatge
  dibujarAndroids(posicionesX[i], posicionesY[i]);
}
}
 
void dibujarAndroids(float _x, float _y){


//cap
ellipse(_x,_y-65,250/1.75,250/2);

//cos
rect(_x-250/1.75/2,_y-250/2.20/2,250/1.75,250/2.20);

//cames
strokeWeight(0);
stroke(30,229,88);

rect(_x+10,_y+35,250/8,250/2.5);

rect(_x-40,_y+35,250/8,250/2.5);

ellipse(_x+25,_y+135,250/8,250/8);
ellipse(_x-25,_y+135,250/8,250/8);


//braços
rect(_x-110,_y-35,250/8,250/3);
rect(_x+80,_y-35,250/8,250/3);


ellipse(_x-95,_y-37,250/8,250/8);
ellipse(_x-95,_y+47,250/8,250/8);


ellipse(_x+95,_y-37,250/8,250/8);
ellipse(_x+95,_y+47,250/8,250/8);


//antenes
rect(_x-20,_y-135,250/50,250/10);
rect(_x+20,_y-135,250/50,250/10);


fill(115,178,255);
stroke(115,178,255);
strokeWeight(250/1000);

//ulls
ellipse(_x+20,_y-100,250/17,250/17);
ellipse(_x-20,_y-100,250/17,250/17);

//amagar el ratoli
noCursor();
}

