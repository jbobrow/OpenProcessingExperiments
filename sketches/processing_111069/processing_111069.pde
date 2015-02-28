
boolean a=false;
boolean b=true;
boolean t=false;
boolean i=false;
int x=1;
int c=255;
int n=0;
int d=255;
float big=0.4;
float small=-0.4;
float s=big;
float rad=0.1;
float change=2;
float y=475;
float z=475;
int asdf=0;
float length= random(0,450);
float wide= random(0,450);
import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup () {
  background(255);
  size(600, 600,P3D);
  strokeWeight(3);
  frameRate(150);
   smooth();
    minim = new Minim(this);
    player = minim.loadFile("museum_mix.wav");
}

void draw() {
  if(i==true){
   translate(0,0);
  background(0);
  textAlign(CENTER);
  fill(255);
   textSize(20);
   text("This interactive program was inspired by the pieces' mutual ability to evoke emotion, even if the viewer doesn't immediately understand their purpose.",50,50,500,500);
   text("\"Robert Goddard\" (1995) Nam June Paik",50,300,500,400);
   text("\"Holding Tight\" (1998) Catherine McCarthy",50,400,500,400);
   text("Press backspace to start over",50,550,500,400);
  }else{
if (a==true){
  translate(0,0);
  background(0);
  textAlign(CENTER);
  textSize(25);
  fill(255);
  text("You have given up.",100,250,400,400);
  textSize(20);
  text("Press backspace to start over",50,450,500,400);
   text("Press i for information about the inspiration",50,500,500,400);
}else{
    if(c<19){
  background(0);
  fill(255);
  textSize(25);
  text("Get it?",100,250,400,400);
   textSize(20);
   text("Press backspace to start over",50,425,500,400);
   text("Press i for information about the inspiration",50,500,500,400);
}else{if (b==true) {
  background(c);
  textAlign(CENTER);
  textSize(30);
  fill(0);
   text("If you want to stop at any point, click delete. The point of this experience is to understand its purpose. Click Enter to begin.",100,150,400,400);
    textSize(20);
    text("Press i for information about the inspiration",10,500,580,400);
}else{
if(b==false){if (t==true){
  translate(0,0);
    background(c);
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text("Press "+ x,100,100,400,400);
 }else{ 
   if(abs(z+y)<1){
    translate(0,0);
    if(change>90){
    s=small;
  }
    if(rad>900){
   change=change+s;
   rad=0.1;
    if(d==255){
    d=0;}else{
    if(d==0){
    d=255;}}
 }
    fill(d);
    ellipse(300,300,rad,rad);
    rad=rad+change;
    if((change<4.1)&&(s==small)&&(d==0)){
      t=true;}
}else{
  if(n>1200){
  translate(0,0);
  stroke(random(0,255));
  line(width/2,height/2,cos(radians(asdf))*z+300,sin(radians(asdf))*y+300);
  asdf=asdf+1;
  rotate(radians(frameCount`00));
  z=z-0.192;
  y=y-0.192;
  }else{
    frameRate(60);
  translate(width/2,height/2);
  rotate(radians(frameCount000));
  noFill();
  stroke(random(0,255));
  ellipse(0,0,length,wide);
  length= random(0,550);
  wide= random(0,550);
  n=n+1;
  if(n==1200){
    background(255);
    n=n+1;}
  }}}}else{
     }}}}}}
 
 void keyPressed() {
   if(key=='i'){
     i=true;
     b=false;
     a=false;
     t=false;
   }
  if (key==DELETE) {
    a=true;
    b=false;
    player.pause();
    i=false;
  }
  if((key==BACKSPACE)&&(b==false)){
    b=true;
    a=false;
    i=false;
  t=false;
   x=(int)random(0,9);
    player.pause(); 
    a=false;
    t=false;
    x=0;
    c=255;
    n=0;
    d=255;
    big=2;
    small=-2;
    s=big;
    rad=0.1;
    change=3;
    y=475;
    z=475;
    asdf=0;
    length= random(0,450);
    wide= random(0,450);
    frameRate(150);
    background(255);
}
  if ((key==ENTER)&&(b=true)) {
    i=false;
    x=(int)random(0,9);
    player.loop();
    b=false;  
    a=false;
    t=false;
    x=0;
    c=255;
    n=0;
    d=255;
    big=2;
    small=-2;
    s=big;
    rad=0.1;
    change=3;
    y=475;
    z=475;
    asdf=0;
    length= random(0,450);
    wide= random(0,450);
    frameRate(150);
    background(255);
  }
  if (x==0){if (key=='0') {
     x=(int)random(1,9);
     if(x==0){
       x=1;}
    t=true;
    c=c-8;
  }}
 if (x==1){if (key=='1') {
     x=(int)random(1,9);
     if(x==1){
       x=2;}
    t=true;
    c=c-8;
  }} 
  if (x==2){if (key=='2') {
     x=(int)random(1,9);
     if(x==2){
       x=3;}
    t=true;
    c=c-8;
  }} 
  if (x==3){if (key=='3') {
     x=(int)random(1,9);
     if(x==3){
       x=4;}
    t=true;
    c=c-5;
  }} 
  if (x==4){if (key=='4') {
     x=(int)random(1,9);
    if(x==4){
       x=5;}
    t=true;
    c=c-8;
  }} 
  if (x==5){if (key=='5') {
     x=(int)random(1,9);
    if(x==5){
       x=6;}
    t=true;
    c=c-8;
  }} 
  if (x==6){if (key=='6') {
     x=(int)random(1,9);
    if(x==6){
       x=7;}
    t=true;
    c=c-8;
  }} 
  if (x==7){if (key=='7') {
     x=(int)random(1,9);
    if(x==7){
       x=8;}
    t=true;
    c=c-8;
  }} 
  if (x==8){if (key=='8') {
     x=(int)random(1,9);
    if(x==8){
       x=9;}
    t=true;
    c=c-8;
  }} 
  if (x==9){if (key=='9') {
     x=(int)random(1,9);
    if(x==9){
       x=0;}
    t=true;
    c=c-8;
  }}}
