
size(250,250); 
smooth(); 

strokeWeight(1);
for(
int i=0; i<260; i+=5)
    for(
int j=0; j<260; j+=5) 
  {
    line(i,j,i+random(10),j+5);
    line(i,j,i-random(10),j+5);
  } 

strokeWeight(0.5); 
stroke(100,100,255,100);
for(
int i=0; i<250; i+=5)
    for(
int j=0; j<250; j+=5) 
  {
    line(i,j,i+random(10),j+5);
    line(i,j,i-random(10),j+5);
  } 



strokeWeight(.5);
noFill();
for(
int k=15; k<250; k+=40)
    for(
int k2=35; k2<250; k2+=40)
      for(
int l=0; l<500; l+=30)
        for(
int l2=15; l2<500; l2+=30)
        {
          stroke(70,50,100,100);
          ellipse(k,l,30,10);
          ellipse(k2,l2,30,10);
          stroke(50,30,70,100);
          ellipse(k,l,35,15);
          ellipse(k2,l2,35,15);
          stroke(30,10,40,100);
          ellipse(k,l,40,20);
          ellipse(k2,l2,40,20);
        }

fill(40,20,70,100);
noStroke();
rect(0,0,250,250);


strokeWeight(1);
stroke(255,100);
fill(255,10);
for(
int m=20; m<250; m*=2)
for(
int a=40; a<250; a+=120)
for(
int b=60; b<250; b+=120)
for(
int c=120; c<250; c+=120)
{
ellipse(a,b, m,m);
ellipse(b,c,m,m);
ellipse(c,a,m,m);
}

