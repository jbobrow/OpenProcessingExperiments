

//saveFrame(mitBillede.jpeg);


// mouseClicked()
{
  
    // this is the eventhandler for the mouseclick

}

void setup() { 
  size(800, 500);
 
  frameRate(60);
} 

color orbitGreen = color(54,224,52);
color planetBlue = color(22.0,34,165);
color black = color(0,0,0);

int x= 0,y = 0;
int orbitWith =300;
int orbitHeight =300;
int planetHeight = 50;
int planetWith = 50;

float planetAngle = 0;
float inc = TWO_PI/360.0;



int planetX = mouseX;
int planetY = mouseY;

void draw()
{

x = mouseX;
y = mouseY;


// orbit
//

//planet


background(#020205);


noStroke();
fill(orbitGreen);
ellipse(x,y,orbitWith+5,orbitWith+5);
noStroke();
fill(black);
ellipse(x,y,orbitWith,orbitWith);
 
planetAngle += inc;

if(planetAngle == TWO_PI)
{
    planetAngle = 0;
}

      planetY = (int)(sin(planetAngle)*(orbitWith/2));
      planetX = (int)(cos(planetAngle)*(orbitWith/2));

fill(planetBlue); 
ellipse(planetX+x,planetY+y,planetWith,planetWith);
  
  
}

