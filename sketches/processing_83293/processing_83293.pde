
float xPosition = 0;
float yPosition = 0;
float xSpeed = 1;
float ySpeed = 1;


void setup()
{
size (400,200) ;

background (170,0,255) ;

smooth() ;
}


void draw()
{

fill (225, 50, 2000) ;

stroke (230,150,200) ;

textAlign(CENTER);
text("Computer Apps",xPosition,yPosition);

xPosition = xPosition + xSpeed;
yPosition += ySpeed;


}
