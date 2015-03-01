
int x=0;
int y=0;

int a=(#383838);
int s=(#05DCFF);
int c=10;

float r;
float g;
float b;

float w;
float v;
float z;

void setup()
{
size(1000,1000);
background(#00E4FF); 
}

void draw()
{
  
  r=random(255);
  g=random(255);
  b=random(255);
  
  w=random(800);
  v=random(800);
  z=random(800);
  
  background(c);
  fill(r,g,b);
  ellipse(w,v,60,60);

//orejas
fill(#ffffff);
triangle(mouseX+230,mouseY+150,mouseX+430,mouseY+180,mouseX+330,mouseY+320);

triangle(mouseX+680,mouseY+150,mouseX+430,mouseY+180,mouseX+580,mouseY+320);
//cabeza
fill(#ffffff);
ellipse(mouseX+450,mouseY+350,400,350);
fill(#000000);

//ojos
  ellipse(mouseX+370,mouseY+300,90,150);
  fill  (#ffffff);
  ellipse(mouseX+385,mouseY+270,40,80);
  fill(#000000);
  ellipse(mouseX+530,mouseY+300,90,150);
fill  (#ffffff); 
  ellipse(mouseX+545,mouseY+270,40,80);
  //nariz
  fill(#393939);
  triangle(mouseX+430,mouseY+380,mouseX+470,mouseY+380,mouseX+450,mouseY+400);
  ellipse(mouseX+450,mouseY+380,40,20);
  
  //rayas cabeza
  fill(r,g,b);
  triangle(mouseX+340,mouseY+200,mouseX+550,mouseY+200,mouseX+450,mouseY+240);
  ellipse(mouseX+455,mouseY+182,140,13);
  
  triangle(mouseX+250,mouseY+380,mouseX+330,mouseY+410,mouseX+265,mouseY+420);
  triangle(mouseX+265,mouseY+420,mouseX+330,mouseY+440,mouseX+285,mouseY+450);
  
  triangle(mouseX+530,mouseY+410,mouseX+635,mouseY+420,mouseX+650,mouseY+380);
  triangle(mouseX+530,mouseY+440,mouseX+615,mouseY+450,mouseX+635,mouseY+420);
  
  
  //hocico
  
  noFill();
  ellipse(mouseX+450,mouseY+425,140,120);
  fill(#383838);
   ellipse(mouseX+450,mouseY+450,110,80);
  
  c=a+s;

  

  
}
