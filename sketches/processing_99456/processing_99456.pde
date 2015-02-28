
float moverX = 0;
float puntoX = random(50,100);
float puntoY = random(20,500);
float puntoX2 = random(150,400);
float puntoY2 = random(200,300);
float puntoX3 = random(350,500);
float puntoY3 = random(300,390);

float puntitoX = random(15,40);
float puntitoY = random(200,300);
float puntitoX2 = random(550,650);
float puntitoY2 = random(200,400);

float ruido = 0.0;
float ruido2 = 0.0;
float ruido3 = 0.0;
float ruido4 = 0.0;
float ruido5 = 0.0;
float ruido6 = 0.0;
float lineaInicio = random(100,300);
float lineaFinal = random(200,500);
float circulo = random(35,80);
float circulo2 = random(35,80);
float circulo3 = random(35,80);


//TEXTO//
String[] palabras = {"las sensaciones perdidas","amarrado a mis orillas","transito los caminos","mirando las hojas","los árboles","las miradas", "las palabras", "los pajaros", "esos recuerdos", "las mañanas", "sus ojos cerrados"};
String[] adjetivos = {"arrastrando versos de otro","rompiendo espejos que no reflejan","arrastrando canciones viejas","perdiendo el peso hasta levitar","invadiendo los cuerpos","que se pierden en el viento", "se desarman en el aire", "sin libertad", "que habitan en el pecho", "en la palma de la mano", "susurran paz"};
String[] palabras3 = {"sin nada que perder","cuando el día comienza","sin sombra bajo mis pies","y los dientes siempre apretados","pensando en volver","siempre de pie","hacen crecer los miedos","...y nadie sabe qué dirán","yo solo contemplo","¿y si no es real?","todo sigue siendo distinto"};
int n = int(random(10));
int n2 = int(random(10));
int n3 = int(random(10));
//TEXTO//


float nuevaposX = 500;

void setup(){
  size(900, 550);
  background(200,50,50);
  smooth();
  textSize(20);
  
  
}

void puntitoMas (float ancho, float tono, float trans, float posX, float posY){
      strokeWeight(ancho);
      stroke(tono,trans);
      point(posX,posY); 
}

