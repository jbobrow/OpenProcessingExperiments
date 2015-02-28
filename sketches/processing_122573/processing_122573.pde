
float counter=0;

void setup() {
size(500,500);

}

void draw(){
float sec = map(second(),0,60,0,150);
float min = map(minute(),0,60,0,150);
float std = map(hour(),0,12,0,200);

if(hour()==6)
{ background(#F51B07);
}
if(hour()==7)
{ background(#F54307);}
if(hour()==8)
{ background(#FFEA00);}
if(hour()==9)
{background(#FCF05E);}
if(hour()==10)
{ background(#FFFFFF);}
if(hour()==11)
{ background(#B4E3FF);}
if(hour()==12)
{ background(#81E5FF);}
if(hour()==13)
{ background(#2ED3FF);}
if(hour()==14)
{ background(#2ED3FF);}
if(hour()==16)
{ background(#2ED3FF);}
// if(hour()==16)
// { background(#4464FA);}
if(hour()==17)
{ background(#0F38FA);}
if(hour()==18)
{ background(#061E90);}
if(hour()==19)
{ background(#061976);}
if(hour()==20)
{ background(#000000);}
if(hour()==21)
{ background(#000000);}
if(hour()==22)
{ background(#000000);}
if(hour()==23)
{ background(#000000);}
if(hour()==0)
{ background(#000000);}
if(hour()==1)
{ background(#000000 );}
if(hour()==2)
{ background(#000000);}
if(hour()==3)
{ background(#000000);}
if(hour()==4)
{ background(#340B07);}
if(hour()==5)
{ background(#A71E0F);}


float b= map(sin(counter),-1,1,70,80);
colorMode(HSB,360,100,100);
fill(0,0,b,200);
counter+=0.01;


ellipse(100,250,sec,sec);
ellipse(250,250,std,std);
ellipse(400,250,min,min);

noStroke();





}
