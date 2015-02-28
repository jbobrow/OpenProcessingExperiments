
//Prog. dinamica

float x1,x2;
float y1,y2;
float hue=0;
float sat=0;
float bri=0;

void setup()
{
size(600, 600);
background(255); 
colorMode(HSB, 360,100,100);//Hue (0-360 grados), Saturation(0-100), Brightness (0-100)
}

void draw()
{
//Info declarada que pinta cada frame

hue=hue+0.5;
sat=sat+100;
bri=bri+100;

fill(hue,sat,bri);
rect(0,0,width,height);

x1=x1+1;
x2=x2-1;
y1=y1+1;
y2=y2-1;
line(x1,y1,x2,y2);
}
