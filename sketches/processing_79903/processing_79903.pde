
PImage foto;
int y=-500;
int x=-500;
void setup()
{
  size(400,400);
  foto=loadImage("bones.jpg");
}
 
void draw()
{
  background(0);
    if((y!=0)&&(x!=0))
    {
       image(foto,y,x);
       y++;
       x++;
       print(x);
    }
    else
     {
       image(foto,y,x);
       noLoop();
     }
 }
