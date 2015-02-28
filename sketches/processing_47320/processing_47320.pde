
PImage lupin;
int a;
PImage nada;
PImage alone;
PImage cansado;
PImage confuso;
PImage enojado;
PImage llorando;
PImage megusta;
PImage smile;

int nadax;
int naday;
int nadaselected;
  
int pageheight;
int pagewidth;
  
int alonex;
int aloney;
int aloneselected;
  
int cansadox;
int cansadoy;
int cansadoselected;
  
int confusox;
int confusoy;
int confusoselected;

int enojadox;
int enojadoy;
int enojadoselected;

int llorandox;
int llorandoy;
int llorandoselected;

int megustax;
int megustay;
int megustaselected;

int smilex;
int smiley;
int smileselected;



 
 
  
void setup()
{
  pageheight=600;
  pagewidth=640;
    
  size(700,700);
  frameRate(30);
   
  lupin= loadImage("fondo.jpg");
  nada= loadImage("nada.gif");
 nadax= pagewidth/2-200;
naday= pageheight-104;
nadaselected=0;
alone=loadImage("alone.gif");
  alonex=0;
  aloney=pageheight-1;
aloneselected=0;
 
  cansado= loadImage("cansado.gif");
  cansadox=0;
  cansadoy=pageheight-200;
  cansadoselected=0;
    
  confuso=loadImage("confuso.gif");
  confusox=0;
confusoy=pageheight-400;
confusoselected=0;

 enojado=loadImage ("enojado.gif");
 enojadox= 0;
enojadoy =pageheight-600;
enojadoselected=0;

llorando =loadImage ("llorando.gif");
llorandox =530;
llorandoy =pageheight -150-70;
llorandoselected = 0;

megusta =loadImage ("megustas.gif");
megustax = 530;
megustay =pageheight /4+400;
megustaselected =0;

smile =loadImage ("smile.gif");
smilex = 530;
smiley =pageheight /4 +50;
smileselected =0;




    
 
    
   
}
  
void mousePressed() {
 if (nadaselected==1) {
  nadaselected=0;
 }
 else if (mouseX >= nadax & mouseX <= nadax + 146 & mouseY >= naday & mouseY <=naday+84)
  {nadaselected=0;
  }
  else if (aloneselected==1) {
   aloneselected=0;
   }
  else if (mouseX >= alonex & mouseX <= alonex + 146 & mouseY >= aloney & mouseY <= aloney+84){
    aloneselected=1;
  }
       else if (cansadoselected==1) {
   cansadoselected=0;
  }
     
    else if (mouseX >= cansadox & mouseX <= cansadox + 146 & mouseY >= cansadoy & mouseY <= cansadoy+84){
    cansadoselected=1;
  }
  else if (confusoselected ==1) {
    confusoselected = 0;
  }
     else if (mouseX >= confusox & mouseX <= confusox + 146 & mouseY >= confusoy & mouseY <=confusoy+84){
   confusoselected=1;}
   
    else if (enojadoselected ==1) {
    enojadoselected = 0;
  }
     else if (mouseX >= enojadox & mouseX <= enojadox + 146 & mouseY >= enojadoy & mouseY <=enojadoy+84){
enojadoselected=1;}

 else if (llorandoselected ==1) {
    llorandoselected = 0;
  }
     else if (mouseX >= llorandox & mouseX <= llorandox + 146 & mouseY >= llorandoy & mouseY <=llorandoy+84){
llorandoselected=1;}
   
    else if (megustaselected ==1) {
    megustaselected = 0;
  }
     else if (mouseX >= megustax & mouseX <= megustax + 146 & mouseY >= megustay & mouseY <=megustay+84){
megustaselected=1;}

    else if (smileselected ==1) {
    smileselected = 0;
  }
     else if (mouseX >= smilex & mouseX <= smilex + 146 & mouseY >= smiley & mouseY <=smiley+84){
smileselected=1;}

   
}
    
void draw()
  
{
  background (0);
  image(lupin,0,0);
  
  a = (a + 1)%(width+32);
  stroke(226, 204, 0);
   
  if (nadaselected ==1) {
  nadax=mouseX;naday=mouseY;
  }
  if (aloneselected ==1) {
    alonex=mouseX; aloney=mouseY;
  }
       if (cansadoselected ==1) {
    cansadox=mouseX; cansadoy=mouseY;
  }
   if (confusoselected ==1) {
    confusox=mouseX; confusoy=mouseY;
 }
   if (enojadoselected ==1) {
    enojadox=mouseX; enojadoy=mouseY;
    
     }
   if (llorandoselected ==1) {
    llorandox=mouseX; llorandoy=mouseY;
   }
  
   if (megustaselected ==1) {
    megustax=mouseX; megustay=mouseY;
   }
   
   if (smileselected ==1) {
     smilex =mouseX; smiley =mouseY;
   }
   

    
 image (nada, nadax, naday);
 image (alone, alonex,aloney);
 image (cansado, cansadox,cansadoy);
 image (confuso, confusox,confusoy);
 image (enojado, enojadox, enojadoy);
 image (llorando, llorandox, llorandoy);
 image (megusta, megustax,megustay);
 image (smile, smilex, smiley);
 
  
    
}


