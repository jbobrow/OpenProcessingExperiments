
int x,xv,yv;

void setup()
{
size(900, 500);
background(0,0,0); //taille et couleur de la page
xv=400;
yv=350;
}

void draw()
{
    background(0);
    voiture();
    line(300,0,300,500);
    line(600,0,600,500);
    line(900,0,900,500);
    stroke(255,255,255);
    int a=20;
    while(a<200);
    {
        line(0,a,20,a);
        a=a+20
    }
} //fonction annoncant la voiture

void voiture()
{
    fill (255,255,255);
    rect (xv,yv,100,100);
}

void keyPressed()
{
if (keyCode == RIGHT){
    xv=xv+300;
}
else (keyCode == LEFT){
    xv=xv-300
}
}

