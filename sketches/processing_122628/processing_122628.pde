
float counter;
float zaehler;

void setup()
{
 size(500,500);
 colorMode(HSB, 360,100,100);
 

}

void draw()
{
  pushMatrix();
        noStroke();
        float mx = map(mouseX,0,500,0,23);
        


    if (mx >=0){   fill(255,100,0);}
    if (mx >=1){   fill(255,100,00);}
    if (mx >=2){    fill(255,100,0);}
    if (mx>=3){   fill(255,100,0); }
    if (mx >=4){     fill(255,100,0); }
    if (mx >=5){ fill(255,100,10); }
    if (mx >=6){     fill(255,100,15); }
    if (mx >=7){    fill(255,100,20); }
    if (mx >=8){  fill(255,100,25); }
    if (mx >=9){   fill(255,100,35);}
    if (mx >=10){   fill(255,100,55); }
    if (mx >=11){ fill(255,100,64); }
    if (mx >=12){ fill(255,100,73); }
    if (mx >=13){   fill(255,100,82); }
    if (mx >=14){   fill(255,100,91); }
    if (mx >=15){  fill(255,100,100); }
    if (mx >=16){  fill(255,100,90);}
    if (mx >=17){  fill(255,100,60); }
    if (mx >=18){  fill(255,100,30);}
    if (mx >=19){   fill(255,100,20);}
    if (mx >=20){    fill(255,100,15);} 
    if (mx >=21){   fill(255,100,10); }
    if (mx >=22){   fill(255,100,5);}
    if (mx >=23){  fill(255,100,0); }
    
    
    rect(0,-250,1000,1000);
    
popMatrix();


 translate(width/2,height/2);
  float ho = map (mx,0,23,0,360);
  
   pushMatrix();
   rotate(radians(ho));
   translate(0,200);
    fill(#EDFF00);
    ellipse(0,0,50,50);
    
    translate(0,-400); 
    fill(#FFFFFC);
    ellipse(0,0,35,35);  
popMatrix();

pushMatrix();
 float e= map(mouseX,0,500,0,23);
 
 if (e >=0){   fill(120,100,15);}
    if (e >=1){   fill(120,100,15);}
    if (e >=2){    fill(120,100,15);}
    if (e>=3){   fill(120,100,15); }
    if (e >=4){     fill(120,100,15); }
    if (e >=5){ fill(120,100,15); }
    if (e >=6){     fill(120,100,15); }
    if (e >=7){    fill(120,100,20); }
    if (e >=8){  fill(120,100,25); }
    if (e >=9){   fill(120,100,35);}
    if (e >=10){   fill(120,100,55); }
    if (e >=11){ fill(120,100,64); }
    if (e >=12){ fill(120,100,73); }
    if (e >=13){   fill(120,100,82); }
    if (e >=14){   fill(120,100,91); }
    if (e >=15){  fill(120,100,100); }
    if (e >=16){  fill(120,100,90);}
    if (e >=17){  fill(120,100,60); }
    if (e >=18){  fill(120,100,30);}
    if (e >=19){   fill(120,100,20);}
    if (e >=20){    fill(120,100,15);} 
    if (e >=21){   fill(120,100,15); }
    if (e >=22){   fill(120,100,15);}
    if (e >=23){  fill(120,100,15); }
    

rect(-250,0,500,500);
popMatrix();

pushMatrix();


if (mx >=0 && mx <=1) {  counter +=0.1/2; translate(0,   sin(counter)*44); fill(46,100,100); }
    if (mx>1&& mx <=2){  counter +=0.08/2; translate(0,  sin(counter)*37); fill(51,100,100);}
    if (mx >=2&& mx <=3){  counter +=0.065/2; translate(0, sin(counter)*25); fill(55,100,100); }
    if (mx >=3&& mx <=4){  counter +=0.05/2; translate(0,  sin(counter)*14);fill(60,100,100);  }
    if (mx >=4&& mx <=5){  counter +=0.02/2; translate(0,  sin(counter)*25); fill(54,100,100);   }
    if (mx >=5&& mx <=6){  counter +=0.07/2; translate(0,  sin(counter)*30);fill(45,100,100);  }
    if (mx>=6&& mx <=7){  counter +=0.14/2; translate(0,  sin(counter)*50); fill(36,100,100); }
    if (mx >=7&& mx <=8){  counter +=0.165/2; translate(0, sin(counter)*75);  fill(27,100,100); }
    if (mx >=8&& mx <=9){  counter +=0.19/2; translate(0,  sin(counter)*87.5); fill(18,100,100);}
    if (mx >=9&& mx <=10){  counter +=0.265/2; translate(0, sin(counter)*95);  fill(9,100,100);}
    if (mx >=10&& mx <=11){  counter +=0.28/2; translate(0, sin(counter)*100); fill(0,100,100); }
    if (mx >=11&& mx <=12){  counter +=0.19/2; translate(0, sin(counter)*87.5);fill(10,100,100); }
    if (mx >=12&& mx <=13){  counter +=0.165/2; translate(0,sin(counter)*75);  fill(20,100,100); }
    if (mx >=13&& mx <=14){  counter +=0.155/2; translate(0,sin(counter)*60); fill(30,100,100); }
    if (mx >=14&& mx <=15){  counter +=0.145/2; translate(0,sin(counter)*55);  fill(40,100,100); }
    if (mx >=15&& mx <=16){  counter +=0.14/2; translate(0, sin(counter)*50); fill(50,100,100); }
    if (mx>=16&& mx <=17){  counter +=0.145/2; translate(0,sin(counter)*55); fill(40,100,100); }
    if (mx >=17&& mx <=18){  counter +=0.155/2; translate(0,sin(counter)*60); fill(30,100,100);  }
    if (mx >=18&& mx <=19){  counter +=0.160/2; translate(0,sin(counter)*65); fill(22,100,100); }
    if (mx >=19&& mx <=20){  counter +=0.163/2; translate(0,sin(counter)*70); fill(18,100,100); }
    if (mx>=20&& mx <=21){  counter +=0.165/2; translate(0,sin(counter)*75); fill(15,100,100); } 
    if (mx >=21&& mx <=22){  counter +=0.163/2; translate(0,sin(counter)*65);  fill(32,100,100); }
    if (mx>=22&& mx <=23){  counter +=0.155/2; translate(0,sin(counter)*60);  fill(37,100,100); }
    if (mx >=23&& mx <=0){  counter +=0.14/2; translate(0, sin(counter)*50);  fill(42,100,100);}
   

  ellipse(0,0,50,50);
  
  
  
    popMatrix();


pushMatrix();

//1.Reihge Sek
    translate(-250,50);
zaehler += 0.02;
float h = map(sin(zaehler), -1, 1, 0, 360);

//{if ( mousePressed )
//{fill(#FFAF00);}
//else
//{    ;}

fill(#FF0000);
if  (second()==0)
  {
   
    ellipse(20,90,10,10);}
     if  (second()==1)
  {
    
  ellipse(30,95,10,10);}
  if  (second()==2)
  {
    
  ellipse(37,95,10,10); }
  if  (second()==3)
  {
    
  ellipse(44,95,10,10); }
  if  (second()==4)
  {
    
 ellipse(51,95,10,10);}
  if  (second()==5)
  {
    
  ellipse(58,95,10,10); }
  if  (second()==6)
  {
    
  ellipse(65,95,10,10);} 
  if  (second()==7)
  {
    
  ellipse(72,95,10,10); }
  if  (second()==8)
  {
    
 ellipse(79,95,10,10); }
  if  (second()==9)
  {
    
 ellipse(86,95,10,10);
  }
  
  
  
  
  
 if  (second()==10)
  {
   
 ellipse(95,90,10,10);}
 
 if  (second()==11)
  {
    
   ellipse(105,95,10,10);}
   if  (second()==12)
  {
    
  ellipse(112,95,10,10); }
  if  (second()==13)
  {
   
  ellipse(119,95,10,10);}
  if  (second()==14)
  {
    
  ellipse(126,95,10,10);}
  if  (second()==15)
  {
   
  ellipse(133,95,10,10); }
  if  (second()==16)
  {
    
  ellipse(140,95,10,10); }
  if  (second()==17)
  {
  
  ellipse(147,95,10,10); }
  if  (second()==18)
  {
   
 ellipse(154,95,10,10); }
  if  (second()==19)
  {
    
  ellipse(161,95,10,10);}
  
  
  if  (second()==20)
  {
   
 ellipse(170,90,10,10); }
 if  (second()==21)
  {
    
  ellipse(180,95,10,10);}
  if  (second()==22)
  {
   
  ellipse(187,95,10,10); }
  if  (second()==23)
  {
    
  ellipse(194,95,10,10);}
  if  (second()==24)
  {
   
  ellipse(201,95,10,10);}
  if  (second()==25)
  {
    
  ellipse(208,95,10,10); }
  if  (second()==26)
  {
   
  ellipse(215,95,10,10); }
  if  (second()==27)
  {
    
 ellipse(222,95,10,10);}
 if  (second()==28)
  {
 
  ellipse(229,95,10,10); }
  if  (second()==29)
  {
   
 ellipse(236,95,10,10);
  }
  
  
  
 if  (second()==30)
  {
   
 ellipse(245,90,10,10);}
 if  (second()==31)
  {
    
  ellipse(255,95,10,10);}
   if  (second()==32)
  {
    
 ellipse(262,95,10,10); }
   if  (second()==33)
  {
    
  ellipse(269,95,10,10); }
   if  (second()==34)
  {

  ellipse(276,95,10,10);}
   if  (second()==35)
  {
    
  ellipse(283,95,10,10);} 
   if  (second()==36)
  {
    
  ellipse(290,95,10,10);} 
   if  (second()==37)
  {
    
  ellipse(297,95,10,10);} 
   if  (second()==38)
  {

  ellipse(304,95,10,10);} 
   if  (second()==39)
  {
    
  ellipse(311,95,10,10);}
  
  
  
   if  (second()==40)
  {
   
  
 ellipse(321,90,10,10); }
  if  (second()==41)
  {
    
  ellipse(331,95,10,10);}
   if  (second()==42)
  {
    
  ellipse(338,95,10,10);}
  if  (second()==43)
  {
   
  ellipse(345,95,10,10);} 
   if  (second()==44)
  {
    
  ellipse(352,95,10,10);}
   if  (second()==45)
  {
    
ellipse(359,95,10,10);} 
   if  (second()==46)
  {
    
 ellipse(366,95,10,10); }
   if  (second()==47)
  {
   
 ellipse(373,95,10,10);}
  if  (second()==48)
  {
    
  ellipse(380,95,10,10); }
   if  (second()==49)
  {
    
  ellipse(387,95,10,10);}



   if  (second()==50)
  {
    
  
 ellipse(397,90,10,10); }
  if  (second()==51)
  {
   
  ellipse(410,95,10,10);}
   if  (second()==52)
  {
    
  ellipse(417,95,10,10); }
   if  (second()==53)
  {
    
  ellipse(424,95,10,10);} 
   if  (second()==54)
  {
   
  ellipse(431,95,10,10);}
   if  (second()==55)
  {
   
  ellipse(438,95,10,10); }
   if  (second()==56)
  {
   
  ellipse(445,95,10,10); }
   if  (second()==57)
  {
    
 ellipse(452,95,10,10); }
   if  (second()==58)
  {
    
  ellipse(459,95,10,10); }
   if  (second()==59)
  {
   
ellipse(466,95,10,10);}
   if  (second()==60)
  {
  
  
 rect(475,90,5,20); }
  popMatrix();
  
 
 //2. Reihe Minute
translate(-250,75);
pushMatrix();


  fill(#FF0000);


 if  (minute()==0)
  
    
ellipse(20,90,20,20);
 if  (minute()==1)
  {
  ellipse(30,95,20,20);}
  if  (minute()==2)
  {
 ellipse(37,95,20,20);}
  if  (minute()==3)
  {
  ellipse(44,95,20,20); }
  if  (minute()==4)
  {
 ellipse(51,95,20,20);}
  if  (minute()==5)
  {
  ellipse(58,95,20,20); }
  if  (minute()==6)
  {
  ellipse(65,95,20,20); }
  if  (minute()==7)
  {
  ellipse(72,95,20,20); }
  if  (minute()==8)
  {
  ellipse(79,95,20,20); }
  if  (minute()==9)
  {
  ellipse(86,95,20,20);}
  
  
  
 if  (minute()==10)
  {
ellipse(95,90,20,20);}
 if  (minute()==11)
  {
  ellipse(105,95,20,20);}
  if  (minute()==12)
  {
  ellipse(112,95,20,20); }
  if  (minute()==13)
  {
  ellipse(119,95,20,20);}
 if  (minute()==14)
  { 
ellipse(126,95,20,20);}
  if  (minute()==15)
  {
 ellipse(133,95,20,20); }
  if  (minute()==16)
  {
  ellipse(140,95,20,20); }
  if  (minute()==17)
  {
  ellipse(147,95,20,20); }
  if  (minute()==18)
  {
  ellipse(154,95,20,20); }
  if  (minute()==19)
  {
 ellipse(161,95,20,20);
  }
 
 
 if  (minute()==20)
  {
 ellipse(170,90,20,20); }
 if  (minute()==21)
  {
 ellipse(180,95,20,20);}
  if  (minute()==22)
  {
  ellipse(187,95,20,20); }
  if  (minute()==23)
  {
 ellipse(194,95,20,20); }
  if  (minute()==24)
  {
  ellipse(201,95,20,20);}
  if  (minute()==25)
  {
  ellipse(208,95,20,20); }
  if  (minute()==26)
  {
  ellipse(215,95,20,20); }
  if  (minute()==27)
  {
  ellipse(222,95,20,20);}
 if  (minute()==28)
  { 
  ellipse(229,95,20,20); }
  if  (minute()==29)
  {
  ellipse(236,95,20,20);}
  
  
  
  if  (minute()==30)
  {
  
 ellipse(245,90,20,20); }
 if  (minute()==31)
  {
 ellipse(255,95,20,20);}
  if  (minute()==32)
  {
  ellipse(262,95,20,20); 
  }
  if  (minute()==33)
  {
  ellipse(269,95,20,20); }
  if  (minute()==34)
  {
ellipse(276,95,20,20);}
  if  (minute()==35)
  {
  ellipse(283,95,20,20);}
  if  (minute()==36)
  {
  ellipse(290,95,20,20); }
  if  (minute()==37)
  {
  ellipse(297,95,20,20); }
  if  (minute()==38)
  {
  ellipse(304,95,20,20); }
  if  (minute()==39)
  {
  ellipse(311,95,20,20);}
  
  
  
  if  (minute()==40)
  {
  
ellipse(321,90,20,20); }
 if  (minute()==41)
  {
  ellipse(331,95,20,20);}
  if  (minute()==42)
  {
  ellipse(338,95,20,20);}
 if  (minute()==43)
  {
  ellipse(345,95,20,20); }
  if  (minute()==44)
  {
  ellipse(352,95,20,20);}
  if  (minute()==45)
  {
  ellipse(359,95,20,20);}
 if  (minute()==46)
  { 
 ellipse(366,95,20,20);}
 if  (minute()==47)
  { 
  ellipse(373,95,20,20); }
  if  (minute()==48)
  {
  ellipse(380,95,20,20); }
  if  (minute()==49)
  {
  ellipse(387,95,20,20);}
  
  
  
  if  (minute()==50)
  {
  
 ellipse(397,90,20,20); }
 if  (minute()==51)
  {
  ellipse(410,95,20,20);}
  if  (minute()==52)
  {
  ellipse(417,95,20,20); }
  if  (minute()==53)
  {
  ellipse(424,95,20,20); }
  if  (minute()==54)
  {
  ellipse(431,95,20,20);}
  if  (minute()==55)
  {
  ellipse(438,95,20,20); }
  if  (minute()==56)
  {
  ellipse(445,95,20,20); }
  if  (minute()==57)
  {
  ellipse(452,95,20,20);} 
  if  (minute()==58)
  {
  ellipse(459,95,20,20); }
  if  (minute()==59)
  {
  ellipse(466,95,20,20);}
  
  if  (minute()==60)
  {
  
 ellipse(475,90,20,20); 
  }
 
popMatrix();

//3.Reihe Stunde 

 pushMatrix();
  translate(+30,125);
  

fill(#950000);
{
if(mx>=0 && mx <=1){
 
ellipse(0,10,37,37);}

translate(+20,0);

 if(mx>=1 && mx <=2){
 
ellipse(20,10,35.5,35.5);}
 
 if(mx >=2  && mx <=3 ){
  
 ellipse(60,10,34,34); }
 if(mx>=3 && mx <=4){
   
 ellipse(100,10,32.5,32.5);}
 if(mx>=4 && mx <=5){
   
 ellipse(140,10,31,31);} 
 if(mx>=5 && mx <=6){
   
 ellipse(180,10,29.5,29.5); }
 if(mx>=6 && mx <=7){
  
 ellipse(220,10,28,28); }
 
 
 if(mx>=7 && mx <=8){
  
 ellipse(260,10,26.5,26.5); }
 if(mx>=8  && mx <=9){
   
 ellipse(300,10,24,24); }
  if(mx>=9 && mx <=10){
   
   ellipse(340,10,22.5,22.5); }
    if(mx>=10 && mx <=11){
  
 ellipse(380,10,21,21); }
 if(mx>=11 && mx <=12){
   
  ellipse(420,10,19.5,19.5);} 
    

    }


translate(-60,0);
 
 if(mx >=12 && mx <=13){
  
 ellipse(60,10,18,18); }
 if(mx>=13 && mx <=14){
   
 ellipse(100,10,16.5,16.5);}
 if(mx>=14 && mx <=15){
   
 ellipse(140,10,15,15);} 
 if(mx>=15 && mx <=16){
   
 ellipse(180,10,13.5,13.5); }
 if(mx>=16 && mx <=17){
  
 ellipse(220,10,12,12); }
 
 
 if(mx>=17 && mx <=18){
  
 ellipse(260,10,10.5,10.5); }
 if(mx>=18  && mx <=19){
   
 ellipse(300,10,9,9); }
  if(mx>=19 && mx <=20){
   
   ellipse(340,10,7.5,7.5); }
    if(mx>=20 && mx <=21){
  
 ellipse(380,10,5,5); }
 if(mx>=21 && mx <=22){
   
   ellipse(420,10,3.5,3.5);}
  
   if(mx>=22 && mx <=23){
   
 ellipse(460,10,2,2);

 
 }
 popMatrix();
 


}

