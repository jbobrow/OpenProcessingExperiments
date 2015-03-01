
//imatges
PImage lux, mare, nuvol,inici;
//pantalla 1
int pantalla=1;
int color_boto1=#FF0000;
int color_boto2=#00FF01;
int color_boto3=#2100FF;
//personatge
int personatgeY;
//enemic
int[] pos_enemicX;
int[] pos_enemicY;
boolean[] enemic_viu;
//vinil
int[] pos_vinilX;
int[] pos_vinilY;
int colorvinil= 0;
int vinil_act;
//comandos
boolean mou_dalt;
boolean mou_baix;
boolean dispar;



//nuvols
int num_nuvols = 20;

float[] posicionsX_nuvol = new float[num_nuvols];
float[] posicionsY_nuvol = new float[num_nuvols];
float[]velocitatsX_nuvol = new float[num_nuvols];

int[] sz = new int [num_nuvols];
//score
int score;

void setup() {
  size(500, 500);

  noStroke();
  lux= loadImage("lux.png");
  mare= loadImage("mare.png");
  nuvol=loadImage ("nuvol.png");
  inici=loadImage("INICI.png");

  pos_enemicX = new int[1000];
  pos_enemicY = new int[1000];
  enemic_viu = new boolean[1000];
  pos_vinilX = new int[6];
  pos_vinilY = new int[6];


  vinil_act = 0;

  personatgeY = 50;

  score=0;

  //nuvols
  for (int i= 0; i<num_nuvols; i++)
  {
    posicionsX_nuvol [i] = random (0, width);
    posicionsY_nuvol [i] = random (-10, 450);
    velocitatsX_nuvol [i] = random(0.1, 0.3);
    sz[i]= int(random(10, 25));
  }
  //vinils
  for (int i = 0; i<pos_vinilX.length; i++ ) {
    pos_vinilX[i] = -1000;
    pos_vinilY[i] = -1000;
  }


  //enemics
  for (int i = 0; i<pos_enemicX.length; i++) {
    enemic_viu[i] = true; // cada enemic està viu al principi
    pos_enemicX[i] = (int)random(width+20, ((width*width)/2));
    pos_enemicY[i] = (int)random(100, 400);
  }
}

