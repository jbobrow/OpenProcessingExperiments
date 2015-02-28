
float a,b;
int contador=0;
void setup()
{
size(400,400);
background(255);
rectMode(CORNERS);
}
void draw()
{
  
}
void mouseClicked()
{
contador++;
if(contador==1)
    {
    line(mouseX,0,mouseX,400);
    a=mouseX;
    }
   else if(contador==2)  
      {
      line(mouseX,0,mouseX,400);
      b=mouseX;
      }
     else if(contador>=3)
         {
             if(((a<b)&&(mouseX>=a)&&(mouseX<=b))||((a>b)&&(mouseX>=b)&&(mouseX<=a)))
             {
             println("entro");
             noStroke();
             smooth();
             fill(0);
             rect(a,0,b,400);
             }
         }
}

