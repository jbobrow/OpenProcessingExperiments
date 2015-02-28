
void setup()
{
  size(500,500);
  smooth();
  

}
 
void draw()
{
  
  //création d'une variable rotative
  
int VR1;
VR1 = mouseX;
int VR2;
VR2= mouseY;

fill(255);
translate(width/2, height/2);
for (int i=0;i<360;i+=10){
rotate(radians(10));
triangle(VR1, VR2, VR1+70, VR2+60, VR1+20, VR2+60);}


//création d'une variable de cercle

fill (0);
ellipse(0,0,mouseX,mouseX);




}


