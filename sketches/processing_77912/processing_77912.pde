
//Tabla de dibujo creada por Oscar Martinez Ramos

int aleatorio = 0;
int dimension = 20;
int color1 = 0;
int color2 = 0;
int color3 = 0;

void setup(){
size (850,700);
background(255);//fondo blanco de inicio
}

void draw(){
     if(keyPressed && (key =='R')){//fondo ROJO
     background(255,0,0);
  }
    if(keyPressed && (key =='V')){//fondo VERDE
     background(0,255,0);
  }
    if(keyPressed && (key =='A')){//fondo AZUL
     background(0,0,255);
  }
    if(keyPressed && (key =='N')){//fondo NEGRO
     background(0);
  }
    if(keyPressed && (key =='B')){//fondo BLANCO
     background(255);
  }
  noStroke();
  if(aleatorio==0){
  fill(color1,color2,color3);  
  if(keyPressed && key == 'b'){
    color1=255;
    color2=255;
    color3=255;
  }
  if(keyPressed && key == 'r'){
    color1=255;
    color2=0;
    color3=0;
  }
    if(keyPressed && key == 'v'){
    color1=0;
    color2=255;
    color3=0;
  }
    if(keyPressed && key == 'a'){
    color1=0;
    color2=0;
    color3=255;
  }
    if(keyPressed && key == 'n'){
    color1=0;
    color2=0;
    color3=0;
  }
  if(mousePressed){
  ellipse(mouseX,mouseY,dimension,dimension);
  }
  }
  if(keyPressed && key =='+'){
    dimension=dimension+1;        //tamaño de pincel
    }
  if(keyPressed && key =='-'){
    dimension=dimension-1;
   }
  if(dimension==0){
    dimension=1;
  }
  if(keyPressed && key == 'm'){
    aleatorio= 0;
  }
  if(keyPressed && key == ' '){
    aleatorio = 1;
  }
  //pintar aleatorio
  if(aleatorio ==1){
   if(mousePressed && mouseButton == LEFT){//circulos raton izquierdo
     fill(random(255),random(255),random(255));
     ellipse(mouseX,mouseY,random(10,30),random(10,30));
     }
     if(mousePressed && mouseButton== RIGHT){//cuadrados raton derecho
     fill(random(255),random(255),random(255));
       rect(mouseX-10,mouseY-10,random(10,30),random(10,30));
     }
  }
}



