
//פרופסור איקס יכול להרים את העיגול בעזרת כח המחשבה לאן שאתם רוצים, בקו ישר ועי לחיצה.



PImage myImg;
int eX, eY, P, A; 

void setup ( )
{
         size (500, 500);
         background (255);
         myImg = loadImage ("xavier.jpg");
        eX = 110;
        eY = 480;
        P= 480;
}

void draw ( )
{
          image (myImg,  0, 0);
          tint (255 , 0.1);
          fill (0);
          stroke (255,255,0);
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
