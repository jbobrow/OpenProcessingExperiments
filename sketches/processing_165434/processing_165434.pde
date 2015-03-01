

void setup() 
{ 
    size(400,400); 
    Bild = loadImage("http://fc00.deviantart.net/fs71/f/2012/141/3/6/young_link_idle_test_by_gregarlink10-d50jme1.gif");
    x = 22;
    y = 0;
    Richtung = 0;
 

}

void draw()  
{  
   
    if (x > 320) // rechter Bildschirmrand
    Richtung = 1;
    
    if (x < 20) // linker Bildschirmrand
    Richtung = 0;
    
    if ( Richtung == 0) // wen, dan lauf nach rechts
    x = x + 1;
 
     if (Richtung == 1) // wen, dan lauf nach links
     x = x - 1;
    
    background(0);
    image (Bild, x,y);
    
    
}
