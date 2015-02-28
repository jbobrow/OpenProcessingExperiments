
// Julia Yesika Cruz Martinez

String mi_nombre = "JULIA";
String mi_nombre2 = "YESIKA";
char mi_nombre1[] ={'J','U','L','I','A','Y','E','S','I','K','A'};
int win[] = 
new int[15];
float r =300;
int z;
void setup()
{
  size(400, 400);  
  fill(255, 255, 255); 
smooth(); 
}
void draw()
{
    background(0);
    fill(255,0,255);
    textFont(createFont("Arial-Black-48.vlw",50));  
    for(z=0;z<10;z++)
      win[z] = (int)random(15,250);r-=1;
   if(r<=1)
    {
      textAlign(RIGHT);
     // text(mi_nombre[],z);
      text(mi_nombre,width/2, height/2);
      textAlign(LEFT);
      fill(0,255,255);
      text(mi_nombre2,width/2, height/2);
    }
    else
 {
    for(z=0;z<=6;z++)
    text(mi_nombre1[z],
    r*cos(r)+150+win[z],
    r*sin(r)+150+win[z+1]);


    }
}

