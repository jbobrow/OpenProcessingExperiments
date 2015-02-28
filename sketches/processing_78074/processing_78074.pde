
PImage myImg;
int eX, eY, P; 

void setup ( )
{
     size (500, 500);
     background (155);
     myImg = loadImage ("xavier.jpg");
     eX = 110;
     eY = 480;
     P= 480;
}

void draw ( )
{
     background (155);       
     image (myImg,  0, 0);  
     fill (0);
     ellipse (eX, eY, 80, 80);  
     if (eY > P)
        {
           eY -= 1;
        }       
}

void mousePressed ( )
{
    P= mouseY;
}
