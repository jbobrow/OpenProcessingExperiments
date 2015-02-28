
size(250,250); 
smooth(); 
background(50,0,0);


strokeWeight(0.5);
stroke(200,0,0);
for(
int i=0; i<260; i+=5)
    for(
int j=0; j<260; j+=5) 
  {
    line(i,j,i+random(20),j+random(10));
    line(i,j,i-random(20),j+random(10));
  } 


for(
  int l=0; l<250; l+=4)
    for(
  int k=0; k<250; k+=4)
  {
    float ran2=random(180);
    strokeWeight(2);
    stroke(0,120);
    line(0,k,250,k);
    line(0,k,250,k);
    strokeWeight(1.5);
    stroke(255,150);
    line(250,k,ran2+100,k);
    line(250,k,ran2+80,k);
    line(250,k,ran2+60,k);
    line(250,k,ran2+40,k);
    line(250,k,ran2+20,k);
  }

strokeWeight(1);
stroke(127,50);
for(
int i=0; i<260; i+=5)
    for(
int j=0; j<260; j+=5) 
  {
    line(i,j,i+random(20),j+random(10));
    line(i,j,i-random(20),j+random(10));
  } 

