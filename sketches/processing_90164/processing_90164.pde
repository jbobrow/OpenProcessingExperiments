
size (200, 200);
background (15);// cor do fundo
fill (205,118,229);
rect (80, 80, 30, 30);// retângulo
strokeWeight (3);
stroke (190,99,225); // primeiras linhas após o retângulo
line (80, 70, 110, 70);// primeira linha hor. superior
line (70,80,70,110);// primeira linha vert. à esquerda
line (120,80, 120,110);// primeira linha vert. à direita
line (80,120,110, 120);// pimeira linha hor. inferior
int x= 10;
int y= 10;
stroke (163,76,198);// segundas linhas após o retângulo
fill (178, 70, 244);
line (80-x, 70-y, 110+x, 70-y);
line (70-y, 80-x, 70-y, 110+x);
line (120+y, 80-x, 120+y, 110+x);
line (80-x, 120+y, 110+x, 120+y);
int w= 20;
int z= 20;
stroke (131,47,165);// terceira linha após o retângulo
line (80-w, 70-z, 110+w, 70-z);
line (70-z, 80-w, 70-z, 110+w);
line (120+z, 80-w, 120+w, 110+z);
line (80-w, 120+z, 110+w, 120+z);
int a= 30;
int b= 30;
stroke (109,29,142);// quarta linha após o retângulo
line (80-a, 70-b, 110+a, 70-b);
line (70-b, 80-a, 70-b, 110+a);
line (120+b, 80-a, 120+a, 110+b);
line (80-a, 120+b, 110+a, 120+b);
int c= 40;
int d= 40;
stroke (69,15,90);// quinta linha após o retângulo
line (80-c, 70-d, 110+c, 70-d);
line (70-d, 80-c, 70-d, 110+c);
line (120+d, 80-c, 120+c, 110+d);
line (80-c, 120+d, 110+c, 120+d);
int e= 50;
int f=50;
stroke (44,8,59);// sexta linha após o retângulo
line (80-e, 70-f, 110+e, 70-f);
line (70-f, 80-e, 70-f, 110+e);
line (120+f, 80-e, 120+e, 110+f);
line (80-e, 120+f, 110+e, 120+f);
stroke (69, 15,90);
line (20, 20, 70,70);
line (120, 70, 170,20);
line (70,120,20,170);
line (120,120,170,170);
