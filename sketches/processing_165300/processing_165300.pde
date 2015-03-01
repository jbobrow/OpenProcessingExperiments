

float a, b, c;

void setup()
{
size( 800,800); 
}

void draw()
{
  background(120);
 for (int a = 0; a<800 ;a+=27 )
 {
   for (int b =0; b<800 ;b+=13) 
  {
    float d = random(110,242);
    float d1 = random(73,189);
    float d2 = random(29,60);
    fill(d,d1,d2);
    stroke(0);
    float ud = random(-3,4);
    curve(a+5,b+25+ud,a+10,b+10,a,b,a+10,b+10+ud);
    curve(a+30,b+90,a+20,b,a+10+ud,b+10,a+20,b);
  }
 }
fill(5,184,255,30);
 noStroke();

 quad(0,c,0,c+100,c+100,0,c,0);
 c+=20; 
 if(c>2000)
 {c=0;}
 
}

