
int bala1 = 575;
boolean bala= true;
boolean balas= true;
int balaxx= 25;
boolean punta=true;
int punta1=25;
boolean balasa=true;
int balaa=575;
int punta2=25;
int punta3=25;
int punta4=300;
int punta8=25;
int punta9=575;
int primera= 0;
int posicio=200;
boolean primeras=true;
int a =200;
int  segona=0;




void setup(){
  size(600,600);
  frameRate(100);
}
//bala1
void draw(){
  
  
 
  stroke(255,255,255);
  fill(255,255,255);
  ellipse(100,80,50,20);
  background(0,0,0);
  fill(random(255),random(255),mouseY);
  //bala1
 ellipse(bala1, 300, 50,50);
 if(bala==false)
 if(bala1<=775&&bala1>300)
 bala1 = bala1 -1;
 //bala2
ellipse(balaxx,300,50,50);
if(balas==false)
if(balaxx>=25&&balaxx<300)
balaxx= balaxx +1;

//bala3
ellipse(punta1,balaa,50,50);
if(punta==false)
if(punta1>=25&&punta1<300)
punta1= punta1 +1;

//bala4
 ellipse(balaa, balaa, 50,50);
 if(balasa==false)
 if(balaa<=775&&balaa>300)
 balaa = balaa -1;

 
 //bala4
ellipse(punta2,punta2,50,50);
if(punta==false)
if(punta1>=25&&punta1<300)
punta2= punta2 +1;

//bala5
ellipse(balaa,punta3,50,50);
if(balas==false)
if(balaxx>=25&&balaxx<300)
punta3= punta3 +1;

//bala6

ellipse(300,punta8,50,50);
if(balas==false)
if(balaxx<300)
punta8= punta8 +1;
//bola7
ellipse(300,punta9,50,50);
if(balas==false)
if(balaxx<300)
punta9= punta9 -1;




 



int b=0;
while(bala1==balaa){
 
  fill(0,0,0);
stroke(0,0,0);
ellipse(punta4,300,150,150);
 stroke(0,0,255);
 
 fill(255,0,0);
 
  ellipse(random(280),random(320),50,50);
  ellipse(random(280),random(320),50,50);
  ellipse(random(280),random(320),50,50);
  ellipse(random(280),random(320),50,50);
  ellipse(random(280),random(320),50,50);
  ellipse(random(300),random(400),50,50);
  ellipse(random(280),random(320),50,50);
  ellipse(random(280),random(320),50,50);
  ellipse(random(500),random(500),50,50);
  ellipse(random(300),random(500),50,50);
  ellipse(random(600),random(320),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(0),random(600),50,50);
  ellipse(random(0),random(600),50,50);
  ellipse(random(0),random(600),50,50);
  ellipse(random(0),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
fill(0,255,0);
ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  fill(255,0,255);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  fill(255,255,0);
    ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
  ellipse(random(600),random(600),50,50);
   bala1=bala1+1;
    
    
    
  }
    
  

  
  
}



void mousePressed(){
  bala=false;
balas=false;
punta=false;
balasa=false;

 
   
}



