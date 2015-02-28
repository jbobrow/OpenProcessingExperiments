
void setup()
{
  size(500,500);
  frameRate(45);
}

int hovedeX = 164;
short hovedeY = 240;

short kropTop = 260;
short kropBund = 340;
int kropX = 164;

int armX = 164;;
short armY = 262;
int arm1X = 190;
short armY2 = 325;

int arm2X = 140;

int benX = 164;
short benY = 340;
int ben1X2 = 144;
short benY2 = 400;

int ben2X2 = 185; /*185, 164*/

void draw()
{
  background(255,255,255);
  //Stickman af Kasper T.
  //Redigeret af Peter L.
  fill(240,222,27);
  stroke(252,195,69);
 
  //Hovede
  ellipse(hovedeX,hovedeY,40,40);
   
  //Krop
  stroke(0,0,0);
  line(kropX,kropTop,kropX,kropBund);
   
  //Arme
  line(armX,armY,arm1X,armY2);
  line(armX,armY,arm2X,armY2);
   
  //Ben
  line(benX,benY,ben1X2,benY2);
  line(benX,benY,ben2X2,benY2);
  
  //Hovede bevægelse
  hovedeX = hovedeX +1;
  
  //Krop bevægelse
  kropX = kropX + 1;
  
  //Arm bevægelse
  armX = armX + 1;
  arm1X = arm1X + 1;
  arm2X = arm2X + 1;
  
  //Ben bevægelse
  benX = benX + 1;
  ben1X2 = ben1X2 + 1;
  ben2X2 = ben2X2 + 1;
}
