
int maximus = 1000;
int lastClic = 0;

int[] rojo = new int [maximus];
int[] verde = new int [maximus];
int[] azul = new int [maximus];

int[] clicX = new int[maximus];
int[] clicY = new int[maximus];
int[] tam = new int [maximus];

int[] vel = new int[maximus];
float[] clarete = new float[maximus];

PFont font;

void setup() {
  size(400,400,P3D);
  smooth();
  rectMode(CENTER);
 
  for (int a=0; a<maximus; a++) {
    rojo[a]=(int) random(255);
    verde[a]=(int) random(255);
    azul[a]=(int) random(255);
  }
  
  font = loadFont("SansSerif-48.vlw");
}

void draw(){
  background(255);
  
  textFont(font); 
  fill(220);
  text("click", 140, height/2); 
   
  dibujar();
}

void mouseClicked(){
  clicX[lastClic]=mouseX;
  clicY[lastClic]=mouseY;
  tam[lastClic]=0;
  vel[lastClic]=(int)random(1,5);
  
  if (lastClic<maximus) {
    lastClic+=1;
  }
}

void mouseDragged(){
  clicX[lastClic]=mouseX;
  clicY[lastClic]=mouseY;
  tam[lastClic]=0;
  vel[lastClic]=(int)random(1,5);
  
  if (lastClic<maximus) {
    lastClic+=1;
  }
}


void dibujar() {
  for (int i=0; i<lastClic; i++){
    if (tam[i]<500){
      tam[i]+=vel[i];
    } else {
      tam[i]=0;
    }
    
    pushMatrix();
    
    translate(clicX[i]+(tam[i]/2),clicY[i]-(tam[i]/2));
    rotateX(PI/clarete[i]);
    rotateY(PI/3.0);
    
    clarete[i]+=0.1;
    
    fill(rojo[i],verde[i],azul[i],130);
    rect(tam[i]/2,tam[i]/2,tam[i],tam[i]);
    
    popMatrix(); 
  }
}

