

float seks;
float mins;
float hr;
float pod;
float podc;
float podb;

float seksstart=0;
float minsstart=0;
float hrstart=0;
float podstart=0;

float seksrect;
float minsrect;
float hrrect;
float podrect;
float podcrect;
float podbrect;

float seksrectstart=0;
float minsrectstart=0;
float hrrectstart=0;
float podrectstart=0;

float Drehung;
float Drehungjetzt;

float schnelleRotation;

void setup(){
size(500,500);

colorMode(HSB, 360,100,100);
}

void draw(){
background(0,0,100);
translate(width/2, height/2);
strokeWeight(10);
strokeCap(SQUARE);
noFill();


if(hour()<12){
podcrect=map(hour(),0,12,250,180);

}
else if(hour()>11){

podcrect=map(hour(),12,24,180,250);
}

if(hour()<11){podbrect=map(hour(),0,10,0,100);}
if(hour()>=11 && hour()<=18){podbrect=100;}
if(hour()>18){podbrect=map(hour(),17,23,100,0);}



if(mousePressed==true){
 
 seksrect = 0;
minsrect= 0;
hrrect = 0;
podrect = 0;
Drehung=-PI/2;

if(seksrectstart>seksrect){ seksrectstart=seksrectstart-2;}
if(minsrectstart>minsrect){ minsrectstart=minsrectstart-2;}
if(hrrectstart>hrrect){ hrrectstart=hrrectstart-2;}
if(podrectstart>podrect){ podrectstart=podrectstart-2;} 
 if(Drehungjetzt>Drehung){Drehungjetzt= Drehungjetzt-PI/40;}

if(seksrectstart<1 && minsrectstart<1 && hrrectstart<1 && podrectstart<1 && Drehungjetzt<=-PI/2+0.1){
  
seks=map(second(),0,59,0,2*PI);

mins=map(minute(),0,59,0,2*PI);

if(hour()<12){
hr=map(hour(),0,12,0,2*PI);
podc=map(hour(),0,12,250,180);

}
else if(hour()>11){
hr=map(hour(),12,24,0,2*PI);
podc=map(hour(),12,24,180,250);
}

if(hour()<11){podb=map(hour(),0,10,0,100);}
if(hour()>=11 && hour()<=18){podb=100;}
if(hour()>18){podb=map(hour(),17,23,100,0);}

pod=map(hour(),0,24,0,PI);





if(seks==2*PI){seksstart=0;}
if(mins==2*PI){minsstart=0;}
if(hr==2*PI){hrstart=0;}
if(pod==2*PI){podstart=0;}

if(seksstart<=seks){ seksstart=seksstart+0.03;}
if(minsstart<=mins){ minsstart=minsstart+0.03;}
if(hrstart<=hr){ hrstart=hrstart+0.05;}
if(podstart<=pod){ podstart=podstart+0.03;}

 schnelleRotation=schnelleRotation-0.112;
}
}

else if(keyPressed==true){
seks = 0;
mins = 0;
hr = 0;
pod = 0;
Drehung=0;

if(seksstart>=seks){ seksstart=seksstart-0.03;}
if(minsstart>=mins){ minsstart=minsstart-0.03;}
if(hrstart>=hr){ hrstart=hrstart-0.05;}
if(podstart>=pod){ podstart=podstart-0.03;}

 
if(seksstart<0.1 && minsstart<0.1 && hrstart<0.1 && podstart<0.1 ){

seksrect=map(second(),0,59,0,200);

minsrect=map(minute(),0,59,0,200);

if(hour()<12){
hrrect=map(hour(),0,11,0,200);
podcrect=map(hour(),0,12,250,180);

}
else if(hour()>11){
hrrect=map(hour(),12,24,0,200);
podcrect=map(hour(),12,24,180,250);
}

if(hour()<11){podbrect=map(hour(),0,10,0,100);}
if(hour()>=11 && hour()<=18){podbrect=100;}
if(hour()>18){podbrect=map(hour(),17,23,100,0);}

podrect=map(hour(),0,24,0,200);




if(seksrect==200){seksrectstart=0;}
if(minsrect==200){minsrectstart=0;}
if(hrrect==200){hrrectstart=0;}
if(podrect==200){podrectstart=0;}

if(seksrectstart<=seksrect){ seksrectstart=seksrectstart+2;}
if(minsrectstart<=minsrect){ minsrectstart=minsrectstart+2;}
if(hrrectstart<=hrrect){ hrrectstart=hrrectstart+2;}
if(podrectstart<=podrect){ podrectstart=podrectstart+2;}
  if(Drehungjetzt<Drehung){Drehungjetzt= Drehungjetzt+PI/40;}
}
}
else{
seks = 0;
mins = 0;
hr = 0;
pod = 0;
Drehung=0;

if(seksstart>=seks){ seksstart=seksstart-0.03;}
if(minsstart>=mins){ minsstart=minsstart-0.03;}
if(hrstart>=hr){ hrstart=hrstart-0.05;}
if(podstart>=pod){ podstart=podstart-0.03;}

if(podstart<0.1){
 if(Drehungjetzt<Drehung){Drehungjetzt= Drehungjetzt+PI/40;}
}
 seksrect = 0;
minsrect= 0;
hrrect = 0;
podrect = 0;


if(seksrectstart>seksrect){ seksrectstart=seksrectstart-2;}
if(minsrectstart>minsrect){ minsrectstart=minsrectstart-2;}
if(hrrectstart>hrrect){ hrrectstart=hrrectstart-2;}
if(podrectstart>podrect){ podrectstart=podrectstart-2;} 

}

pushMatrix();
stroke(0,0,0);
rotate(-seksstart);
rotate(-PI/2);
arc(0, 0, 60, 60, 0, seksstart);
//rotate(radians(90));

rotate(schnelleRotation);
arc(0, 0, 90, 90, 0, minsstart);
popMatrix();
 

pushMatrix();
rotate(radians(270));
arc(0, 0, 120, 120, 0, hrstart);
popMatrix();
 

pushMatrix();
stroke(podc,100,podb);
rotate(radians(180));
strokeWeight(40);
arc(0, 0, 190, 190, 0, podstart);
popMatrix();
 

 pushMatrix();
 //rotate(PI+PI/2);
 rotate(Drehungjetzt);
 translate(0,-60);
 strokeWeight(1);
 stroke(podcrect,100,podbrect);
 fill(podcrect,100,podbrect);
 rect(-podrectstart/2,-55,podrectstart,40); 
 popMatrix();

 
 fill(100,100,0);
 stroke(100,100,0);
  strokeWeight(1);
 pushMatrix();
 rect(-hrrectstart/2,-65,hrrectstart,10); 
 popMatrix();
 

 translate(0,-60);
 rect(-minsrectstart/2,10,minsrectstart,10); 
  translate(0,-5);
 rect(-seksrectstart/2,30,seksrectstart,10); 


}
