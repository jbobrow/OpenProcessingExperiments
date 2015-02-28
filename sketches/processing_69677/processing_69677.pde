
PFont tipo_letra;
int x=0,y=0,x1=0,y1=0,x2=0,y2=0,x3=0,y3=0,x4=0,y4=0;
char[] var={'J','o','r','g','e'};
void setup(){
size(700,400);
frameRate(100);
tipo_letra=loadFont("SansSerif.italic-48.vlw");
}
void draw(){
background(0);
textFont(tipo_letra,86);
 
if((x!=200) && (y!=200)){
x=int(random(699));
y=int(random(399));
text(var[0],x,y);
}
else{
text(var[0],200,200);
}

if((x1!=250) && (y1!=200)){
x1=int(random(699)) ;
y1=int(random(399)) ;
text(var[1],x1,y1);
}
else{
text(var[1],250,200);
}

if((x2!=300) && (y2!=200)){
x2=int(random(699)) ;
y2=int(random(399)) ;
text(var[2],x2,y2);
}
else{
text(var[2],300,200);
}

if((x3!=350) && (y3!=200)){
x3=int(random(699)) ;
y3=int(random(399)) ;
text(var[3],x3,y3);
}
else{
text(var[3],345,200);
}

if((x4!=400) && (y4!=200)){
x4=int(random(699)) ;
y4=int(random(399)) ;
text(var[4],x4,y4);
}
else{
text(var[4],400,200);
}
}

