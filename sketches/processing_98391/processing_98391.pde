
/*Alfons Echegaray
Informatica Grup 02 - 2n GEDI
Professora: Anna Mª del Corral
Practica 5
Variables: Matrius i bucles for(int), condicionals if, voidmousepressed

Explicació practica 4:
En aquest exercici treballem les variables utilitzades per a generar matrius en X,Y ; 
Utilitzant l'expresio "for (int el void set, i el void draw, i definint la posició de 
les lineas respecte i.
Les elipses que fan les diagonals també estan generades amb una matriu, seguint en X i en Y a (i,i) i (i,-i).
Per acabara, generem uns quadrats en una posició aleatoria entre X (100,500), i entre Y (100,500), 
i una velocitat en X i Y aleatoria entre 2 i 6.
Aquets rectangles canvien de color al creuar la diagonal (i,i), i alhora quan premem 
el mouse restaurem les velocitats d'aquests.

Explicació practica 5:
Substituim el cursor per una imatge (utilitzem noCursor() per amagar la fletxa del
cursor)
Fem que quan cliques es dispari un so (utilitzant la funció mousePressed())
aquest so el descarreguem facilment a la base de dades freesound.org)
Arrosseguem el so i l'imatge sobre de l'interficie de processing i aquest ja passen a les dades de la practica.
Fem que quan cliques es dispari un so (utilitzant la funció mousePressed())
aquest so el descarreguem facilment a la base de dades freesound.org)

Per aconseguir que el só es reproduís en javaScript he hagut de buscar en altres exemples a processing.org, i he vist que
definint el so amb l'expresió

"var audioElement=document.createElement("audio");"           a l'inici,
i

"audioElement.setAttribute("src","NOM DE L'ARXIU.FORMAT");
  audioElement.play();"
  
just on volem que es reprodueixi el so.


*/



//Definim l'audio per java script //
 var audioElement=document.createElement("audio");
 

 
 
 
 
//Creem  un objecte PImage, de nom "barco //


PImage barco;




//definim les variables que utilitzem//
float szel,szrect;
float[] Posicionselipse = new float[24];

int rectmov = 10;

//hem de fenerar una matriu per a les posX en els "ullsmov" elements //

float[] posX = new float[rectmov];
//el mateix per posY:
float[] posY = new float[rectmov];
//i per velX:
float[] velX = new float[rectmov];
//i velY:
float[] velY = new float[rectmov];



void setup(){
size(600,600);


  //carreguem una imatge i ens assegurem que es guarda a les dades de l'sketchbook
barco=loadImage("barco.png");
  


  //inicialitzem posicions i velocitats//
  for(int i = 0; i<rectmov; i++){
    posX[i] = random (100,500);
    posY[i] = random (100,500);
    velX[i] = random(1,6);
    velY[i] = random(1,6);
    
     szel=25;
     szrect=20;
     
  }
 noCursor();

}


void draw (){
  background(#94BEDE);
  
  
 
  
// ratllem la diagonal superior del fons amb línies negres //
strokeWeight(3);

stroke(0);
line(0,0,width,height);
for (int i = 0; i <width; i = i+25) {
  line(i,0, i, i);
}

for (int i = 0; i < height; i = i+25) {
  line(i,i,width, i);
}

// ratllem la diagonal inferior del fons amb línies blanques //
stroke(#FFFFFF);
for (int i = 0; i < 600; i = i+25) {
  line(i,600,i,i);
}

for (int i = 0; i < 600; i = i+25) {
  line(i,i,0,i);
}


// creem aleatoriament totes les posicions //
  for(int i=0; i<24; i++){
 Posicionselipse[i] = i*szel;
  }
//  i dibuixem les elipses de la primera diagonal //
  for(int i=0; i<Posicionselipse.length; i++){
    fill(50,50,50);
   ellipse(Posicionselipse[i]+(szel/2),Posicionselipse[i]+(szel/2),szel,szel);
  }
  
    for(int i=0; i<Posicionselipse.length; i++){
      fill(100,50,50);
   ellipse(Posicionselipse[i]+(szel/2),Posicionselipse[i]+(szel/2),szel/2,szel/2);
  }
  
  //  i dibuixem les altres elipses //
  for(int i=0; i<Posicionselipse.length; i++){
    fill(100,50,50);
   ellipse(width-(Posicionselipse[i]+(szel/2)),(Posicionselipse[i]+(szel/2)),szel,szel);
  }
  
    for(int i=0; i<Posicionselipse.length; i++){
     fill(50,50,50);
   ellipse(width-(Posicionselipse[i]+(szel/2)),Posicionselipse[i]+(szel/2),szel/2,szel/2);
  }
  
  //formes en moviment//

  //iniciem un bucle perquè faci les mateixes accions //
  //a tots els valors de les matrius
  for(int i = 0; i<rectmov; i++){
    //actualitzem posicions
    posX[i] += velX[i];
    posY[i] += velY[i];

    //comprobem límits X
    if((posX[i]<0+(szrect/2))||(posX[i]>width-(szrect/2))){
      velX[i] = -velX[i];
    } 
    //comprobem límits Y
    if((posY[i]<0+(szrect/2))||(posY[i]>height-(szrect/2))){
      velY[i] = -velY[i];
    } 
    
    //generem un canvi de color //
      if((posX[i]<posY[i])||(posY[i]>posX[i])){
     stroke(255); 
      fill(0);
      }
      else{
           fill(255);
      stroke(0);
     
    } 
  // dibuixem els rectangles que es mouran //
rect(posX[i]-10,posY[i]-10,szrect,szrect);

  }
  
//foto
image(barco,mouseX-50,mouseY-12,100,25);

  
}
  
  
//per reiniciar el programa //
void mousePressed(){
  //reinicialitzem les velocitats //
  for(int i = 0; i<rectmov; i++){
    velX[i] = random(4,8);
    velY[i] = random(4,8);
   
  }
  
  //definim l'activació del só en l'instant d'apretar el mouse//
   if (mousePressed==true){
  audioElement.setAttribute("src","dispar.wav");
  audioElement.play();
}
}


 




    







 






