
void setup()
{
size(400,400);
 background(#6F6A69);
smooth(); 

 
}

void draw()
{

 background(#6F6A69);
smooth(); 

// je déclare une variable de type integer
int MaPositionY;

// je lui attribue un chiffre garce au signe =
MaPositionY = 200;

int MaPositionX;
MaPositionX = 50;

   
fill(mouseX,mouseY,140,110);

stroke(mouseX,mouseY,140,110);
// je dessine une ellipse dont la coordonée y est la valeur contenue dans ma variable
ellipse(MaPositionX,MaPositionY,50,50);


line(MaPositionX,MaPositionY,400,250);
line(MaPositionX,MaPositionY,400,200);
line(MaPositionX,MaPositionY,400,300);
line(MaPositionX,MaPositionY,400,100);
line(MaPositionX,MaPositionY,400,350);
line(MaPositionX,MaPositionY,400,400);
line(MaPositionX,MaPositionY,400,150);
line(MaPositionX,MaPositionY,400,50);
line(MaPositionX,MaPositionY,400,0);


MaPositionX = MaPositionX+10;

ellipse(MaPositionX,MaPositionY,50,50);
 
 MaPositionX = MaPositionX+50;
 
 ellipse(MaPositionX,MaPositionY,50,50);
 
 MaPositionX = MaPositionX+20;
 
 ellipse(MaPositionX,MaPositionY,50,50);
 
 MaPositionY = MaPositionY+10;
 
 ellipse(MaPositionX,MaPositionY,50,50);

}




