
size(200,200);
background(255);

int raio = 10;
int larg = 10;
int x = 0;
int y=0;

ellipse(x,x,larg,raio);

while (x<200){
ellipse(x,y,10,10);
x=x+10;
y=x*x/200;
}
