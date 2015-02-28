
/**Bolhas.pde<p>
  *Giovanna Marrone<p>
  *Licença: Este trabalho está licenciado sob uma Licença Creative Commons Atribuição  3.0 Não Adaptada. <p>
  *Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by/3.0/.<p>
  *17 de dezembro de 2012<p>
  */
size(200,200);
background(0);
fill(85,10,250);
noStroke();
int x=10;
int y=x*x;
noStroke();
ellipse(x,y+10,50,50);
fill(60,108,247);
x=x+35;
noStroke();
ellipse(x,x,40,40);
fill(77,162,245);
x=x+y;
noStroke();
ellipse(x,x,30,30);
fill(56,203,242);
noStroke();
ellipse(x-40,y-10,20,20);
fill(12,229,217);
noStroke();
ellipse(x+10,y+10,10,10);
x=y+100;
noStroke();
ellipse(x,y,50,50);
fill(114,250,242);
noStroke();
ellipse(x-150,y+47,27,27);
fill(191,255,251);
