
int kantraak;
float MonsterX;
float Richting;
boolean Test;
int R;


void setup(){
size (200,200);
MonsterX=1;
kantraak=0;
Richting=4;
Test=false;
R=105;

}

void draw(){
  

  
  scale(0.2);
background(255,255,255);
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
rect(MonsterX-50,mouseY*5+30,20,10);
stroke(0);
//tanden
fill(255);
rect(MonsterX-30,mouseY*5+30,20,10);
stroke(0);
fill(255);
rect(MonsterX-10,mouseY*5+30,20,10);
stroke(0);
fill(255);
rect(MonsterX+10,mouseY*5+30,20,10);
stroke(0);
fill(255);
rect(MonsterX+30,mouseY*5+30,20,10);
stroke(0);
fill(255);
rect(MonsterX-50,mouseY*5+35,20,10);
stroke(0);
fill(255);
rect(MonsterX-30,mouseY*5+35,20,10);
stroke(0);
fill(255);
rect(MonsterX-10,mouseY*5+35,20,10);
stroke(0);
fill(255,255,0);
rect(MonsterX+10,mouseY*5+35,20,10);
stroke(0);
fill(255);
rect(MonsterX+30,mouseY*5+35,20,10);
//tanden
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

MonsterX=MonsterX+Richting; 
MonsterX= constrain(MonsterX,0,1000);

if(MonsterX <=0 || MonsterX>=1000){
  Richting=-Richting;
kantraak=kantraak+1;}

if(kantraak>=10){
  Test =!Test;
}

if(Test=true){
  R=R+100;
}

println(Test);
}
