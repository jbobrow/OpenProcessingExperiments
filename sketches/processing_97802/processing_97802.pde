
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/35520*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage dado1;
PImage dado2;
PImage dado3;
PImage dado4;
PImage dado5;
PImage dado6;
PFont myFont;
int a1,a2,a3,a4,a5,a6; 
int ro; 


void setup()
{
  size(600, 500);
  background (127);
 //** textSize(20); 
  myFont = createFont("tahoma", 14);
  textFont(myFont);
  scritte();
// noLoop(); 
 }


void draw() {
background (127);
noStroke();
text ( "Permi un tasto per resettare i dadi ", 10,250); 
numeri(); 
scritte(); 
text("Questa piccola applicazione simula il lancio dei dadi",10,300); 

} 


void scritte()
{
  text("uno      ", 10, 60);
  text(a1, 80+a1, 60);
  
  text("due      ", 10, 90);
  text(a2, 80+a2, 90);
  
  text("tre      ", 10, 120);
  text(a3, 80+a3, 120);

  text("quattro  ", 10, 150);
  text(a4, 80+a3, 150);

  text("cinque   ", 10, 180);
  text(a5, 80+a5, 180);

  text("sei      ", 10, 210);
  text(a6, 80+a6, 210);

}
void numeri()
{
float r = int(random(6)+1);
ro = int (r);

switch(ro) {
  case 1: 
  dado1 = loadImage("faccia1.gif");
  image(dado1, width/2, 0);
  a1++; 
  break;
  
  case 2: 
  dado2 = loadImage("faccia2.gif");
  image(dado2, width/2, 0);
  a2++; 
  break;
  
  case 3: 
  dado3 = loadImage("faccia3.gif");
  image(dado3, width/2, 0);
  a3++; 
  break;
  
  case 4: 
  dado4 = loadImage("faccia4.gif");
  image(dado4, width/2, 0);
  a4++; 
  break;
  
  case 5: 
  dado5 = loadImage("faccia5.gif");
  image(dado5, width/2, 0);
  a5++; 
  break;
  
  case 6: 
  dado6 = loadImage("faccia6.gif");
  image(dado6, width/2, 0);
  a6++; 
  break;
}
}

void mousePressed() {
a1=0; a2=0; a3=0; a4=0; a4=0; a5=0; a6=0;  
  redraw();
}

