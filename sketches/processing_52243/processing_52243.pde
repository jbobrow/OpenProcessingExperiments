
int nyanX;
int nyanY;
int rainbow=0;
 
void setup(){
size(800,600);
frameRate(80);
nyanX=50;
nyanY=50;
rainbow=0;
;
}
 
void draw(){
  background(1,13,59);
  fill(255);
  ellipse(random(800),random(800),5,5);
noStroke();
  
//rainbow
fill(random(29),random(499),random(499));
rect(0,nyanY,nyanX,30);
fill(random(499),random(99),random(499));
rect(0,nyanY+30,nyanX,30);
 fill(random(499),random(499),random(99));
rect(0,nyanY+60,nyanX,30);
  
//legs & tail
fill(160);
stroke(70);
strokeWeight(2);
ellipse(nyanX+100,nyanY+90,25,50);
ellipse(nyanX+140,nyanY+90,25,50);
ellipse(nyanX+50,nyanY+90,25,50);
ellipse(nyanX+20,nyanY+90,25,50);
ellipse(nyanX+10,nyanY+70,95,20);

 //poptart
 fill(201,144,97);
  stroke(140,100,60);
strokeWeight(2);
rect(nyanX,nyanY,150,100);

 //poptartII
 fill(240,128,201);
 stroke(190,80,150);
strokeWeight(2);
rect(nyanX+10,nyanY+10,130,80);

//ears
fill(160);
stroke(70);
strokeWeight(2);
triangle(nyanX+70,nyanY+50,nyanX+80,nyanY+5,nyanX+100,nyanY+50);
triangle(nyanX+140,nyanY+50,nyanX+170,nyanY+5,nyanX+100,nyanY+50);

//face
fill(160);
stroke(70);
strokeWeight(2);
ellipse(nyanX+120,nyanY+60,100,80);

//right eye
fill(20);
stroke(30);
ellipse(nyanX+100,nyanY+50,15,18);
fill(255);
noStroke();
ellipse(nyanX+98,nyanY+45,5,5);

//left eye
fill(20);
stroke(30);
ellipse(nyanX+150,nyanY+50,15,18);
fill(255);
noStroke();
ellipse(nyanX+148,nyanY+45,5,5);

//nose
fill(20);
stroke(30);
ellipse(nyanX+125,nyanY+70,8,5);

//cheeks
 fill(240,128,201);
 stroke(220,108,181);
 strokeWeight(1.5);
ellipse(nyanX+160,nyanY+70,10,8);
ellipse(nyanX+90,nyanY+70,10,8);

//muzzle
fill(20);
stroke(30);
rect(nyanX+115,nyanY+85,20,3);
rect(nyanX+110,nyanY+80,2,8);
rect(nyanX+125,nyanY+80,2,8); 
rect(nyanX+135,nyanY+80,2,8); 


 
if (rainbow==0){
  nyanX=nyanX+1;
}
 
 
//right
if(nyanX > 600){
   
  rainbow=1;
   
}
 
//down
if(nyanX > 550){
  nyanY=nyanY+1;
  noStroke();
  fill(random(299),random(299),random(99));
rect(0,nyanY,nyanX,30);
fill(random(29),random(299),random(299));
rect(0,nyanY+30,nyanX,30);
 fill(random(299),random(99),random(299));
rect(0,nyanY+60,nyanX,30);
  
}
 //backwards
if(nyanY >400){
  nyanX=nyanX-1;
         noStroke();
  fill(random(49),random(19),random(19));
rect(0,nyanY,nyanX,30);
fill(random(99),random(99),random(199));
rect(0,nyanY+30,nyanX,30);
 fill(random(129),random(499),random(599));
rect(0,nyanY+60,nyanX,30);
}

//up
if(nyanX < 60){
  nyanY=nyanY-1;

    noStroke();
  fill(random(499),random(199),random(499));
rect(0,nyanY,nyanX,30);
fill(random(499),random(499),random(199));
rect(0,nyanY+30,nyanX,30);
 fill(random(129),random(499),random(599));
rect(0,nyanY+60,nyanX,30);
}
 
if(nyanY< 100){
  nyanX=nyanX+1;
  noStroke();
 fill(random(29),random(499),random(499));
rect(0,nyanY,nyanX,30);
fill(random(499),random(99),random(499));
rect(0,nyanY+30,nyanX,30);
 fill(random(499),random(499),random(99));
rect(0,nyanY+60,nyanX,30);
}
}


