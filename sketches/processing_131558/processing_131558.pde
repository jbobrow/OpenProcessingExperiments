
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/124665*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

boolean[] medallas={false,false,false,false};
int x=0;
color col=color(0,255,0);
PImage fons1, fons2, fons3, fons4, fons5, fons6;
Boto b1, b2, b3, b4, b5, b6, b7,b8;
int pantalla=1;


void setup(){
  size(850, 700);
  background(0,0,0);
   
   //FONS AMB FOTOGRAFIES
  fons3= loadImage("gordo.jpg");
  fons4= loadImage("familia.jpg");
  fons5= loadImage("guisantemalvado.jpg");
  fons6= loadImage("mar.jpg");
  //BOTONS I PROPIETATS
  b1 = new Boto();
  b3 = new Boto(width/2-60,100, color(0,0,100), 200, 125,  1, 3, "Segona opció");
  b4 = new Boto(width-250,height/2, color(0,200,200), 200, 125, 1, 4, "Tercera opció");
  b5 = new Boto(width/2-60,500, color(100,0,100), 200, 125,  1, 5, "Quarta opció");
  b2 = new Boto(width/2+200, 500, color(0,0,255), 200, 125, 2, 1, "Volver atrás");
  b6 = new Boto(width/2+200, 500, color(0,0,255), 200, 125, 4, 1, "Volver atrás");
  b7 = new Boto(100, 500, color(0,0,255), 200, 125, 5, 1, "Volver atrás");
  b8 = new Boto(width/2+200, 500, color(0,0,255), 200, 125, 3, 1, "Volver atrás");
  
}
void draw(){
  switch(pantalla){
    case 1: inici();break;
    case 2: zampon();break;
    case 3: riu();break;
    case 4: cuina();break;
    case 5: barranc();break;
  }
 // println(medallas);

  
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b4.apreta();
  b5.apreta();
  b6.apreta();
  b7.apreta();
  b8.apreta();
  

 
}

class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fonBoto;
  String texte;
  
  
  Boto(){
    xPos = 130;
    yPos = height/2;
    c = color(255,0,0);
    widthB = 200;
    heightB = 125;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Verdana", 12);
    textFont(fonBoto);
    texte = "Primera opció";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 15);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  void dibuixa(){
    stroke(0,255,0);
    fill(c,100);
    rect(xPos, yPos, widthB-80, heightB,1280);
    fill(255);
    text (texte, xPos+20, yPos+65,100);
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void inici(){
  
  size(850, 700);
  background(0,0,0);
  fill(255);
  //rodones de menor a major tamany que dibuixen la bafarada
  noStroke();
  ellipse(530,300,15,15);
  ellipse(550,280,20,20);
  ellipse(650,230,200,100);
  stroke(0);
     
  textSize(12);
  fill(0);
  text("Ajuda'm!! sóc un pèsol perdut i", 560, 220); 
  text("vull tornar a la cuïna!!", 590, 240);
  text("amb la meva familia!!", 590, 260);
  //pesol
  noStroke();
  fill(64, 105, 26);
  ellipse(width/2,height/2+20,170,200);
  //ulls
  stroke(0);
  line(450,320,450,360);
  line(400,320,400,360);
  strokeWeight(5);
  arc(425,400,150,100,0,PI);
  b1.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
  b5.dibuixa();
  fill(0,0,0);
 
  rect(10,650,141,40);
   noStroke();
   fill(255);
  rect(160,660,40,20);
 if(medallas[0]==true){
   fill(col);   
   rect(13,653,35,35);}
    if(medallas[1]==true){
   fill(col);   
   rect(48,653,35,35);}
    if(medallas[2]==true){
   fill(col);
   rect(83,653,35,35);}
    if(medallas[3]==true){
   fill(col);   
   rect(116,653,35,35);}  
  int contador=0; 
  for(i=0;i<medallas.length;i++){
    if(medallas[i]==true){
    contador++;
    }}
    fill(0);
   text(contador+"/4",169,675);
   if(contador==4){
     col=#FFD700;
   text("Felicidades!",50,675);}
  
}



void zampon(){
  size(850, 700);
  background(0);
  image(fons3,0,0);
  fill(64, 105, 26);
  noStroke();
  ellipse(width/2-10,height/2+90,170,130);
  stroke(0);
  //ojos
  line(430,400,430,430);
  line(400,400,400,430);
  noStroke();
  //cuerpo del guisante 
  ellipse(415,480,30,30);
  fill(255);
  //bafarada
  ellipse(530,390,15,15);
  ellipse(550,370,20,20);
  ellipse(650,310,200,100);
  //boca
  fill(255,0,0);
  ellipse(390,470,40,40);
  //text
  textSize(12);
  fill(0);
  text("TINC POR!! JA ET VAL!!", 570, 300); 
  text("vull tornar a la meva cuïna!!", 570, 320);  
  b2.dibuixa();
  medallas[0]=true;
}
void riu(){
  size(850, 700);
  background(0);
 image(fons5,0,0);
  //bafarada
  noStroke();
  fill(255);
  ellipse(520,370,15,15);
  ellipse(540,350,20,20);
  ellipse(640,320,200,100);
  //text
  textSize(12);
  fill(0);
  text("EL PÈSOL MALVAT", 570, 300); 
  text("HA SEGRESTAT LA MEVA", 550, 320);
  text("FAMILIA!! :)", 610, 340);
  //PESOL
  noStroke();
  fill(64, 105, 26);
  ellipse(width/2,height/2+20,170,200);
  //ulls
  stroke(0);
  line(450,320,450,360);
  line(400,320,400,360);
  //boca
  line(400,400,450,400);
  b8.dibuixa();
   medallas[1]=true;
}
void cuina(){
  size(850, 700);
  image(fons4,0,0);
  //pesol
  noStroke();
  fill(64, 105, 26);
  ellipse(width/2-38,height/2+110,150,200);
  stroke(0);
  //ulls
  line(400,420,400,450);
  line(380,420,380,450);
  //boca
  noStroke();
  fill(255,0,0);
  arc(386,500,120,100,0,PI);
  //bafarada
  fill(255);
  ellipse(520,390,15,15);
  ellipse(540,370,20,20);
  ellipse(640,310,200,100);
  //text
  textSize(12);
  fill(0);
  text("PER FI HE TROBAT LA CUÏNA!!", 550, 300); 
  text("I JA ESTIC AMB LA FAMÍLIA!! :)", 550, 320);
  
  b6.dibuixa();
   medallas[2]=true;
}
void barranc(){
  size(850, 700);
  background(0);
  image(fons6,0,0);
 //pesol
  noStroke();
  fill(64, 105, 26);
  ellipse(760,height/2+80,150,200);
   //ulls
  stroke(0);
  line(750,400,750,450);
  line(770,400,770,450);
  //boca
  line(790,450,740,500);
  //bafarada
  fill(255);
  ellipse(660,390,15,15);
  ellipse(630,370,20,20);
  ellipse(600,310,200,100);
  //text
  textSize(12);
  fill(0);
  text("NOSE SI ELS PODRÉ TROBAR", 520, 300); 
  text("ALGUN DIA...", 520, 320);
  
  b7.dibuixa();
   medallas[3]=true;
 
}





