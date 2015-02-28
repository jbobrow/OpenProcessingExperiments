
PImage lupin4;
int a;
PImage mamadera;  
int mamaderax;
int mamaderay;
int mamaderaselected;
  
 
  
void setup()
{
  size(200,200);
  frameRate(30);
   
  lupin4= loadImage("lupin4.gif");
  mamadera= loadImage("mamadera.gif");
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
    
  if (mamaderaselected ==1) {
  mamaderax=mouseX; mamaderay=mouseY;
  }
   
   
    
  image (mamadera, mamaderax, mamaderay);
}

