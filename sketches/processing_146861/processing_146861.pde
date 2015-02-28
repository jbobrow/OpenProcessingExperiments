
//Variables 

int nmicos = 3; //número de micos que volem que 
                //apareixin en pantalla
int a;
int b;
int c;
int d;
int i;
int micocontr; //mico que controla el cursor
color colorback;
int mico;
int micoControlat;
 
//creem una matriu de posicionsX con "nmicos" elements

float[] A = new float[nmicos];
float[] B = new float[nmicos];
float[] vA = new float[nmicos]; 
float[] vB = new float[nmicos];

//Setup
void setup(){
  size(1200,800);
  a=10;
  b=10;
  c=10;
  d=10;
  i=0;
 
   
//inicialitzem posicions [i] per definir posició i 
//velocitat del mico
  for(int i = 0; i<nmicos; i++){
    A[i] = width/2;
    B[i] = height/2;
    vA[i]= random(-a,b);
    vB[i]= random(-c,d);
  }
}

//draw
void draw(){
 background(166-mouseX/8, 121-mouseX/8, 240-mouseX/8);
  //canvia el color del fons en funció de la posició X del mouse
  //iniciem un bucle perque faci les mateixes accions en tots els 
  //micos mitjançant matrius
 
  for(i = 0; i<nmicos; i++){
     
    A[i] += vA[i];
    B[i] += vB[i];
        
  //comprobem límits en X (A)
    if(((A[i]-55)<=0)||((A[i]+55)>=width)){
      vA[i]= -vA[i];
    }
    else{
     vA[i]= random(-a,b);
    }
     
  //comprobem límits en Y (B)
   
    if(((B[i]-50)<=0)||((B[i]+50)>=height)){
      vB[i] = -vB[i];
    }
   else{
     vB[i]= random(-c,d);
   }
     

//Dibuix del personatge original: Mico

//Orella esquerra
stroke(41,124,123);
fill(41,124,123);
ellipse(-215+A[i],-75+ B[i],50,120); 

//Orella dreta
stroke(41,124,123);
fill(41,124,123);
ellipse(217+A[i],-75+ B[i],50,120); 

//Cap de fons 
ellipse(A[i],-125+ B[i],420,400);
ellipse(A[i],-75+ B[i],420,480); 
stroke(0);
strokeWeight(2);
fill(189,42,219);
ellipse(-215+A[i],-25+ B[i],30,30);
ellipse(215+A[i],-25+ B[i],30,30);

//Cara
stroke(125,171,229);
fill(125,171,229);
ellipse(-45+A[i],25+ B[i],320,400);
ellipse(45+A[i],25+ B[i],320,400);
stroke(125,171,229);
fill(125,171,229);
rect(-175+A[i],-175+ B[i],40,200);
rect(135+A[i],-175+ B[i],40,200);

//Ull esquerra
ellipse(-75+A[i],-175+ B[i],200,200);
stroke(0);
fill(255);

//Ull fons blanc
fill(245,215,151);
ellipse(-75+A[i],-175+ B[i],100,100);

//Cercle fi ull esquerra
fill(42,247,170);
ellipse(-75+A[i],-175+ B[i],60,60); 

//Ull esquerra interior
fill(0);
ellipse(-75+A[i],-175+ B[i],50,50);

//Pupila ull primer
fill(255);
ellipse(-65+A[i],-175+ B[i],15,15); 

//Ull dreta
stroke(125,171,229);
fill(125,171,229);
ellipse(76+A[i],-175+ B[i],200,200);
stroke(0);
fill(255);

//Ull fons blanc dreta
fill(245,215,151);
ellipse(75+A[i],-175+ B[i],100,100);

//Cercle fi ull dreta
fill(42,247,170);
ellipse(75+A[i],-175+ B[i],60,60); 

//Ull dreta interior
fill(0);
ellipse(75+A[i],-175+ B[i],50,50); 

//Pupila ull segon
fill(255);
ellipse(85+A[i],-185+ B[i],15,15); 

//Nas
stroke(129,72,20);
fill(129,72,20);
triangle(-35+A[i],-105+ B[i],35+A[i],-105+ B[i],A[i],-65+ B[i]); 
ellipse(A[i],-106+ B[i],70,25);

fill(255);

//Barbeta
stroke(125,171,229);
fill(125,171,229);
ellipse(5+A[i],195+ B[i],120,120);

//Boca
stroke(180,18,18);
strokeWeight(7);
fill(0);
ellipse(5+A[i],90+ B[i],160,160+ B[i]/8);

//Interior fosc orelles
stroke(0);
fill(0);
ellipse(-215+A[i],-75+ B[i],15,60);
ellipse(217+A[i],-75+ B[i],15,60);

//Celles arquejades- corbes
stroke(0);
noFill();

curve(-35+A[i], -202+ B[i], -45+A[i], -255+ B[i], -125+A[i], 
-245+ B[i], -45+A[i], -202+B[i]); 
curve(135+A[i], -155+ B[i], 125+A[i], -245+ B[i], 45+A[i],
-255+ B[i], 125+A[i], -185+B[i]); 


//Lletres interior boca: Uo!
textSize(50);
fill (random(255),random(255),random(255)) ;
text ("UO!", -30+A[i], 110+ B[i]);

  }
}
void mousePressed()
{
A[micoControlat]=(mouseX);//el mico canvia de posició X (A) 
//en funció d'on cliquem amb el mouse
B[micoControlat]=(mouseY);//el mico canvia de posició Y (B) 
//en funció d'on cliquem amb el mouse
 
 if(mouseX<55){
  A[micoControlat]=mouseX+55;
 }
 
 if(mouseY<50){
  B[micoControlat]=mouseY+50;
 }
 
 if(mouseX>width-55){
  A[micoControlat]=mouseX-55;
 }
 
 if(mouseY>height-50){
  B[micoControlat]=mouseY-55;
 }
 
}


