
int venstreFodX = 30;
int venstreFodY= 340;

int hofteX = 45;
int hofteY = 310;

int hojreFodX = 60;
int hojreFodY = 340;

int halsX = hofteX;
int halsY = 280;

int hovedCentrumX = hofteX;
int hovedCentrumY = halsY-10;

int armKropX = hofteX;
int armKropY = halsY+10;

int venstreArmX = hofteX-10;
int venstreArmY = armKropY+10;

int hojreArmX = hofteX+10;
int hojreArmY = venstreArmY;

float rad = radians(10);
float radStop = radians(300);


void setup()
{
  size(600,600);
  frameRate(5);
}

void draw()
{
  background(255);
  arc(300, 100, 200, 100, 2, PI+4, PIE-10);
  //triangle(260,145,363,137,hofteX,230);
  line(259,145,hofteX+15,240);
  line(364,137,hofteX+15,240);
  fill(0);
  text("Aaaarghh!", 250, 100);
  noFill();
  
  hofteX = hofteX+15;
  halsX = halsX+15;
  armKropX = armKropX+15;
  hojreArmX = hojreArmX+15;
  venstreArmX = venstreArmX+15;
  hovedCentrumX = hovedCentrumX+15;
  
  
  if(venstreFodX != hojreFodX)
  {
    venstreFodX = venstreFodX+30;
  }
  else
  {
    hojreFodX = hojreFodX+30;
  }
  
  
 //venstre ben
 line(venstreFodX,venstreFodY,hofteX,hofteY);
 
 //højre ben
 line(hojreFodX,hojreFodY,hofteX,hofteY);
 
 //krop
 line(hofteX,hofteY,halsX,halsY);
 
 //venstre arm
 line(armKropX,armKropY,venstreArmX,venstreArmY);
 
 //Højre arm
 line(armKropX,armKropY,hojreArmX,hojreArmY);
 
 //hoved
 ellipse(hovedCentrumX,hovedCentrumY,20,20);
  
}
