
PImage foto;
int x=0;
int y=0;
void setup() {
         size(450,450);
          foto=loadImage("lena.jpg");
 }

void draw() {
   background(0,0,255);
   if(x>450)
   {
     x=0;
     y=0;
   }
   image(foto,x,y);
   x++;
   y++;
}   

