
boolean triangulo=false;
boolean circulo=false;
boolean cuadrado=false;
boolean goma=false;
int d=1;
int h=1;
int f=1;
int k=1;
int v=15;
int b=15;
int g=30;
int m=30;
int c=15;
int l=15;
void setup()
{
size(500,500);
background(255);
   
fill(#2C4AE8);
rect(450,0,50,50);
fill(#E82C4F);
rect(450,50,50,50);
fill(#2CE84D);
rect(450,100,50,50);
fill(#02D3D8);
rect(450,150,50,50);
fill(#FCF508);
rect(450,200,50,50);
fill(#FF7205);
rect(450,250,50,50);
fill(#FF05EF);
rect(450,300,50,50);


fill(0);
rect(0,440,60,60);
fill(#109B69);
triangle(10,490,30,445,50,490);

fill(#109B69);
rect(60,440,60,60);
fill(0);
ellipse(90,470,40,40);

fill(0);
rect(120,440,60,60);
fill(#109B69);
text("CUADRO",125,470);
 
fill(#109B69);
rect(180,440,60,60);
fill(0);
text("GOMA",190,470);
}

void draw()
{
 if(triangulo==true){
    if(mousePressed){
      strokeWeight(d);
      triangle(mouseX,mouseY,mouseX+30,mouseY,mouseX+15,mouseY-15);
    }
  }
 if(cuadrado==true){
   if(mousePressed){
     strokeWeight(h);
     rect(mouseX,mouseY,v,b);
   }
 }
  if(goma==true){
    if(mousePressed){
      strokeWeight(f);
      rect(mouseX,mouseY,g,m);
    }
  }
  if(circulo==true){
    if(mousePressed){
      strokeWeight(k);
      ellipse(mouseX,mouseY,c,l);
    }
  }
if(mousePressed)
{
line(pmouseX,pmouseY,mouseX,mouseY);
}
  
  if(mouseX>450 && mouseY<50)
  {
  if (mousePressed)
  {
    stroke(#2C4AE8);
  }
  }
  else if(mouseX>450 && mouseY>50 && mouseY<100) 
  {
    if(mousePressed)
  {
    stroke(#E82C4F);
  }
  }
   else if(mouseX>450 && mouseY>100 && mouseY<150) 
  {
    if(mousePressed)
  {
    stroke(#2CE84D);
  }
  }
   else if(mouseX>450 && mouseY>150 && mouseY<200) 
  {
    if(mousePressed)
  {
    stroke(#02D3D8);
  }
  }
   else if(mouseX>450 && mouseY>200 && mouseY<250) 
  {
    if(mousePressed)
  {
    stroke(#FCF508);
  }
  }
   else if(mouseX>450 && mouseX<500 && mouseY>250 && mouseY<300) 
  {
    if(mousePressed)
  {
    stroke(#FF7205);
  }
  }
    else if(mouseX>450 && mouseX<500 && mouseY>300 && mouseY<350) 
  {
    if(mousePressed)
  {
    stroke(#FF05EF);  
  }
  }
   else if(mouseX>0 &&mouseX<50 && mouseY>450 &&mouseY<500){
  if (mousePressed)
  {
     stroke(150);
  fill(150);
  triangulo=!triangulo;
  circulo=false;
  cuadrado=false;
  goma=false;
  }
  
   }
    else if(mouseX>100 &&mouseX<150 && mouseY>450 &&mouseY<500){
  if (mousePressed)
  {
     stroke(#D61E1E);
  fill(#D61E1E);
  cuadrado=!cuadrado;
  circulo=false;
  triangulo=false;
  goma=false;
  }
  
   }
else if(mouseX>150 &&mouseX<200 && mouseY>450 &&mouseY<500){
  if (mousePressed)
  {
     stroke(#FFFFFF);
  fill(#FFFFFF);
  goma=!goma;
  circulo=false;
  triangulo=false;
  cuadrado=false;
  }
}
else if(mouseX>50 &&mouseX<100 && mouseY>450 &&mouseY<500){
  if (mousePressed)
  {
     stroke(#DC33F0);
  fill(#DC33F0);
  circulo=!circulo;
  goma=false;
  triangulo=false;
  cuadrado=false;
  }
}
    }

