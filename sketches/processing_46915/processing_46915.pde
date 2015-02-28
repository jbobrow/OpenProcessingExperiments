
PImage lupin4;
int a;
PImage lunares;
PImage mamadera;
PImage chupete;
PImage babero;

 
int lunaresx;
int lunaresy;
int lunaresselected;
 
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


 
void setup()
{
  pageheight=600;
  pagewidth=640;
   
  size(640,600);
  frameRate(30);
  
  lupin4= loadImage("lupin4.gif");
  lunares= loadImage("lunares.gif");
 lunaresx= pagewidth/2-125;
lunaresy= pageheight-104;
lunaresselected=0;
mamadera=loadImage("mamadera.gif");
  mamaderax=0;
  mamaderay=pageheight-84;
mamaderaselected=0;

  chupete= loadImage("chupete.gif");
  chupetex=pagewidth/2+130;
  chupetey=pageheight-90;
  chupeteselected=0;
   
  babero=loadImage("Babero.gif");
baberox=0;
baberoy=pageheight-100-76;
baberoselected=0;
   

   
  
}
 
void mousePressed() {
 if (lunaresselected==1) {
  lunaresselected=0;
 }
 else if (mouseX >= lunaresx & mouseX <= lunaresx + 146 & mouseY >= lunaresy & mouseY <= lunaresy+84)
  {lunaresselected=0;
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
     
}
   
void draw()
 
{
  background (0);
  image(lupin4,0,0);
 
  a = (a + 1)%(width+32);
  stroke(226, 204, 0);
  
  if (lunaresselected ==1) {
  lunaresx=mouseX;lunaresy=mouseY;
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
   
  image (lunares, lunaresx, lunaresy);
 image (mamadera, mamaderax, mamaderay);
 image (chupete, chupetex,chupetey);
 image (babero, baberox,baberoy);
 
 
   
}


