
float watch;
PImage img;
PImage img2;
PImage img3;
PImage img4; 
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;

void setup () 
{
size (400,400);
img = loadImage("wildmutt.jpeg"); 
img2 = loadImage("upgrade.jpeg");
img3 = loadImage ("ghostfreak.jpeg");
img4 = loadImage ("ripjaws.jpeg");
img5 = loadImage ("heatblast.jpeg");
img6 = loadImage("fourarms.jpeg");
img7 = loadImage("diamondhead.jpeg"); 
img8 = loadImage("xlr8.jpeg"); 
img9 = loadImage("graymatter.jpeg"); 
img10 = loadImage("stinkfly.jpeg"); 
}
void draw ()
{
watch = random (1,11);

//clear();
if (mousePressed)
{ if (watch >=1 && watch <= 2) {background (0); image(img,85,99);}
 if (watch >=2 && watch <=3) {background (0); image (img2,85,99);}
 if (watch >=3 && watch <=4) {background (0); image (img3,85,99);}
 if (watch >=4 && watch <=5) {background (0); image (img4,85,99);}
 if (watch >=5 && watch <=6) {background (0); image (img5,85,99);}
 if (watch >=6 && watch <=7) {background (0); image (img6,85,99);}
 if (watch >=7 && watch <=8) {background (0); image (img7,85,99);}
 if (watch >=8 && watch <=9) {background (0); image (img8,85,99);}
 if (watch >=9 && watch <=10) {background (0); image (img9,85,99);}
 if (watch >=10 && watch <=11) {background (0); image (img10,85,99);}
}
else
{
fill (#C0C0C0);
rect (0,170,60,90);
rect (350,170,70,90);
fill (#808080);
ellipse (200,200,320,320);
fill (#00FF00);
arc (200,240,360,360,4.2,5.5);
arc (200,160,360,360,1,2.3); 
}  
//delay (1000);
//clear ();
}





