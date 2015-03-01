
int num_abejas1 = 7;
int num_abejas2 = 7;

float [] posicionesX1 = new float[num_abejas1];
float [] posicionesY1 = new float[num_abejas1];
float [] velocidadesX1 = new float[num_abejas1];
float [] velocidadesY1 = new float[num_abejas1];
float [] sz1 = new float [num_abejas1];

float [] posicionesX2 = new float [num_abejas2];
float [] posicionesY2 = new float[num_abejas2];
float [] velocidadesX2 = new float[num_abejas2];
float [] velocidadesY2 = new float[num_abejas2];
float [] sz2 = new float [num_abejas2];


void setup(){
  size (500, 500);

  for (int i=0; i<num_abejas1; i++)
  {
    posicionesX1[i] = width/2;
    posicionesY1[i] = height/2;
    velocidadesX1[i] = random (1,5);
    velocidadesY1[i] = random (1,5);
    sz1[i] = width/7.5;   
  }
  
  for (int i=0; i<num_abejas2; i++)
  {
    posicionesX2[i] = width/2;
    posicionesY2[i] = height/2;
    velocidadesX2[i] = random (1,5);
    velocidadesY2[i] = random (1,5);
    sz2[i] = width/7.5;
  } 
}
  
  
void draw(){
  
  background (#6ACEFF);
  
  for (int i=0; i<num_abejas1; i++)
  {
    modificar_pos1(i);
    comprobar_lim1(i);
    dibujar_personaje1(i); 
  }
    for (int i=0; i<num_abejas2; i++)
  {
    modificar_pos2(i);
    comprobar_lim2(i);
    dibujar_personaje2(i);  
  }
}


void modificar_pos1(int _i)
{
  posicionesX1[_i] += -velocidadesX1[_i];
  posicionesY1[_i] += -velocidadesY1[_i];
  
}

void modificar_pos2(int _i)
{
  posicionesX2[_i] += velocidadesX2[_i];
  posicionesY2[_i] += velocidadesY2[_i];
  
}


void comprobar_lim1(int _i)
{
  //comprobamos límites X
  if((posicionesX1[_i] < sz1[_i]/1.3) || (posicionesX1[_i] > width-sz1[_i]/1.7)){
    velocidadesX1[_i] = -velocidadesX1[_i];
  }
  //comprobamos límites Y
  if((posicionesY1[_i] < sz1[_i]/1.4) || (posicionesY1[_i] > height-sz1[_i]/4)){
    velocidadesY1[_i] = -velocidadesY1[_i];
  } 
}

void comprobar_lim2(int _i)
{
  //comprobamos límites X
  if((posicionesX2[_i] < sz2[_i]/1.7) || (posicionesX2[_i] > width-sz2[_i]/1.3)){
    velocidadesX2[_i] = -velocidadesX2[_i];
  }
  //comprobamos límites Y
  if((posicionesY2[_i] < sz2[_i]/1.4) || (posicionesY2[_i] > height-sz2[_i]/4)){
    velocidadesY2[_i] = -velocidadesY2[_i];
  }  
}


void dibujar_personaje1(int _i)
{
  //ala1 
  fill (255);
  ellipse (posicionesX1[_i]-5, posicionesY1[_i]-18, sz1[_i]/1.8, sz1[_i]/2.5);
 //cuerpo
  fill (#FFC227);
  ellipse (posicionesX1[_i], posicionesY1[_i], sz1[_i], sz1[_i]/2);
  //cabeza
  fill (0);
  ellipse (posicionesX1[_i]-40, posicionesY1[_i]-10, sz1[_i]/2.7, sz1[_i]/2);
  //ojos
  fill (255);
  ellipse (posicionesX1[_i]-48, posicionesY1[_i]-13, sz1[_i]/13.3, sz1[_i]/5);
  ellipse (posicionesX1[_i]-38, posicionesY1[_i]-10, sz1[_i]/11.5, sz1[_i]/4.5);
  fill (0);
  ellipse (posicionesX1[_i]-49, posicionesY1[_i]-13, sz1[_i]/80, sz1[_i]/20);
  ellipse (posicionesX1[_i]-40, posicionesY1[_i]-10, sz1[_i]/40, sz1[_i]/13.3);
  fill (255);
  //ala2
  ellipse (posicionesX1[_i]+10, posicionesY1[_i]-18, sz1[_i]/1.5, sz1[_i]/2.2);
  //antenas
  noFill ();
  arc (posicionesX1[_i]-43, posicionesY1[_i]-7, sz1[_i]/4, sz1[_i]*1.25, radians(270), radians(340));
  arc (posicionesX1[_i]-50, posicionesY1[_i]-10, sz1[_i]/4, sz1[_i]*1.25, radians(270), radians(340));
  fill (0);
  triangle (posicionesX1[_i]+32, posicionesY1[_i]-2, posicionesX1[_i]+32, posicionesY1[_i]+4, posicionesX1[_i]+42, posicionesY1[_i]+1); 
}  

void dibujar_personaje2(int _i)
{
  //ala1 
  fill (255);
  ellipse (posicionesX2[_i]+5, posicionesY2[_i]-18, sz2[_i]/1.8, sz2[_i]/2.5);
 //cuerpo
  fill (#FFC227);
  ellipse (posicionesX2[_i], posicionesY2[_i], sz2[_i], sz2[_i]/2);
  //cabeza
  fill (0);
  ellipse (posicionesX2[_i]+40, posicionesY2[_i]-10, sz2[_i]/2.7, sz2[_i]/2);
  //ojos
  fill (255);
  ellipse (posicionesX2[_i]+48, posicionesY2[_i]-13, sz2[_i]/13.3, sz2[_i]/5);
  ellipse (posicionesX2[_i]+38, posicionesY2[_i]-10, sz2[_i]/11.5, sz2[_i]/4.5);
  fill (0);
  ellipse (posicionesX2[_i]+49, posicionesY2[_i]-13, sz2[_i]/80, sz2[_i]/20);
  ellipse (posicionesX2[_i]+40, posicionesY2[_i]-10, sz2[_i]/40, sz2[_i]/13.3);
  fill (255);
  //ala2
  ellipse (posicionesX2[_i]-10, posicionesY2[_i]-18, sz2[_i]/1.5, sz2[_i]/2.2);
  //antenas
  noFill ();
  arc (posicionesX2[_i]+43, posicionesY2[_i]-7, sz2[_i]/4, sz2[_i]*1.25, radians(180), radians(250));
  arc (posicionesX2[_i]+50, posicionesY2[_i]-10, sz2[_i]/4, sz2[_i]*1.25, radians(180), radians(250)); 
  fill (0);
  triangle (posicionesX2[_i]-32, posicionesY2[_i]-2, posicionesX2[_i]-32, posicionesY2[_i]+4, posicionesX2[_i]-42, posicionesY2[_i]+1); 
}  
