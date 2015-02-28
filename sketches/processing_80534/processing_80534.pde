
void setup()
{
  size (920,250);
  background(0);
}
char A=65, B=97;
int a=2, b=2;
PFont myFont;
void draw()
{
  if (A <=90)
  {
  myFont = loadFont("AgencyFB-Reg-48.vlw"); 
  textFont(myFont);
  text(A, a, 80);
   A++;
   a+=35;
  } 
 if(A > 90)
 {
 if (B <=122)
  { 
  myFont = loadFont("AgencyFB-Reg-48.vlw"); 
  textFont(myFont);
  text(B, b, 180);
   B++;
   b+=30;
  } 
 }
}


