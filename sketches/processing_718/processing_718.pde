
//*******************************************************BY*GUIGUI*11/12/2008************
Plots[] blot;
boolean FORME  = false;
boolean CCC = false;
//***************************************************************************************
void setup()
{
  size(800,600);
  colorMode(HSB,1);
  frameRate(25);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  blot = new Plots[2000];
  for (int i = 0 ; i < 1999; i++) {
    blot[i] = new Plots(i);  
  }
}
//***************************************************************************************
void draw()
{
  background(0);
  if (mousePressed == true && CCC == false) {
    FORME = (FORME == false) ? true : false;
    CCC = true;
  }
  else if (mousePressed == false){
    CCC = false;
  }
  for(int i=0; i < 1999; i++) {
    blot[i].schtroumpf();
  }
  for (float i = 1; i <= frameRate; i = i+1) {
    fill(0, 0, 1);
    if (i/5 == floor(i/5))
    {
      ellipse(20+18*i, 30, 12, 12);
    }
    else {
      ellipse(20+18*i, 30, 12, 12);
      fill(0);
      ellipse(20+18*i, 30, 9, 9);
    }
  }
}
//***************************************************************************************
class Plots {
  float ran_Plots, posX_Plots, posY_Plots, taille_Plots, coul_Plots, alph_Plots;
  int   vie_Plots, divi_Plots;
  Plots(int i) {
    ran_Plots    = random(1);
    vie_Plots    = floor(random(0,256));
    posX_Plots   = random(-400,400);
    posY_Plots   = random(-300,300);
    taille_Plots = random(3,6);
    coul_Plots   = random(1);
    alph_Plots   = 0;
    divi_Plots   = int(random(5,12));
  }
  void schtroumpf() {
    coul_Plots = (coul_Plots<=1) ? coul_Plots+0.01 : coul_Plots-1;
    if (vie_Plots < 255){
      posX_Plots = posX_Plots + posX_Plots/(40+(mouseX-400)/20);
      posY_Plots = posY_Plots + posY_Plots/(30+(mouseY-300)/20);
      vie_Plots = vie_Plots + 1;
      taille_Plots = taille_Plots + taille_Plots/60;
      alph_Plots = (vie_Plots<=50) ? 1-(50-vie_Plots)*.02 : 1-float(vie_Plots-50)/(256-50);
      forme(posX_Plots, posY_Plots, taille_Plots, coul_Plots, alph_Plots, divi_Plots);
    } 
    else {
      posX_Plots = random(-40,40);
      posY_Plots = random(-30,30);
      taille_Plots = random(3,6);
      vie_Plots = 0;
      forme(posX_Plots, posY_Plots, taille_Plots, coul_Plots, alph_Plots, divi_Plots);
    }
  }
}
//***************************************************************************************
void forme(float posX,float posY,float taille, float coul, float alph, int divi)
{
  fill(coul, 1, 1, alph);
  if (FORME == false)
  {
    ellipse(posX+400, posY+300, taille, taille);
  } 
  else {
    beginShape();
    for (int i = 0; i < divi; i = i+1) {
      vertex(posX+400+sin(2*PI/divi*i)*taille/1.5,posY+300+cos(2*PI/divi*i)*taille/1.5);
      vertex(posX+400+sin((2*PI/divi)/2+2*PI/divi*i)*taille/4,posY+300+cos((2*PI/divi)/2+2*PI/divi*i)*taille/4);
    }
    endShape(CLOSE);
  }
}

