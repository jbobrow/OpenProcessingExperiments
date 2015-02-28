
 float tPeriod;
 float tRad;
 float tTemp;
 int planetCounter;
 float Prob;
 float maxRad;
 float minRad;
 float minTemp;
 float maxTemp;
 float minPeriod;
 float maxPeriod;
 float Distance;
 float Angle;
 float Orbit;
 int Mode;
 Planet[] planets = new Planet[755];
 
 
void setup (){
 size (1024,1024);
 maxRad=0;
 minRad=100000000;
 minTemp=10000000;
 maxTemp=0;
 minPeriod=1000000000;
 maxPeriod=0;
 smooth();
 String [] data = loadStrings ("Full-planet-list.csv");

 for (int i=0; i< data.length; i++)
 {
   for (int a=0; a<22; a++){
     String[]pieces=split (data [i], ",");
     Prob =parseFloat(pieces[19]);
     tPeriod =parseFloat(pieces[7]);
     tRad =parseFloat(pieces[15]);
     tTemp = parseFloat(pieces[17]);
   }
    if (Prob<3)//checks that planet probably isn't false positive
     {
     planets[planetCounter]=new Planet(tPeriod,tRad,tTemp);  
     planetCounter++;
       if (tTemp<minTemp)
       {
       minTemp=tTemp;
       }
       if (tTemp>maxTemp)
       {
       maxTemp=tTemp;
       }
       if (tRad<minRad)
       {
       minRad=tRad;
       }
       if (tRad>maxRad)
       {
       maxRad=tRad;
       }
       if (tPeriod<minPeriod)
       {
       minPeriod=tPeriod;
       }
       if (tPeriod>maxPeriod)
       {
       maxPeriod=tPeriod;
       }
       
     }
 }  
}


void draw ()
{
background (0);
fill (200);
rect (900,900,100,20);
fill (0);
text ("Mode",920,918);
if (Mode==0)
{
for (int i=0; i<644;i++){
  planets[i].move();
  planets[i].display();
  }
fill (255,255,200);
ellipse (height/2,width/2,60, 60);
text ("Kepler Exoplanets",20,20);
text ("Distance from sun based on temperture",20,40);
}
if(Mode==1)
{
for (int i=0; i<644;i++){
  planets[i].array();
}
}
}

void mouseReleased() 
{
if (mouseX>900 && mouseX<1000 && mouseY>900 &&mouseY<920)  
  {
    if (Mode==0)
    {
    Mode=1;
    }
    else
    {
    Mode=0;
    }
  }
}  







class Planet {

float Rad;
float Period;
float Temp;
float X;
float Y;


Planet(float Period_, float Rad_, float Temp_)
{
Period=Period_;
Rad=Rad_;
Temp=Temp_;
}

void move ()
{
Distance=width/2-map(Temp,minTemp,maxTemp,0,width/2);
Orbit++;
Angle=Orbit/map(Period,minPeriod,maxPeriod,0,5184000);
X=cos(radians(Angle))*Distance+.5*height;
Y=sin(radians(Angle))*Distance+.5*width;
}
void display()
{
if (Rad<.7)
  {
  fill(100);
  }
if (Rad>.7 && Rad<2)
  {
    fill(20,255,255);
  }
 if (Rad>2)
 {
 fill(map(Rad,minRad,maxRad,50,200),100,100);  
 }

ellipse (X,Y,map(Rad,minRad,maxRad,2,20),map(Rad,minRad,maxRad,2,20));

}

void array ()
{
noFill();
stroke(map(Temp,minTemp,maxTemp,0,width/2),100,100);
ellipse(512,512,map(Rad,minRad,maxRad,1,1024),map(Rad,minRad,maxRad,1,1024));
fill (255);
text ("Radius based on planet radius, color warmth based on planet temperature",50,50);
}


}



