
/*DIA DE PLATJA
 Autor: Rut Diaz Palacios
Elisava GEDI - 3r trimestre
Grup 03


Es tracta d'un dia solejat a la platja.
El sol és el centre del ratóli, el qual si el fas passar per sobre de l'aiua apareixen unes bombolles/espuma.
Els dos nens estan jugant a la pilota, però el primer està escalfant i no se la passa de moment..
I si cliques a la pantalla apareix el meu nom. */

//DECLARACIÓ DE VARIABLES
float y=1; //float per decimals
//text que apareixerà al clicar la pantalla
String[] paraules  ={"Rut","Diaz","Palacios",""};
PFont tipografia;
int comptador=0;

//INICIALITZACIONS
void setup(){ 
size (600,200); 
background(#75CAE8);
   frameRate(3); //serveix x la VELOCITAT --> frames per segon (el que fico en parentesis son els frames/segon)
velX = random(1,6); //velocitats entre 1 i 6 frames declarades per la velocitat de la pilota
velY = random(1,6); 
  
  //Tipografia pel text
tipografia = loadFont("ArialMT-18.vlw"); //tipus de lletra
textFont(tipografia,18);  //mida lletra

  //FONS ESTATIC 
  //no he aconseguit que es mantinguès estàtic (perquè si el ficava al DRAW el "mar" deixava de tenir moviment.. nosé perquè?!
  //llavors le ficat aquí, amb uns colors i que ocupèssin tota la pantalla, perquè es veiès bé i demostrar que sé fer-ho
  for(int x=0; x<=width; x+=20){
  {
    for(int y=0; y<=height; y+=20){
    ellipse(x,y,10,10); //deixara de funcionar si li fic o lo que va asota xqe executa lo altre
    fill(#17E8B2);
    ellipse(x+=10,y-=10,10,10); //si ficop aixo, el d'adalt es com si no l'haguès ficat
    fill(#C1E817);  
    ellipse(x-=10,y+=10,10,10); //fa la diagonal
   }
  }
 }
}


//A EXECUTAR
void draw() {

  //SOL
background();

/* FONS ESTATIC --> COM T'HAVIA COMENTAT EN CLASSE, JO VOLIA SIMULAR LA SORRA FENT ARRAYS, PERÒ EN EL MOMENT EN QUE HO FICO AQUÍ, EL "MAR" com et deia, DEIXA DE TENIR MOVIMENT
  for(int x=0; x<=width; x+=10){
  {
    for(int y=180; y<=height; y+=10){
    fill(#897134);
    ellipse(x,y,5,5); //deixara de funcionar si li fic o lo que va asota xqe executa lo altre
 
   }
  }
 } */ 

//rajos de sol
stroke(#F7F728);
for (int i=0; i<200; i+=5) { //si i=0 i com a màxim 200, els rajos de sol tindran una separació de 5
//la posició de x i y sera en funció del moviment del ratolí
line(mouseX,mouseY, i/3, height/3); 
line(mouseX,mouseY, i/3,0);
line(mouseX,mouseY,0,i/3);
line(mouseX,mouseY,height/3,i/3);
//dibuix del sol
fill(#F7F728);
ellipse(mouseX,mouseY,20,20);
}
   
   //MAR
stroke(#2B53A5);
for(int i=0; i<height; i++){ // l'interlineat que formin les muntanyes serà d'1 (distància entre coordenades) 
  y+=.02; //distància en y que variara el nivell del mar
  int x = i*(width/height); //el fet de ficar-ho en funció de l'amplada i alçada de la  mida de la finestra, fa indepene
  float nY = noise(y/2)* height; //amb el noise genero una seqüència aleatòria i succesiva, en aquest cas de y. el valor de "y" no és important ja que com es treballa dins d'unespai infinit, la distància entre coordenades és l'únic important 
  line(x,height,x,nY);
 }
//quan el raig de sol incideix a l'aigua surten bombolles 
if(( mouseX > 600 || mouseY > 100)||( mouseY > width || mouseX <0)) {

   //BOMBOLLETES AIGUA
for(int i=0; i<100; i++){
     float posX = random(width); //fins a on farà la funció
     //si x ex. fico en posXi i posY radom(250); executarà la funció en el 1r quadrant
     float posY = random(height/2,height);
     int mida = random (12); //mida de les bombolletes que coma màxim seran de 12 (aniran de 0-12)
     fill(#639FEA); 
     ellipse(posX,posY,mida,mida); }
}

//dibuix ninots i pilota
fill(#EACE85);
noStroke();
ellipse(20,170,15,15);
ellipse(20*10,170,15,15);
rect(15,170,5,200);
rect(200,170,5,200);
quad(20,190,20,180,60,160,60,160);
quad(20*10,190,20*10,180,60+100,160,60+100,160);
fill(#FA001D);
posX=50+velX;
posY=150+velY;
ellipse(posX,posY,20,20);

//PILOTA amb moviment
if((posX<100)&&(posX>300)){
    velX = -velX; //perquè retorni a la seva posició inicial
} 
  //comprovem posicio Y
  if((posY<200)&&(posY>100)){
    velY = -velY;
}
}
//PER INICIAR EL TEXT AL CLICAR A PANTALLA
void mousePressed(){
  text(paraules[comptador],mouseX,mouseY);
  //augmentem el comptador només si NO supera el num. de paraulesde la matriu de text, per evitar l'error
  if(comptador<paraules.length+10){ //des del punt on es clica, la paraula apareixerà 10 punts més a la dreta de separació
  comptador++;
  }
 }


/*Els elements que es qrequeria a l'enunciat que apareixessin més de 10 rebotant pels límits de la pantalla,
enlloc de fer que rebotin, he fet que vagin apareixent en forma de bombolles del mar indicant-li uns límits, però no rebotant (com ja havia demostrat en la pràctica anterior que ho sabia fer,
També he fet que la pilota vermella reboti (1 element) també indican-li els límits.*/


