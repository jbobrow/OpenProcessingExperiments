
//Jenny He
//Carnegie Mellon University, Human-Computer Interaction

size(400,400);
background(121,121,121);
background(46,84,116);
smooth();
noStroke();

//background pattern
fill(GRAY,70);

//top bar extension
int x_val=0;
int alpha_val=50;
while(x_val<=135)
{
 fill(174,240,240,alpha_val);
 rect(x_val,100,10,10); 
 x_val=x_val+10;
 alpha_val=alpha_val+10;
}

//initials setup
translate(135,100);

//horizontal top bar of J
fill(174,240,240);
rect(0,0,100,10);

//curve of J using Quads
quad(45,115,55,115,45,135,35,135);
quad(0,125,40,125,40,135,10,135);
quad(0,100,10,100,10,125,0,125);

//left shadow vertical of J in ellipses
fill(240,174,174);
int i=0;
int y_val=20;
while(i<5)
{
 ellipse(54,y_val,10,10);
 y_val=y_val+20;
 i++;
}

//left vertical of J in ellipses
fill(174,240,240);
ellipse(50,20,10,10);
ellipse(50,40,10,10);
ellipse(50,60,10,10); //middle dot
ellipse(50,80,10,10);
ellipse(50,100,10,10);

//horizontal of H in ellipses
fill(240,174,174);
ellipse(70,60,15,15);
ellipse(90,60,12,12);
ellipse(110,60,15,15);
ellipse(130,60,18,18);

//right vertical of H in ellipses)
ellipse(130,5,10,10);
ellipse(130,20,12,12);
ellipse(130,40,15,15);
//ellipse(130,60,12,12);
ellipse(130,80,13,13);
ellipse(130,100,10,10);
ellipse(130,120,10,10);


//right vertical of H extension
fill(240,174,174,80);
int dist = 20;
ellipse(130,140,10,10);
y_val = 140;
alpha_val = 100;

int x =0;
while (x<=10)
{
  fill(240,174,174,alpha_val);
  ellipse(130,y_val,10,10);
  y_val=y_val+20;
  alpha_val = alpha_val-10;
  x++; 
}





