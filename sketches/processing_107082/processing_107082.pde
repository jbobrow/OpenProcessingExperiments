
PFont font;
int e,a=1, cont, acc=0, temp;
String s = "a";
void setup()
{
  size(800 , 600);
  //frameRate(8);
  smooth();
  font = loadFont("Consolas-Italic-48.vlw"); 
  textFont(font, 600);
  e=0;
  background(0);
}
void draw()
{
  //println(millis()-temp);
  if(keyPressed && key == ' ')
  {
    acc=1;
    temp=millis();
  }  
  if(millis()-temp >=300000)
  {
    acc=0; 
  }
  if(millis()-temp >=360000 && millis()-temp<=420000)
  {
    acc=2; 
  }
  if (acc==0)
  {
    background(0);
    smooth();
    if(a==1)
    {
      s= "a";
    }
    if(a==2)
    {
      s= "e";
    }
    if(a==3)
    {
      s= "i";
    }
    if(a==4)
    {
      s= "o";
    }
    if(a==5)
    {
      s= "u";
    }
    fill(255);
    text(s+"" ,width/4  ,(height*3)/4);
  }
    
  if(acc==1)
  {
  if (millis()-e >= 1000) 
  {
    background(0);
    fill(190);
    if(a==1)
    {
      s= "a";
    }
    if(a==2)
    {
      s= "e";
    }
    if(a==3)
    {
      s= "i";
    }
    if(a==4)
    {
      s= "o";
    }
    if(a==5)
    {
      s= "u";
    }
    e=millis();
    a=int(random(1,6));
    for(int i=0; i<5; i++)
    {
      if (a==cont)
      {
        a=int(random(1,6));
      }
    }
    cont = a;
    text(s+"" ,width/4  ,(height*3)/4);
  }
  }
  if (acc==2)
  background(0);
}
