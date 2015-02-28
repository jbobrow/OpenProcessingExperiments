
int x,y;  // S'introdueixen les dos variables

PImage img;
PImage img2;

void setup()
{
  
  
  
  size (1000,660);  // Canvi del tamany de la pantalla
  img = loadImage("Espai.jpg");  // S'introdueixen les imatges de fons
  img2 = loadImage("millenium.jpg");


}

void draw()
{

image (img,0,0);
image (img2,-75,450);



x=mouseX;  // Es donan els valors a les variables per poder moure amb el mouse
y=mouseY;
 
  
    strokeWeight(3);      
    fill (5,5,5);
    stroke (250,250,250);
    line(50,525,x,y+25);
      
    strokeWeight(1);
    stroke (1);
    fill (250,250,250);
    rect(x-15, y+10, 30, 50);
    rect(x-15, y+60, 10, 35);
    rect(x+5, y+60, 10, 35);
    rect(x+15, y+20, 20, 10);
    rect(x-35, y+20, 20, 10);
    ellipse (x, y, 50, 50);
    fill (171,250,250);
    ellipse (x, y-5, 35, 25);
      
   
}



