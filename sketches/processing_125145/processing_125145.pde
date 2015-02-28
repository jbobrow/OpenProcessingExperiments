
int kantraak;
float MonsterX;
float Richting;
boolean Test;
int Rg;
float X;
float Y;
float Xb;
float Yl;
float R;
float B;
float G;
float R1;
float R2;
int stop;
float tandenX;
int spatie;
int loopX;


void setup(){
size (200,200);
MonsterX=1;
kantraak=0;
Richting=4;
Test=true;
Rg=105;
 X=random(0,600);
  Y=random(280,320);
  Xb= random(1,7);
  Yl= random(-100,100);
  R=random(0,200);
  B=random(0,200);
  G=random(0,200);
  tandenX=MonsterX-40;
  spatie=10;
  stop=8;
  loopX=0;

}

void draw(){
  background(R,B,G);
  
  scale(0.2);

  
stroke(0);
fill(105,0,0);
ellipse(MonsterX,mouseY*5,100,60);
//muts
stroke(0);
fill(R,0,150);
rect(MonsterX-50,mouseY*5,100,130);
//lichaam
stroke(0);
fill(255);
rect(MonsterX-50,mouseY*5+30,100,20);

stroke(0);
while(loopX<stop){
  line(tandenX,mouseY*5+30,tandenX,mouseY*5+50);
  loopX=loopX+1;
  tandenX=tandenX+spatie;
}
stroke(0);
fill(255);
ellipse(MonsterX,mouseY*5+15,50,25);
//oog
stroke(0);
fill(255,0,0);
ellipse(MonsterX,mouseY*5+15,30,15);
stroke(0);
fill(0,0,0);
ellipse(MonsterX,mouseY*5+15,15,10);
//oog
stroke(0);
fill(255,255,0);
rect(MonsterX-50,mouseY*5+50,100,5);
//bling
stroke(0);
fill(255,255,0);
rect(MonsterX-20,mouseY*5+55,40,20);
//bling

tandenX=tandenX+Richting;
tandenX=constrain(tandenX,0,1000);
if(tandenX<=0 || tandenX>=1000){
Richting=-Richting;
}

MonsterX=MonsterX+Richting; 

MonsterX= constrain(MonsterX,0,1000);

if(MonsterX <=0 || MonsterX>=1000){
  Richting=-Richting;}
  
if(MonsterX <=0 || MonsterX>=1000){
  kantraak=kantraak+1;
}

if(kantraak>=10){
  Test =!Test;
}

if(Test=true){
  Rg=Rg+100;
}

println(kantraak);
}
