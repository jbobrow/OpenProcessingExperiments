
void setup()
{
 size(1000,750) ;
 background (60,100,100); 
 fill ( 60,100,100) ;  
 noStroke () ;
 
}
void draw(){


int Size = 20; 
 int EXpos = mouseX ;
 int Ypos= mouseY ;

 ellipse( EXpos, Ypos, Size, Size ) ;
 fill (60,100,100 ) ;
 {
  if (mousePressed) {
    stroke(50,30,50);
    fill (50,40,30)
  } else {
    stroke(60,100,100);
  }

}
 }
  
