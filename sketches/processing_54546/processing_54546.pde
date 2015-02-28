
//pelotita colores
int stop;
int hor;
int ver;
 
void setup(){
size(350,350);
smooth();
hor=0;
stop=0;
ver=0;
 
noStroke();
fill(random(60),random(60),random(60),random(60));
 
}
void draw(){
background(random(150),random(100),random(10));
ellipse(hor+40,ver+40,70,70);
 fill (200,0,200);
 if (stop==0){
hor=hor+1;
fill(random(180),(75),(0));
}
 
if (hor>200){
  stop=1;
}
if (stop==1){
ver=ver+1;
fill(random(125),(0),(80));
 
}
if(ver>200){
stop=2;
}
if (stop==2){
hor=hor-1;
fill(random(105),(209),(150));
 
}
 
if (hor==0){
stop=3;
}
if (stop==3){
ver=ver-1;
fill(random(158),(74),(80));
 
}
if (ver==0){
stop=0;
 
}
}

