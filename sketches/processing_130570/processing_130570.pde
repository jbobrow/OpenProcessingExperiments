
int cantidad=100;
color[][] tonos=new color[cantidad][cantidad];
int ancho;
int largo;
int tono=90;;
void setup() {
  frameRate(1005);
  colores(cantidad);
  size(500, 1000);
  ancho=width/cantidad;
  largo=height/cantidad;
}
void draw() {
colorMode(RGB, 100);
stroke(216,234,199);
strokeWeight(0.0001);
noStroke();
//tono=20;
rectangulos(cantidad);
//tono=int(map(mouseX,0,width,0,100));
}

//variables de colores
//int tono=47;//verde 

//int tono=80 //morado
int sat=81;//ocre
//int sat=66;//ocre
int brillo;
int alfa;

//funcion de colores
void colores(int cant) {
  colorMode(HSB, 100);
  alfa=100;
  for (int contA=0;contA<cant;contA++) {
    for (int contB=0;contB<cant;contB++) {
      if(contA==0 || contA==cant-1){
      tonos[contA][contB]=color(tono, sat, 60); 
    }
      else if(contB==0 || contB==cant-1){
      tonos[contA][contB]=color(tono, sat, 60);  
    }
    else{
      brillo=int(random(50, 70));  
      tonos[contA][contB]=color(tono, sat, brillo);  }
    }
  }
}

void rectangulos(int cant) {
  for (int contA=0;contA<cant;contA++) {
    for (int contB=0;contB<cant;contB++) {
      evento(contA,contB);
      fill(tonos[contA][contB],alfa);
      if (alfa<100){
      alfa+=ceil(0.01);
      }
      rect(contB*ancho, contA*largo, ancho, largo);     
    }
  }
}

int cambia;
void evento(int posA,int posB){ 
  colorMode(HSB, 100);
cambia=int(random(0,300));
if(posA!=0 && posB !=0 && posA!=(cantidad-1) && posB!=(cantidad-1) && cambia>=35 && cambia<=35.5){
alfa=0;
brillo=int(random(50, 100));  
tonos[posA][posB]=color(tono, sat, brillo);}
}
