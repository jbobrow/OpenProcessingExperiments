
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
  myFont = createFont("verdana", 10);
  textFont(myFont);
  scritte();
 noLoop(); 
 }


void draw() {
background (127);
noStroke();

numeri(); 
scritte(); 

} 


void scritte()
{
  text("uno      ", 10, 60);
  text(a1, 70, 60);
  
  text("due      ", 10, 70);
  text(a2, 70, 70);
  
  text("tre      ", 10, 80);
  text(a3, 70, 80);

  text("quattro  ", 10, 90);
  text(a4, 70, 90);

  text("cinque   ", 10, 100);
  text(a5, 70, 100);

  text("sei      ", 10, 110);
  text(a6, 70, 110);

}
void numeri()
{
float r = int(random(6)+1);
ro = int (r);

switch(ro) {
  case 1: 
  dado1 = loadImage("faccia1.gif");
  image(dado1, 0, 0);
  a1++; 
  break;
  
  case 2: 
  dado2 = loadImage("faccia2.gif");
  image(dado2, 0, 0);
  a2++; 
  break;
  
  case 3: 
  dado3 = loadImage("faccia3.gif");
  image(dado3, 0, 0);
  a3++; 
  break;
  
  case 4: 
  dado4 = loadImage("faccia4.gif");
  image(dado4, 0, 0);
  a4++; 
  break;
  
  case 5: 
  dado5 = loadImage("faccia5.gif");
  image(dado5, 0, 0);
  a5++; 
  break;
  
  case 6: 
  dado6 = loadImage("faccia6.gif");
  image(dado6, 0, 0);
  a6++; 
  break;
}
}

void mousePressed() {
 redraw();
}

