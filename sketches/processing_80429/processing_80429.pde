
PImage mountA;
PImage mountB;

float k=100;
int y=30;
String s = "A";
void setup() {
 size(1400,150);
 background(255);
 mountA=loadImage("A.png");
 mountB=loadImage("B.png");
 
 
 println(s);//A
 scale(0.7);
}

void draw()
{
  background(255);
  
 if(s.length()<70){  
  s = nextLevel(s); 
 println(s);}
 
  k-=0.5;
  translate(k,0); 
  drawString(s, k, y);
}

String nextLevel(String s)
{
  String s2 = "";
  for (int i=0; i<s.length(); i++)
  {
    char c = s.charAt(i);
    if (c == 'A') { s2 += "AB"; }
    if (c == 'B') { s2 += "AAB"; }
  }
  
  return s2;
}

void drawString(String s, float x, float y)
{
  for (int i=0; i<s.length(); i++)
  {
    char c = s.charAt(i);
    if (c=='A') { 
      image(mountA, x, y); 
      x += 300;
    }
    
    if (c=='B')
    {
      image(mountB, x, y);
      x += 300;
    }
  }
}



