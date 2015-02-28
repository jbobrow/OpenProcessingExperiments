

//pinguinos
int startX;
int stopX;
int startY;
int stopY;
float x;
float y;
float step;
float pct;



//left eye
int startX2;
int stopX2;
int startY2;
int stopY2;
float x2;
float y2;


//right eye2 
int startX3;
int stopX3;
int startY3;
int stopY3;
float x3;
float y3;

//left eye2 
int startX4;
int stopX4;
int startY4;
int stopY4;
float x4;
float y4;

//hielo3
int startX5;
int stopX5;
int startY5;
int stopY5;
float x5;
float y5;



//hielo2
int startX6;
int stopX6;
int startY6;
int stopY6;
float x6;
float y6;



//hielo1
int startX7;
int stopX7;
int startY7;
int stopY7;
float x7;
float y7;









void setup(){
  size(600,600);
  
  //right eye
  startX=100;
  stopX=108;
  startY=425;
  stopY=425;
  x=startX;
  y=startY;
  step=0.005;
  pct=0.0;
  
  //lefteye
  startX2=130;
  stopX2=138;
  startY2=425;
  stopY2=425;
  x2=startX2;
  y2=startY2;
  step=0.005;
  pct=0.0;
  
  
    //right eye 2
  startX3=530;
  stopX3=516;
  startY3=425;
  stopY3=425;
  x3=startX3;
  y3=startY3;
  step=0.005;
  pct=0.0;
  
  
  
  //left eye 3
   startX4=500;
  stopX4=485;
  startY4=425;
  stopY4=425;
  x4=startX4;
  y4=startY4;
  step=0.005;
  pct=0.0; 
 
 //hielo3
 startX5=390;
 stopX5=570;
 startY5=310;
 stopY5=310;
 x5=startX5;
 y5=startY5;
 step=0.001;
 pct=0.0; 


//hielo2
 startX6=140;
 stopX6=330;
 startY6=340;
 stopY6=345;
 x6=startX6;
 y6=startY6;
 step=0.001;
 pct=0.0; 

//hielo1
 startX7=-2;
 stopX7=100;
 startY7=290;
 stopY7=290;
 x7=startX7;
 y7=startY7;
 step=0.001;
 pct=0.0; 

  
}


void draw(){
//floor
fill(252,255,255);
stroke(252,255,255);
rect(0,540,600,100);

//water
fill(105,223,242);
stroke(105,223,242);
rect(0,250,600,300);

//hielo1 


if(pct< 1.0) {
  x7= startX7 + ((stopX7-startX7) * pct);
  y7=startY7 + ((stopY7-startY7) * pct);
  pct+=step;
}

fill(252,255,255);
stroke(252,255,255);
ellipse(x7,y7,150,50);

//hielo2 


if(pct< 1.0) {
  x6= startX6 + ((stopX6-startX6) * pct);
  y6=startY6 + ((stopY6-startY6) * pct);
  pct+=step;
}

fill(252,255,255);
stroke(252,255,255);
ellipse(x6,y6,150,50);

//hielo3 

if(pct< 1.0) {
  x5= startX5 + ((stopX5-startX5) * pct);
  y5=startY5 + ((stopY5-startY5) * pct);
  pct+=step;
}

fill(252,255,255);
stroke(252,255,255);
ellipse(x5,y5,200,50);




//land
fill(252,255,255);
stroke(252,255,255);
rect(0,250,600,10);

//sky
fill(255,251,170);
stroke(255,251,170);
rect(0,0,600,250);


//clouds

stroke(255);
fill(254,254,254);
ellipse(45,140,80,80);
ellipse(90,140,140,150);
ellipse(220,90,140,160);
ellipse(135,100,140,190);
ellipse(460,100,80,60);
ellipse(500,100,140,130);
ellipse(580,100,140,170);



if(key =='m'){
fill(0,0,0);
stroke(255,251,170);
rect(0,0,600,250);

}





//igloo


fill(252,255,255);
stroke(252,255,255);
arc(500,250,120,135,PI,TWO_PI);
fill(0,0,0);
stroke(0,0,0);
arc(500,250,30,55,PI,TWO_PI);


//this are the bodies
fill(0,0,0);
stroke(0,0,0);
ellipse(120,480,155,195);
ellipse(300,480,155,195);
ellipse(500,480,155,195);



//arms middle
if (mousePressed==true){
ellipse(223,415,45,110);
ellipse(376,415,45,110);
} 
else{

  ellipse(225,494,45,110);
  ellipse(372,494,45,110);
}

//arms right
if (mousePressed==true){
   ellipse(570,415,45,110);
   ellipse(429,415,45,110);  
}
  else{
      
      ellipse(570,494,45,110);
      ellipse(429,494,45,110);
  }
  
//arms left
if (mousePressed==true){
  ellipse(45,415,45,110);
  ellipse(185,415,45,110);
}
  else{
    ellipse(45,494,45,110);
    ellipse(185,494,45,110);
  }




//belly
fill(255,255,252);
stroke(0,0,0);
ellipse(120,495,130,120);
ellipse(300,495,130,120);
ellipse(500,495,130,120);


//this are the eyes
noStroke();
ellipse(100,425,30,40);
ellipse(130,425,30,40);

ellipse(290,425,30,40);
ellipse(320,425,30,40);

ellipse(490,425,30,40);
ellipse(520,425,30,40);



//pupils
fill(8,7,0);
stroke(8,7,0);

if(pct< 1.0) {
  x= startX + ((stopX-startX) * pct);
  y=startY + ((stopY-startY) * pct);
  pct+=step;
}
ellipse(x,y,10,15);


if(pct< 1.0) {
  x2= startX2 + ((stopX2-startX2) * pct);
  y2=startY2 + ((stopY2-startY2) * pct);
  pct+=step;
}

ellipse(x2,y2,10,15);


ellipse(295,420,10,15);
ellipse(325,420,10,15);



if(pct< 1.0) {
  x4= startX4 + ((stopX4-startX4) * pct);
  y4=startY4 + ((stopY4-startY4) * pct);
  pct+=step;
}


ellipse(x4,y4,10,15);

if(pct< 1.0) {
  x3= startX3 + ((stopX3-startX3) * pct);
  y3=startY3 + ((stopY3-startY3) * pct);
  pct+=step;
}

ellipse(x3,y3,10,15);







if (mousePressed==true){
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(100,425,30,40);
  ellipse(130,425,30,40);
} 



if (mousePressed==true){
  fill(0,0,0);
  stroke(0,0,0);
ellipse(290,425,30,40);
ellipse(320,425,30,40);
}



if (mousePressed==true){
  fill(0,0,0);
  stroke(0,0,0);
ellipse(490,425,30,40);
ellipse(520,425,30,40);
}


if (key=='a'){
  fill(0,0,0);
  stroke(0,0,0);
ellipse(100,425,30,40);
ellipse(130,425,30,40);
}

if (key=='b'){
  fill(0,0,0);
  stroke(0,0,0);
ellipse(290,425,30,40);
ellipse(320,425,30,40);
}

if (key=='c'){
  fill(0,0,0);
  stroke(0,0,0);
ellipse(490,425,30,40);
ellipse(520,425,30,40);
}








//these are the beaks
fill(255,200,0);
stroke(255,200,0);
triangle(90,445,140,445,115,475);
triangle(280,445,330,445,310,475);
triangle(480,445,530,445,510,475);
}







