
/*----------------------------------------------------------------
 Travail Rattrapage
 Par Samantha Velandia Prieto
----------------------------------------------------------------*/


//Declaration Variables Cercle
int ellipseX = 100;
int ellipseY = 200;
int rayon = 25;
float maxCirculo = 0; 
boolean estadoCirculo = false;


//Declaration Variables Carré
int lineaHorizontal = 0;
int maxLineae=0;
boolean estadoLinea = true;

//Declaration Variables Boucle
int numeroRayos = 21;
int tamanoRayos = 50;
float tranche = TWO_PI / numeroRayos;
float rads = 0;
float ratio = 0.65;
float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;

//Declaration Variables Lignes
void setup(){
size(400,400);

}

void draw(){
smooth();
strokeWeight(5);
stroke(#37FF00);
  
//Dessin Ellipse 
 background(4,82,12);

  if (estadoCirculo==false) {
    fill(55,255,0);
    if (maxCirculo > 0) {
      maxCirculo -= 0.4;
    }
  }  
  if (estadoCirculo== true) {
    fill(255,0,255);
    if (maxCirculo < TWO_PI) {
       maxCirculo += 0.4;
   }
 }
 
//Boucle Ellipse
rads = 0; //Réinisialisation avant boucle 
while ( rads < maxCirculo ) {
x1 = ellipseX+cos(rads) * tamanoRayos * ratio;
y1 = ellipseY + sin(rads) * tamanoRayos * ratio;
x2 = ellipseX+cos(rads) * tamanoRayos;
y2 = ellipseY + sin(rads) * tamanoRayos;
  line(x1,y1,x2,y2 );
  rads = rads + tranche;
  

}

//Boucle Carré
lineaHorizontal=0; //Réinisialisation avant boucle

while (lineaHorizontal < maxLineae ){
line (0 , lineaHorizontal, height, lineaHorizontal);

lineaHorizontal= lineaHorizontal + 20;
}

//Detection souris dans le carré
noStroke();
ellipse(ellipseX, ellipseY, rayon *2, rayon *2 );

if(mousePressed) {
  if (mouseX > 250 && mouseX < 300 && mouseY > 175 && mouseY < 225){
    estadoLinea = true;
  }
} else {
  if (maxLineae>0){
    estadoLinea=false;
    
  }
}

//Appication couleurs dépendant des états

if(estadoLinea == false){
  fill(0,255,0);
  if(maxLineae>0){
    maxLineae -=25; }
    
}

if(estadoLinea == true) {
  fill(255,0,255);
 if (maxLineae <height){
   maxLineae +=25; }
   
}

//Dessin Rectangle
 rect(245, 180, 50, 50);
 
}

//Switch ellipse

void mousePressed(){

  float distance = dist (mouseX, mouseY, ellipseX, ellipseY);
  if( distance < rayon ) {//si el mouse esta en el circulo
    if( estadoCirculo == false) {
      estadoCirculo = true;
    }
    else  {
      estadoCirculo=false;
    }
  }
    

}
