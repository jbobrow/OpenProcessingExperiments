
float randImg;


int fondbg = 3;
int femmegauche = 3;
int femmedroite = 3;


PImage[] fond = new PImage[fondbg];
PImage[] femme = new PImage[femmegauche];
PImage[] femme1 = new PImage[femmedroite];

float x;
float y;

int r;

void setup()
{
  size(500, 391);
  

 
 //femme gauche
 femme[0] = loadImage("femmeg0.png");
 femme[1] = loadImage("femmeg1.png");
 femme[2] = loadImage("femmeg2.png");

 
 femme1[0] = loadImage("femmed0.png");
 femme1[1] = loadImage("femmed1.png");
 femme1[2] = loadImage("femmed2.png");
 
  //fond
 fond[0] = loadImage("fond0.png");
 fond[1] = loadImage("fond1.png");
 fond[2] = loadImage("fond2.png");

 
  background(255);
 
}



void draw()
{
  


}



void mouseClicked(){
  
  
  
   if (mouseY>0 && mouseY<200) {
  
      randImg = round(random(0,fondbg-1));
      image(fond[(int)randImg], 0, 0);
  
 }
  
   if (mouseY>200 && mouseX>0 && mouseX<300){
  
      randImg = round(random(0,femmegauche-1));
      image(femme[(int)randImg], 0, 0);
  
 }
  
   if (mouseY>200 && mouseX>300 && mouseX<width){
  
  randImg = round(random(0,femmedroite-1));
  image(femme1[(int)randImg], 0, 0);
   }
  
  
}





