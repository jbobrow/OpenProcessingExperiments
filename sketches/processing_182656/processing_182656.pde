
size(500,500);background(20);
//lines
for(int i=0; i<500; i=i+16){
  for(int x=0; x<500;x=x+20){
    float r = random(400);
float l = random(255);
float m = random(200);
float n = random(240);
stroke(l,m,n);
noFill();
line(250,250,i,x); 
}
}
//ellipses
for(int i=0; i<350; i=i+3)
{ float r = random(350);
float l = random(100);
float m = random(200);
float n = random(255);
stroke(l,m,n);
noFill();
ellipse(250,250,i,r); 
}