void draw() {
  //inici pantalla 1
  if (pantalla==1)
  { 

    image(inici,0,0);
    noFill();
    strokeWeight(2);
    stroke(color_boto1);
    rect(125, 100, 50, 50);
    stroke(color_boto2);
    rect(225, 100, 50, 50);
    stroke(color_boto3);
    rect(325, 100, 50, 50);
  }
  //passa a la pantalla del joc
  else if (pantalla==2)
  { 
    background(#6FEBFF);

    
      //nuvols
      for (int i= 0; i<num_nuvols; i++)
      {


        modificar_pos_nuvol(i);
        comprovar_lim_nuvol(i);
        dibuixar_personatge_nuvol(i);
      }
      //personatge
      fill(0, 255, 0); 
      image(lux,50, personatgeY);

      fill(255); 


      //score

      fill(#FF6FF6);  
      textSize(32);
      text("Score: " + score, 300, 31);

      //vinils

      for (int i= 0; i< pos_vinilX.length; i++) {
        noStroke();
        fill(0);
         ellipse(pos_vinilX[i], pos_vinilY[i], 15, 15);
         fill(colorvinil);    
         ellipse(pos_vinilX[i], pos_vinilY[i], 5, 5);
         fill(0);
         ellipse(pos_vinilX[i], pos_vinilY[i], 1, 1);
         
    
        pos_vinilX[i] += 10;
      }

      //enemics
      fill(56, 60, 70);
      stroke(255);

      dibuixa_enemic();

      xocs2();



      xocs();

      if (mou_dalt == true) {
        personatgeY -= 10;
      }

      if (mou_baix == true) {
        personatgeY += 10;
      }

      if (dispar == true) {
        crea_vinil();
      }
    }


    mou_dalt = false; 
    mou_baix = false;
    dispar = false;
  

  //canvi color botons INICI
  //vermell
  if ((mouseX> 120)&&(mouseX<180)&&(mouseY<150)&&(mouseY>100))
  { 
    color_boto1=#810000;
  } else {
    color_boto1=#FF0000;
  }
  //verd
  if ((mouseX> 220)&&(mouseX<280)&&(mouseY<150)&&(mouseY>100))
  { 
    color_boto2=#008132;
  } else {
    color_boto2=#00FF01;
  }

  //blau
  if ((mouseX> 320)&&(mouseX<380)&&(mouseY<150)&&(mouseY>100))
  { 
    color_boto3=#0A0081;
  } else {

    color_boto3=#2100FF;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    mou_dalt = true;
  }

  if (keyCode == DOWN) {
    mou_baix = true;
  }
}

void keyReleased() {
  if (keyCode == 32) {
    dispar = true;
    println("SHOT!");
  }
}

void crea_vinil() {
  pos_vinilX[vinil_act] = 80;
  pos_vinilY[vinil_act] = personatgeY + 15;

  if (vinil_act < 5) {
    vinil_act++;
  } else {
    vinil_act = 0;
  }
}






void dibuixa_enemic () {
  for (int i= 0; i< pos_enemicX.length; i++) {
    if (enemic_viu[i] == true) {
      pos_enemicX[i] = pos_enemicX[i]-1;
     image(mare,pos_enemicX[i], pos_enemicY[i]); // dibuixa enemic
    }
  }
}


void xocs2 () { // XOCS

  for (int i=0; i<pos_vinilX.length; i++) { // per cada bala i per cada enemic
    for (int j = 0; j<pos_enemicX.length; j++) {
      if (pos_vinilX[i] > pos_enemicX[j] && pos_vinilX[i] < pos_enemicX[j] + 30 && pos_vinilY[i] >  pos_enemicY[j] && pos_vinilY[i] <  pos_enemicY[j] + 30 && enemic_viu[j] == true) {
        enemic_viu[j] = false;
        pos_vinilY[i] = -1000;
        score ++;
      }
      //si l'enemic surt de la pantalla fes que torni
      if (pos_enemicX[j]<0)
      {
        pos_enemicX[j]=width+10;
      }
    }
  }
}

void modificar_pos_nuvol(int _i)
{
  posicionsX_nuvol[_i]  += velocitatsX_nuvol [_i];
}


void comprovar_lim_nuvol(int _i)
{

  if ((posicionsX_nuvol[_i] < sz[_i]-150)||(posicionsX_nuvol[_i] > width+150))
  {
    velocitatsX_nuvol [_i] = -velocitatsX_nuvol[_i] ;
  }
}


void dibuixar_personatge_nuvol(int _i)
{

  //nuvol
  fill(255, 255, 255);
  image(nuvol,posicionsX_nuvol[_i], posicionsY_nuvol[_i]);
}



void xocs () { 

  for (int j = 0; j<pos_enemicX.length; j++) {
    if (pos_enemicX[j]==0) {


      score --;
    }
  }
  for (int j = 0; j<pos_enemicX.length; j++) {
    if ( pos_enemicX[j] < 80  &&  pos_enemicY[j]>personatgeY-40 &&  pos_enemicY[j]< personatgeY+40&& enemic_viu[j] == true ||(pos_enemicX[j]<0 && pos_enemicX[j]>-1)) {
      enemic_viu[j] = false;

      score --;
    }
  }
}
void mousePressed() {
  //vermell
  if ((mouseX> 120)&&(mouseX<180)&&(mouseY<150)&&(mouseY>100))
  { 
    color_boto1=#810000;
    pantalla=2;
    colorvinil=(#FF0000);
  }
  //verd
  if ((mouseX> 220)&&(mouseX<280)&&(mouseY<150)&&(mouseY>100))
  { 
    color_boto2=#008132;
    pantalla=2;
    colorvinil=(#00FF01);
  }
  //blau
  if ((mouseX> 320)&&(mouseX<380)&&(mouseY<150)&&(mouseY>100))
  { 
    color_boto3=#0A0081;
    pantalla=2;
    colorvinil=(#2100FF);
  }
}


