
float counter=0;

void setup(){
size(500,500);

noStroke();
smooth();
}

void draw() {
background(#FFFFFF);
float sec = map(second(),0,60,0,150);
float min = map(minute(),0,60,0,150);
float std = map(hour(),0,24,0,300);


float h =map(sin(counter),-1,1,0,20);
float h2 =map(sin(counter),-1,1,20,50);
float h3 =map(sin(counter),-1,1,50,60);
float h4 =map(sin(counter),-1,1,100,160);
float h5 =map(sin(counter),-1,1,120,200);
float h6 =map(sin(counter),-1,1,200,250);
float h7 =map(sin(counter),-1,1,250,280);
float h8 =map(sin(counter),-1,1,0,360);
float h9= map(sin(counter),-1,1,300,340);

float b2 = map(sin(counter),-1,1,30,80);
float b =map(sin(counter),-1,1,50,100);
float b3=map(sin(counter),-1,1,40,150);
colorMode(HSB,360,100,100);


if(hour()>=6 && hour()<=8){
fill(h,100,100,150);
background(150);
counter+=0.01;}
if(hour()>8 && hour()<=10){
fill(h2,100,100,150);
background(255);
counter+= 0.01;}
if(hour()>10&& hour()<=12){
fill(h3,100,100,150);
counter+= 0.01;}
if(hour()>12&&hour()<=14){
fill(h4,100,100,150);
counter+= 0.01;}
if(hour()>14&&hour()<=16){
fill(h5,100,100,150);
counter+=0.01;}
if(hour()>16&&hour()<=18){
fill(h6,100,b,150);
background(100);
counter+=0.01;} 
if(hour()>18&&hour()<=20){
fill(h7,100,b2,150);
background(50);
counter+= 0.01;}
if(hour()>20&&hour()<=22)
{ fill(h8,100,100,150);
background(0);
counter+=0.5;}
if(hour()>22&&hour()<=23){
fill(240,100,100,b3);
background(0);
counter+=0.01;}
if(hour()>0&&hour()<=4){
fill(240,100,100,b3);
background(0);
counter+=0.01;}
if(hour()>4&&hour()<=6){
background(100);
fill(h9,100,100,b3);
counter+=0.01;}

ellipse(100,250,sec,sec);
ellipse(250,250,std,std);
ellipse(400,250,min,min); 
}
