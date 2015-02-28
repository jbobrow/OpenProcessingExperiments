
PImage lupin;
int a;
PImage nada;
PImage mamadera;
PImage chupete;
PImage babero;
PImage oso;
PImage cupcake;
    
int nadax;
int naday;
int nadaselected;
    
int pageheight;
int pagewidth;
    
int mamaderax;
int mamaderay;
int mamaderaselected;
    
int chupetex;
int chupetey;
int chupeteselected;
    
int baberox;
int baberoy;
int baberoselected;
  
int osox;
int osoy;
int ososelected;
 
int cupcakex;
int cupcakey;
int cupcakeselected;
   
   
    
void setup()
{
  pageheight=600;
  pagewidth=640;
      
  size(600,600);
  frameRate(30);
     
  lupin= loadImage("castillo2.jpg");
  nada= loadImage("nada.gif");
 nadax= pagewidth/2-200;
naday= pageheight-300;
nadaselected=0;
mamadera=loadImage("mamaderas.gif");
  mamaderax=pagewidth-200;
  mamaderay=pageheight -10-100;
mamaderaselected=0;
   
  chupete= loadImage("chupetes.gif");
  chupetex=pagewidth -10-100;
  chupetey=pageheight-90;
  chupeteselected=0;
      
  babero=loadImage("baberox.gif");
baberox=0;
baberoy=pageheight-80-76;
baberoselected=0;
  
 oso =loadImage ("osho.gif");
osox=+300 ;
osoy =pageheight-150;
ososelected=0;
 
cupcake =loadImage ("cupcake.gif");
cupcakex =+200;
cupcakey = pageheight-100;
cupcakeselected=0;
      
   
      
     
}
    
void mousePressed() {
 if (nadaselected==1) {
  nadaselected=0;
 }
 else if (mouseX >= nadax & mouseX <= nadax + 146 & mouseY >= naday & mouseY <=naday+84)
  {nadaselected=0;
  }
  else if (mamaderaselected==1) {
   mamaderaselected=0;
   }
  else if (mouseX >= mamaderax & mouseX <= mamaderax + 146 & mouseY >= mamaderay & mouseY <= mamaderay+84){
    mamaderaselected=1;
  }
       else if (chupeteselected==1) {
   chupeteselected=0;
  }
       
    else if (mouseX >= chupetex & mouseX <= chupetex + 146 & mouseY >= chupetey & mouseY <= chupetey+84){
    chupeteselected=1;
  }
  else if (baberoselected ==1) {
    baberoselected = 0;
  }
     else if (mouseX >= baberox & mouseX <= baberox + 146 & mouseY >= baberoy & mouseY <=baberoy+84){
   baberoselected=1;}
     
    else if (ososelected ==1) {
    ososelected = 0;
  }
     else if (mouseX >= osox & mouseX <= osox + 146 & mouseY >= osoy & mouseY <=osoy+84){
ososelected=1;}
      
    else if (cupcakeselected ==1) {
    cupcakeselected = 0;
  }
     else if (mouseX >= cupcakex & mouseX <= cupcakex + 146 & mouseY >= cupcakey & mouseY <=cupcakey+84){
cupcakeselected=1;}
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
  if (mamaderaselected ==1) {
    mamaderax=mouseX; mamaderay=mouseY;
  }
       if (chupeteselected ==1) {
    chupetex=mouseX; chupetey=mouseY;
  }
   if (baberoselected ==1) {
    baberox=mouseX; baberoy=mouseY;
 }
   if (ososelected ==1) {
    osox=mouseX; osoy=mouseY;
   }
   if (cupcakeselected ==1) {
    cupcakex=mouseX; cupcakey=mouseY;
  }
      
  image (nada, nadax, naday);
 image (mamadera, mamaderax, mamaderay);
 image (chupete, chupetex,chupetey);
 image (babero, baberox,baberoy);
 image (oso, osox, osoy);
 image (cupcake, cupcakex, cupcakey);
    
    
      
}