void draw(){
  translate(70,0);
    
  ruido = ruido + 0.03;
  ruido2 = ruido2 + 0.02;
  ruido3 = ruido3 + 0.04;
  ruido4 = ruido4 + 0.01;
  ruido5 = ruido5 + 0.02;
  ruido6 = ruido6 + 0.03;
  float rX = noise(ruido) * 40;
  float rY = noise(ruido2) * 20;
  float rX2 = noise(ruido3+0.02) * 40;
  float rY2 = noise(ruido4+0.01) * 20;
  float rX3 = noise(ruido5+0.03) * 40;
  float rY3 = noise(ruido6+0.01) * 20;
  float v = random(3);
  
  
  colorMode(HSB);
  background(rX3*5+190,200,120);
  colorMode(RGB);
  
  stroke(255,0);
  strokeWeight(150);
  line(moverX,0,moverX,height);
  stroke(255,0);
  strokeWeight(80);
  line(moverX,0,moverX,height);
  stroke(255,20);
  moverX = moverX + 2;
  
  if (moverX > 1000){
  moverX = 1;
  puntoX = random(50,200);
  puntoY = random(20,500);
  puntoX2 = random(150,400);
  puntoY2 = random(200,300);
  puntoX3 = random(350,500);
  puntoY3 = random(300,390);
  
  puntitoX = random(15,40);
  puntitoY = random(200,300);
   puntitoX2 = random(550,650);
 puntitoY2 = random(200,400);
 
  lineaInicio = random(200,400);
  lineaFinal = random(200,500);
  circulo = random(35,80);
  circulo2 = random(35,80);
  circulo3 = random(35,80);
  n = int(random(10));
  n2 = int(random(10));
  n3 = int(random(10));
  
  }
//PUNTITO
if (moverX > 70){
      strokeWeight(24);
      stroke(255,20);
      point(puntitoX+rY3,puntitoY+rX2);
      strokeWeight(10);
      stroke(255);
      point(puntitoX+rY3,puntitoY+rX2);
      stroke(255,150);
      strokeWeight(4);
      line(-70,lineaInicio,puntitoX+rY3,puntitoY+rX2);
      
}

float compara = 0;
float posiX = -70;

while (moverX > compara){
  puntitoMas(8,255,15,posiX+50,random(height));
  puntitoMas(5,255,25,posiX+80,random(height));
  puntitoMas(12,255,15,posiX,random(height));
  compara = compara + 10;
  posiX = posiX+10;
  
}

  //PUNTO 1
    if (moverX > 150){
      strokeWeight(20);
      stroke(255);
      point(puntoX+rX,puntoY+rY);
      stroke(255,200);
      strokeWeight(4);
      line(puntitoX+rY3,puntitoY+rX2,puntoX+rX,puntoY+rY);
      strokeWeight(circulo);
      stroke(255,rX3*1.5);
      point(puntoX+rX,puntoY+rY);
      strokeWeight(circulo-9);
      stroke(255,rX3*1.5);
      point(puntoX+rX,puntoY+rY);
      text(palabras[n], puntoX+rX+30, puntoY+rY+5);
      stroke(255,50);
      strokeWeight(1);
      line(-70,lineaInicio ,puntoX+rX,puntoY+rY);
      
      
                  
  }

  //PUNTO 2
   if (moverX > 300){
      strokeWeight(20);
      stroke(255);
      point(puntoX2+rX2,puntoY2+rY2);
      stroke(255,200);
      strokeWeight(4);
      line(puntoX+rX,puntoY+rY,puntoX2+rX2,puntoY2+rY2);
      strokeWeight(circulo2);
      stroke(255,rY*2);
      point(puntoX2+rX2,puntoY2+rY2);
      strokeWeight(circulo2-9);
      stroke(255,rY*2);
      point(puntoX2+rX2,puntoY2+rY2);
      text(adjetivos[n2], puntoX2+rX2+30,puntoY2+rY2+5);
      stroke(255,50);
      strokeWeight(1);
      line(puntitoX+rY3,puntitoY+rX2, puntoX2+rX2,puntoY2+rY2);
      
   }
 
 //PUNTO 3
   if (moverX > 450){
      strokeWeight(20);
      stroke(255);
      point(puntoX3+rX3,puntoY3+rY3);
      strokeWeight(3);
      stroke(255,200);
      line(puntoX2+rX2,puntoY2+rY2,puntoX3+rX3,puntoY3+rY3);
      strokeWeight(circulo3);
      stroke(255,rX2*1.5);
      point(puntoX3+rX3,puntoY3+rY3);
      strokeWeight(circulo3-9);
      stroke(255,rX2*1.5);
      point(puntoX3+rX3,puntoY3+rY3);
      text(palabras3[n3], puntoX3+rX3+30,puntoY3+rY3+5);
      strokeWeight(1);
      stroke(255);
      strokeWeight(1);
      stroke(255,50);
      line(puntoX+rX,puntoY+rY,  puntoX3+rX3,puntoY3+rY3 );
  }
    
  //PUNTITO2
  if (moverX > 600){
      strokeWeight(10);
      stroke(255);
      point(puntitoX2+rY2,puntitoY2+rX3);
      strokeWeight(24);
      stroke(255,20);
      point(puntitoX2+rY2,puntitoY2+rX3);
      stroke(255);
      strokeWeight(3);
      stroke(255,200);
      line(puntoX3+rX3,puntoY3+rY3,puntitoX2+rY2,puntitoY2+rX3);
      stroke(255,200);
      line(puntitoX2+rY2,puntitoY2+rX3,width,lineaFinal);
      strokeWeight(1);
      stroke(255,50);
      line(puntoX2+rX2,puntoY2+rY2,  puntitoX2+rY2,puntitoY2+rX3 );
      strokeWeight(1);
      stroke(255,50);
      line(puntoX3+rX3,puntoY3+rY3,width,lineaFinal  );
      
      
  }
}
