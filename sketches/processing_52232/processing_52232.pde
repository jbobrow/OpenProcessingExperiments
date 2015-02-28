
// Inicio
int stop;
int horizontal;
int vertical;

void setup(){
size(300,300);
smooth();
horizontal=0;
stop=0;
vertical=0;

noStroke();
fill(random(25),random(25),random(25),random(25));

}
void draw(){
background(0);
ellipse(horizontal+50,vertical+50,50,50);
 fill (200,0,200);
 if (stop==0){
horizontal=horizontal+1;
fill(random(190),(89),(0));
}

if (horizontal>200){
  stop=1;
}
if (stop==1){
vertical=vertical+1;
fill(random(108),(0),(80));

}
if(vertical>200){
stop=2;
}
if (stop==2){
horizontal=horizontal-1;
fill(random(80),(49),(80));

}

if (horizontal==0){
stop=3;
}
if (stop==3){
vertical=vertical-1;
fill(random(158),(74),(80));

}
if (vertical==0){
stop=0;

}
}




