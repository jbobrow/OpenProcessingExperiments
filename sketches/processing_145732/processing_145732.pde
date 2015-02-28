
int x =0;
int puckgrow =5;
int y = 0;
int yGrow = 10;
float z =random(0,500);

void setup()
{size(750,500);
frameRate(10);}

void draw()
{
background(0);

stroke(255);

line(70,250,674,250);

fill(150,0,255);
ellipse(355,250,100,100);

fill(255,3,19);
rect(0,150,75,200);

fill(3,109,255);
rect(674,150,75,200);

fill(150,0,255);
ellipse(x,z,50,50);
x = x + puckgrow;
if (x==750||x==0)
{puckgrow = puckgrow*-1;}

fill(255,3,19);
ellipse(180,mouseY,75,75);

fill(3,109,255);
 ellipse (550,y,75,75);
 y = y + yGrow;
 if (y==0||y==450)
 {
   yGrow = yGrow*-1;}
if(mousePressed) {z=random(0,500); x=250;}


}
