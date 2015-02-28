
PImage lupin;
int a;
PImage nada;
PImage cello;
PImage violin;
import ddf.minim.*;
import ddf.minim.*;
  
Minim minim;
AudioSample cello1;
AudioSample violin1;
 
     
int nadax;
int naday;
int nadaselected;
     
int pageheight;
int pagewidth;
     
int cellox;
int celloy;
int celloselected;
     
int violinx;
int violiny;
int violinselected;
         
void setup()
{
  pageheight=700;
  pagewidth=700;
       
  size(700,700);
  frameRate(40);
      
  lupin= loadImage("fondo.jpg");
  nada= loadImage("nada.gif");
 nadax= pagewidth+300;
naday= pageheight-300;
nadaselected=0;
cello=loadImage("cello2.gif");
  cellox=0;
  celloy=pageheight -400;
  celloselected=0;
    
  violin= loadImage("violin.gif");
  violinx=pagewidth -90-100;
  violiny=pageheight-300;
  violinselected=0;    
   
  minim = new Minim (this);
  cello1= minim.loadSample ("cello gaby.mp3",2048);
   
  minim = new Minim (this);
  violin1= minim.loadSample ("vivaldi gaby (forever).mp3",2048);
}
     
void mousePressed() {
 if (nadaselected==1) {
  nadaselected=0;
 }
 else if (mouseX >= nadax & mouseX <= nadax + 146 & mouseY >= naday & mouseY <=naday+84)
  {nadaselected=0;
  }
  else if (celloselected==1) {
   celloselected=0;
   }
  else if (mouseX >= cellox & mouseX <= cellox + 146 & mouseY >= celloy & mouseY <= celloy+84){
    celloselected=1;
  }
       else if (violinselected==1) {
   violinselected=0;
  }
        
    else if (mouseX >= violinx & mouseX <= violinx + 146 & mouseY >= violiny & mouseY <= violiny+84){
    violinselected=1;
  }
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
  if (celloselected ==1) {
    cellox=mouseX; celloy=mouseY;
  }
       if (violinselected ==1) {
    violinx=mouseX; violiny=mouseY;
  }
   
  image (nada, nadax, naday);
 image (cello, cellox, celloy);
 image (violin, violinx,violiny);
 }
 
void keyPressed()
{
  if ( key == 'c' ) cello1.trigger();
  if( key == 'v' ) violin1.trigger();
}
 
  
void stop()
{
  // always close Minim audio classes when you are done with them
 cello1.close();
 violin1.close ();
 minim.stop();
    
  super.stop();
}


