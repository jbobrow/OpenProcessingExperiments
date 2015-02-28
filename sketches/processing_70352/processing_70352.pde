
int blast2 = 650;
int q = 232;
int w = 42;
int e = 115;
int tip2 = 650;
int blast = 150;
int tip = 150;
int x = 49;
int y = 255;
int z = 240;
int impact = 60;
int c = 0;
int o = 600;
int t = 300;
int j = 400;
void setup()
{
  size(800,600);
  frameRate(80);
}
void draw()
{
  gallickgun();
  vegeta();
  hair();
  hair2();

  kamehameha();
  
  goku();
  
  
  
}
void gallickgun()
{
  background(197);
  stroke(q,w,e);
  q=q+23;
  w=w+213;
  e=e+140;
  if(q>255)
  {
    q=232;
  }
  if(q<232)
  {
    q=255;
  }
  if(w>255)
  {
    w=42;
  }
  if(w<42)
  {
    w=255;
  }
  if(e>255)
  {
    e=115;
  }
  if(e<115)
  {
    e=255;
  }
  ellipse(tip2,300,40,40);
  ellipse(650,300,40,40);
  tip2=tip2-1;
  if(tip2<400)
  {
    tip2=400;
  }
  strokeWeight(20);
  line(blast2,300,650,300);
  blast2=blast2-1;
  if(blast2<400)
   {
     frameRate(10);
    noStroke(); 
    fill(147,26,4);
    ellipse(400,300,impact,impact);
    impact=impact+10;
  }
  if(impact>900)
  {
    background(147-c,26-c,4-c);
    c=c+1;
  }
  if(c>147)
  {
    println("The End");
    fill(255);
    textSize(100);
    text("The End",200,t);
    textSize(50);
    text("Credits:Joe Liang",200,j);
    t=t-1;
    j=j-1;
    
  }
  
  
}
void vegeta()
{
  stroke(0);
  line(700,250,700,350);
  line(700,300,680,300);
  line(700,350,680,400);
  line(700,350,720,400);
  noStroke();
  fill(0);
  ellipse(700,250,60,60);
}
void kamehameha()
{
  stroke(x,y,z);
  x=x+206;
  y=y+0;
  z=z+15;
  if(x>255)
  {
    x=49;
  }
  if(x<49)
  {
    x=255;
  }
  if(z>255)
  {
    z=240;
  }
  if(z<240)
  {
    z=255;
  }
  ellipse(tip,300,40,40);
  ellipse(150,300,40,40);
  tip=tip+1;
  if(tip>400)
  {
    tip=400;
  }
  strokeWeight(20);
  line(blast,300,150,300);
  blast=blast+1;
  if(blast>400)
  {
    noStroke();
    fill(147,26,4);
    ellipse(400,300,impact,impact);
    impact=impact+10;
  }
   if(impact>900)
  {
    background(147-c,26-c,4-c);
    c=c+1;
  }
  
  if(blast>400)
  {
    blast=400;
  }
  if(c>147)
  {
    println("The End");
    fill(255);
    textSize(100);
    text("The End",200,t);
    textSize(50);
    text("Credits:Joe Liang",200,j);
     t=t-1;
     j=j-1;
  }
  
}
void goku()
{
  stroke(0);
  line(100,250,100,350);
  line(100,300,120,300);
  line(100,350,80,400);
  line(100,350,120,400);
  noStroke();
  fill(0);
  ellipse(100,250,60,60);
  
  
  
}
void hair()
{
  fill(245,235,30);
  triangle(100,180,85,240,115,240);
  triangle(50,240,85,240,85,270);
  triangle(50,200,85,240,115,240);
  triangle(150,240,115,240,115,270);
  triangle(150,200,105,240,115,270);
  triangle(130,190,90,240,115,270);
  triangle(70,190,80,240,115,240);
  triangle(50,225,85,250,115,230);
  triangle(150,225,115,230,105,270);
  fill(0);
  ellipse(100,250,60,60);
}
void hair2()
{
  fill(245,235,30);
  triangle(100+o,180,85+o,240,115+o,240);
  triangle(50+o,250,85+o,240,85+o,270);
  triangle(50+o,200,85+o,240,115+o,240);
  triangle(150+o,250,115+o,240,115+o,270);
  triangle(150+o,200,105+o,240,115+o,270);
  triangle(130+o,190,90+o,240,115+o,270);
  triangle(70+o,190,80+o,240,115+o,240);
  triangle(50+o,225,85+o,250,115+o,230);
  triangle(150+o,225,115+o,230,105+o,270);
  fill(0);
  ellipse(100+o,250,60,60);
}
