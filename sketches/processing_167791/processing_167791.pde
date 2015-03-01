
int x=120;
int y=120;
int c=#FC0303;
float a=#080000;
int l=#FFFFFF;
float i=#E7E8B4;
float d=#F8FC03;
float o=#FC0320;

void setup()
{ 
   size(650,650);
   background(i,d);  
}
void draw()
{ 
   background(i);  

  fill(c);
  ellipse(x,300,450,500);
  ellipse(x,300,450,500);
  fill(a);
  ellipse(x,300,500,400);
  fill(c);
  ellipse(x-50,300,450,350);
  fill(a);
  
  ellipse(x+150,200,250,250);
  fill(a);
  ellipse(x,300,100,150);
  fill(l);
  ellipse(x+250,200,100,100);
  fill(l);
  ellipse(x+150,200,100,100);
  fill(a);
  ellipse(x-100,200,100,100);
  fill(a);
  ellipse(x-200,300,100,150);
  fill(a);
  ellipse(x+150,200,50,50);
  fill(a);
  ellipse(x+250,200,50,50);
  ellipse(x+200,350,20,10);
  rect(x+200,100,90,10);
  rect(x+150,50,10,50);
  ellipse(x+150,50,20,20);
  ellipse(x+280,100,20,20);
  rect(x+150,450,10,100);
  ellipse(x+150,450,20,20);
  ellipse(x+150,550,20,20);
  rect(x+210,390,10,100);
  ellipse(x+210,390,20,20);
  ellipse(x+210,490,20,20);
  rect(x,470,10,90);
  ellipse(x+10,480,20,20);
  ellipse(x+10,560,20,20);
  rect(x-120,480,10,90);
  ellipse(x-120,475,20,20);
  ellipse(x-120,575,20,20);
  a=random(255);
  d=random(2-18);
  o=random(255);
 x=x+10;
  
}

