
char juan[] = {'J','u','a','n'};
int i;
float j=100;
void setup()
{
  size(400, 380);
  fill(0,0,255);
}
void draw()
{
   background(0,0,0);
   textFont(createFont("BatangChe-48",80));
   j-=1;
   println(i);
   if(j<=3) 
          {text("J", 100, height/2);}
   else
          {text(juan[0],random(-390,390), random(-390,3900));}
   if(j<=2)
          {text("u", 140, height/2);} 
   else 
          {text(juan[1],random(-290,500),random(-290,290));}
   if(j<=1)
          {text("a", 180, height/2);}
   else
          {text(juan[2],random(-100,100),random(-100,100));}
   if(j<=0)
          {text("n", 220, height/2);}
   else
          {text(juan[3], random(-300,400),random(-300,400));}
 }
