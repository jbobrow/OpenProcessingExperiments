
//PATRICIA PAGNO TRABALHO FINAL
void setup(){
size(200, 200); 
background(0);
frameRate (10); 
colorMode(HSB);
}
   
int c=0;

//Estrelas
void draw() {
stroke (255);
point (random (0, 200), random (0, 180));
stroke (0);
//Grama
fill(#338B39);
rect(0,165,200,165);
// Calçada
strokeWeight(3);
stroke(255);
fill(#716F67);
rect(-2,180,205,178);
noStroke();
// Prédio
fill(#D3CCB1); 
rect(50, 0, 102, 179);
noStroke();
// Tijolinhos
fill(#BC661E);
int a; 
int b;
for (a=53;a<148;a=a+7)
{
for (b=0;b<110;b=b+5
)
{
rect(a, b,5,3);
}
}
//Divisão 
stroke(#716F67);
line(48, 50, 152, 50); 
line(48, 110, 152, 110);
// Janelas
stroke(255);
fill(#716F67);
int x;
int y;
for (x=60;x<150;x=x+25)
{
for (y=20;y<150;y=y+35)
{
rect(x, y, 10, 15);
{
   
  }

}
}
//Porta
noStroke();
stroke(255);
fill(#473290); 
ellipse(103,155,25,20);
rect(90,155,25,25);
//Poste
noStroke();
fill(#F7F720);
rect(25,150,8,8);
rect(175,150,8,8);
fill(#716F67);
rect(28,158,2,21);
rect(179,158,2,21);
//Lua
noStroke();
fill(random(255),110,255,50);
  
if(mousePressed == true) { 
ellipse(mouseX, mouseY, 20, 20);
}
else {
ellipse(189,0,70,70);
}

{
//Carro
fill (0);
rect (c, 180, 25, 15);
if (c<=200)
{
c++;

}

//assinatura
PFont fonte;
{
fonte = createFont("Calibri", 12);
textFont(fonte);
textAlign(RIGHT);
fill (255);
text("Patrícia Pagno 2013", width-10, height-10);
}

  }
   
  }
