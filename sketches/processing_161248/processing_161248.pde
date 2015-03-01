
void setup()
{
 size(1000,750) ;
 background (0,0,300);
 fill ( 0,50,20) ; 
 noStroke () ;
}
void draw(){
 
int Size = 20;
 int EXpos = mouseX ;
 int Ypos= mouseY ;
 
 ellipse( EXpos, Ypos, Size, Size ) ;
 fill (mouseX,mouseY,ellipse ) ;
 
  }
