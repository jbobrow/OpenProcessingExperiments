
void setup ()
{
  smooth();
  size(800,450);
}

void draw()

{
 background(80);



pushMatrix();{
  //Minuten
  float h = map(hour(),0,12,0,12);
  float min = map(minute(),0,60/2,0,360/2);
  
  pushMatrix();
  translate(width/2,height/2);
  ellipse(0,0,min, min);
  
  popMatrix();
{translate(125,10);}

//Szunden




//1
if (h>=1) {fill (210);
rect(-35,0,50,10);}
if(h>=13) {fill (204,255,160);
rect(-35,0,50,10); }
//2
  if(h >=2){
   fill(210);
   rect(15,0,50,10); }
  if(h>=14){
    fill(204,255,160);
    rect(15,0,50,10);}
   
//3
 if(h>=3){
   fill(210);
 rect(65,0,50,10);}
 if(h>=15){
  fill(204,255,160);
  rect(65,0,50,10);}
//4
 if(h>=4){
  fill(210);
 rect(115,0,50,10);}
 if(h>=16){
   fill(204,255,160);
   rect(115,0,50,10);}
//5
 if(h>=5){
  fill(210);
 rect(165,0,50,10); }
  if(h>=17){
  fill(204,255,160);
 rect(165,0,50,10); }
 
//6
 if(h>=6){
   fill(210);
 rect(215,0,50,10); }
  if(h>=18){
   fill(204,255,160);
 rect(215,0,50,10); }
  
//7
 if(h>=7){
   fill(210);
 rect(265,0,50,10); }
  if(h>=19){
   fill(204,255,160);
 rect(265,0,50,10); }
//8
 if(h>=8){
   fill(210);
 rect(315,0,50,10); }
  if(h>=20){
   fill(204,255,160);
 rect(315,0,50,10); }
//9
  if(h>=9){
   fill(210);
   rect(365,0,50,10); }
  if(h>=21){
   fill(204,255,160);
   rect(365,0,50,10); }
//10
    if(h>=10){
   fill(210);
 rect(415,0,50,10); }
 if(h>=22){
   fill(204,255,160);
 rect(415,0,50,10); }
 //11
 if(h>=11){
   fill(210);
   rect(465,0,50,10);}
 if(h>=22){
   fill(204,255,160);
   rect(465,0,50,10);}
 //12
    if(h>=12){
   fill(210);
 rect(515,0,50,10);
    }
 if(h>=23){
 fill(204,255,160);
 rect(515,0,50,10);
    } 


popMatrix();
 
pushMatrix();
{

////Stunden unten
float hu = map(hour(),0,12,0,12);
 
translate(655,440);
rotate(PI);
 

//1
if (h>=1) {fill (210);
rect(-35,0,50,10);}
if(h>=13) {fill (204,255,160);
rect(-35,0,50,10); }
//2
  if(h >=2){
   fill(210);
   rect(15,0,50,10); }
  if(h>=14){
    fill(204,255,160);
    rect(15,0,50,10);}
   
//3
 if(h>=3){
   fill(210);
 rect(65,0,50,10);}
 if(h>=15){
  fill(204,255,160);
  rect(65,0,50,10);}
//4
 if(h>=4){
  fill(210);
 rect(115,0,50,10);}
 if(h>=16){
   fill(204,255,160);
   rect(115,0,50,10);}
//5
 if(h>=5){
  fill(210);
 rect(165,0,50,10); }
  if(h>=17){
  fill(204,255,160);
 rect(165,0,50,10); }
 
//6
 if(h>=6){
   fill(210);
 rect(215,0,50,10); }
  if(h>=18){
   fill(204,255,160);
 rect(215,0,50,10); }
  
//7
 if(h>=7){
   fill(210);
 rect(265,0,50,10); }
  if(h>=19){
   fill(204,255,160);
 rect(265,0,50,10); }
//8
 if(h>=8){
   fill(210);
 rect(315,0,50,10); }
  if(h>=20){
   fill(204,255,160);
 rect(315,0,50,10); }
//9
  if(h>=9){
   fill(210);
   rect(365,0,50,10); }
  if(h>=21){
   fill(204,255,160);
   rect(365,0,50,10); }
//10
    if(h>=10){
   fill(210);
 rect(415,0,50,10); }
 if(h>=22){
   fill(204,255,160);
 rect(415,0,50,10); }
 //11
 if(h>=11){
   fill(210);
   rect(465,0,50,10);}
 if(h>=22){
   fill(204,255,160);
   rect(465,0,50,10);}
 //12
    if(h>=12){
   fill(210);
 rect(515,0,50,10);
    }
 if(h>=23){
 fill(204,255,160);
 rect(515,0,50,10);

    } 


popMatrix();

translate(width/2,height/2);
float sec = map(second(), 0, 60, 0, 360);
fill(90,193,156);
  noStroke();
for(int is=0;is<360;is+=2)
{
 pushMatrix();
 rotate(radians(sec));
 
  popMatrix();
}
   

pushMatrix();
  rotate(radians(sec)); 
translate(0,185);
frameRate(1);
fill(225);
ellipse(0, 0, 20,20);
  popMatrix();
  fill(90,193,156);
ellipse (0,185,15,15);
ellipse(0,-185,15,15);
ellipse(185,0,15,15);
ellipse(-185,0,15,15);
  
}
for (int i=0; i<360; i+=6) {
pushMatrix();
rotate(radians(i));
translate(0, 185);
ellipse(0, 0, 10, 10);
popMatrix();
}

if (h >=8 && h < 20)
  {fill (253,255,191);
    rect(-310,205,600,10);}
else
  {
    fill (54);
     rect(-310,205,600,10);
  }
   









}}
