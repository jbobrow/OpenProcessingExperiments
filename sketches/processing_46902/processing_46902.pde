
PImage lupin4;
int a;
PImage mamadera;
//PImage mouth;
//PImage madeyes;
//PImage madmouth;
//PImage nose1;
//PImage nose2;
//PImage smile;
 
int mamaderax;
int mamaderay;
int mamaderaselected;
 

 
void setup()
{
  //pageheight=600;
  //pagewidth=640;
   
  size(200,200);
  frameRate(30);
  
  lupin4= loadImage("lupin4.gif");
  mamadera= loadImage("mamadera.gif");
  //mamaderax= pagewidth/2-125;
  //mamaderay= pageheight-104;
  mamaderaselected=0;
  
}
 
void mousePressed() {
 if (mamaderaselected==1) {
   mamaderaselected=0;
 }
 else if (mouseX >= mamaderax & mouseX <= mamaderax + 250 & mouseY >= mamaderay & mouseY <= mamaderay+104)
  {mamaderaselected=1;
  }
  
}
   
void draw()
 
{
  background (0);
  image(lupin4,0,0);
 
  a = (a + 1)%(width+32);
  stroke(226, 204, 0);
  //line(0, a, width, a-26);
  //line(0, a-6, width, a-32);
   
  if (mamaderaselected ==1) {
  mamaderax=mouseX; mamaderay=mouseY;
  }
  
  
   
  image (mamadera, mamaderax, mamaderay);
}
 
   



