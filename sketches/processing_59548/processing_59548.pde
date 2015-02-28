
// Rappresentazione grafica di una circonferenza secondo le più comuni metriche (diatanze) nel piano euclideo
void setup() 
{
  //This code happens once, right when our sketch is launched
 size(800,800);
 int i,j;
 background(255,255,255);
 smooth();
 //fill(240,15,15);
 color red = color(240, 15, 15);
 color yellow = color(245,239,121);
 color green=color(73,203,31);
 int centrox=width/2;
 int centroy=height/2;
 line(0,centroy,width,centroy);
 line(centrox,0,centrox,height);
 //fill(240,15,15);
 for(i=-centrox;i<centrox;i++)
 {
 for(j=-centroy;j<centroy;j++)
 {
   float x=i;//random(-500,500);
   float y=j;//random(-500,500);
 if(D_Euclide(x,y,0,0)<=150.0) set(ceil(x)+centrox,ceil(y)+centroy,red);//point(x+500, y+500); 
 if(D_p(x,y,200,200,1.7)<=150) set(ceil(x)+centrox,ceil(y)+centroy,yellow);//;point(x+500, y+500);
//if(D_taxi(x,y,0,0)<=150)
if(D_chebichev(x,y,100,100)<=100) set(ceil(x)+100,ceil(y)+100,green);//; point(x+500, y+500);
 
 }
 }
};
float maxvalue(float a,float b)
{
  float maxval;
if(a<b) maxval=b;
else
maxval=a;
return maxval;
}
//Distanza Euclidea
float D_Euclide(float x1,float y1,float x2,float y2)
{
float D;
D=sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
return D;
}
// Distanza del Taxi
float D_taxi(float x1,float y1,float x2,float y2)
{
float D;
D=abs(x2-x1)+abs(y2-y1);
return D;
}
// p-Distanza
float D_p(float x1,float y1,float x2,float y2, float p)
{
float D;
D=pow(pow(abs(x2-x1),p)+pow(abs(y2-y1),p),1/p);
return D;
}
// Distanza della scacchiera
float D_chebichev(float x1,float y1,float x2,float y2)
{
float D;
D=maxvalue(abs(x2-x1),abs(y2-y1));
return D;
}


